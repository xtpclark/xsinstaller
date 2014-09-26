#!/bin/bash
#set -vx
# set -eu
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
echo "working dir is $DIR"


setup()
{
WORKING=$DIR
RT53SET=${WORKING}/ini/rt53settings.ini
PLAN=${WORKING}/planin
CERTDIR=${WORKING}/certs
MIG=${WORKING}/xtupledb
RT53DIR=${WORKING}/route53
REPORTDIR=${WORKING}/report
CUSTLOGDIR=${WORKING}/custlogs
SQLDIR=${WORKING}/sql
SCRIPTDIR=${WORKING}/scripts
BAKDIR=${WORKING}/xtupledb

DEPS='awscli jq s3cmd wget pwgen tree'
DIRS='planin xtupledb route53 report scripts certs logs mail custlogs sql ini'

#Setup Directories
echo "Creating local directories"
mkdir -p $DIR/ $DIRS
echo "Created ${DIR}/ ${DIRS}"

#Install other packages
echo "Installing other system dependencies if needed"
for DEP in $DEPS; do
dpkg -s ${DEP} 2>/dev/null >/dev/null || sudo apt-get -y install ${DEP}
done
echo "All dependencies up to date"
echo ""
xtupleserverchk
echo ""
sslchk
echo ""
s3chk
echo ""
dbchk
echo ""
sqlchk
echo ""
setrt53
echo "We can get to work now."
echo ""
}

sqlchk()
{
echo "Checking for getpkgver.sql"
if [ -e $SQLDIR/getpkgver.sql ]
then
echo "File exists"
else
echo "Creating getpkgver.sql"
cat << EOF > $SQLDIR/getpkgver.sql
-- Function: public.getpkgver(text)

-- DROP FUNCTION public.getpkgver(text);

CREATE OR REPLACE FUNCTION public.getpkgver(text)
  RETURNS text AS
$BODY$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  pPkgName ALIAS FOR $1;
  _returnVal TEXT;
BEGIN
  IF (pPkgName IS NULL) THEN
        RETURN NULL;
  END IF;

  SELECT pkghead_version INTO _returnVal
  FROM pkghead
  WHERE (pkghead_name=pPkgName);

  IF (_returnVal IS NULL) THEN
        RAISE EXCEPTION 'Package % not found.', pPkgName;
  END IF;

  RETURN _returnVal;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION public.getpkgver(text)
  OWNER TO admin;
EOF
fi
}

s3chk()
{
echo "Checking for AWS dependencies"
S3CHK='s3cmd aws'

for PART in $S3CHK; do

if [ -z `which $PART` ]
then
echo "Cannot find ${PART}! It might be ok."
fi
done

echo "Looks good. Found: ${S3CHK}!"
echo "Checking aws configs"
if [ -f ~/.aws/config ]
then
echo "Found AWS-CLI config: ~/.aws/config"
else
echo "AWS Commands won't work! You should create ~/.aws/config"
fi

if [ -f ~/.s3cfg ]
then
echo "Found s3cmd config: ~/.s3cfg"
else
echo "AWS s3cmd won't work! You should create ~/.s3cfg (Run s3cmd --configure)"
fi

}


sslchk()
{
#Checking xTupleDBs directory
SSLCHK=`ls ${CERTDIR}/* 2>/dev/null | wc -l`
echo "Checking for SSL Certs/Keys in ${CERTDIR}"
if [ $SSLCHK = 0 ]
 then
  echo "SSL Certs not found in ${SSLCHK}."
  echo "This might cause a problem. Creating a self-signed one anyway"
  openssl genrsa -des3 -out ${CERTDIR}/server.key -passout pass:admin 1024
  openssl rsa -in ${CERTDIR}/server.key -passin pass:admin -out ${CERTDIR}/key.pem -passout pass:admin
  openssl req -batch -new -key ${CERTDIR}/key.pem -out ${CERTDIR}/server.csr
  openssl x509 -req -days 365 -in ${CERTDIR}/server.csr -signkey ${CERTDIR}/key.pem -out ${CERTDIR}/server.crt
 else
  echo "Looks good. Put .crt and .key files in ${CERTDIR}"
fi
}

dbchk()
{
#Checking xTupleDBs directory
BAKCHK=`ls ${BAKDIR}/*.backup 2>/dev/null | wc -l`
echo "Checking for xTuple Databases in ${BAKDIR}"
if [ $BAKCHK = 0 ]
 then
  echo "Downloading an example PostBooks Database and running this check again."
  PBCMD="wget --quiet -O ${BAKDIR}/postbooks-example.backup http://bit.ly/1pg2wfv"
  GET_PB=`$PBCMD`
  dbchk
 else
  echo "Looks good. Put .backup files in ${BAKDIR}"
fi
}

xtupleserverchk()
{
echo "Checking xtuple-server dependencies"

XTCHK='xtupled xtuple-server npm n psql'

for PART in $XTCHK; do

if [ -z `which $PART` ]
then
echo "Cannot find ${PART}! Fix your server!"
echo "Do you want to run bootstrap, etc? Need a BIG 'YES' here..."
read FIXSERVER
case $FIXSERVER in
YES)
wget xtuple.com/bootstrap -qO- | sudo bash
npm install -fg xtuple-server-commercial
sudo xtuple-server setup
;;
*)
echo "Nope..."
exit 3;
;;
esac

fi
done
echo "Looks good. Found: ${XTCHK}!"
}

setrt53()
{
echo "Checking Route53 Settings"
if [ -e $RT53SET ]
 then
  echo "${RT53SET} Exists, reading settings"
   XTDOMAIN=`grep XTDOMAIN ${RT53SET} | cut -d':' -f2`
   AWSDNSALIAS=`grep AWSDNSALIAS ${RT53SET} | cut -d':' -f2`
   AWSZONEID=`grep AWSZONEID ${RT53SET} | cut -d':' -f2`
echo "Using: $XTDOMAIN $AWSDNSALIAS $AWSZONEID"
 else 


  echo "Creating Route53 Config"
  echo "Set the domain to create records in"
  echo "i.e. mydomain.com"
read XTDOMAIN

 echo "Set the AWSDNSAlias"
 echo "i.e. myproxyhost.xtuplecloud.com"
read AWSDNSALIAS

 echo "Set the AWS Zone ID"
 echo "i.e. ZEEBEEDEEDOODAH"
read AWSZONEID

cat << EOF > $RT53SET
XTDOMAIN:${XTDOMAIN}
AWSDNSALIAS:${AWSDNSALIAS}
AWSZONEID:${AWSZONEID}
EOF

echo "Wrote: ${RT53SET}"
echo "XTDOMAIN:${XTDOMAIN}"
echo "AWSDNSALIAS:${AWSDNSALIAS}"
echo "AWSZONEID:${AWSZONEID}"
fi
}



XTADMIN=admin


banner(){
echo "Hi there ${USER} ! This will create a new customer db and mobilize it!"
}

setcust(){
echo "Enter Customer (xTuple CRM Account Number)"
read CUST
CUST="$(echo ${CUST} | tr '[A-Z]' '[a-z]')"
XTCRMACCT=$CUST
if [ -z $CUST ]; then
echo "Need to enter a customer!"
sleep 1
clear
setcust
else
echo "Using $CUST"
CUSTLOG=${CUSTLOGDIR}/${CUST}.log
fi
INSCRIPT=${SCRIPTDIR}/${CUST}_installer.sh
UNSCRIPT=${SCRIPTDIR}/${CUST}_uninstaller.sh
}

setxtuser()
{
XTUSER=admin
}

setpass()
{
echo "Set Admin Password (or empty to generate)"
read XTPASS
if [ -z  $XTPASS ]; then
XTPASS=`pwgen -1`
## XTPASS=xTuple\!PrivateDemo2014
echo "using $XTPASS "
else
XTPASS=$XTPASS
echo "using $XTPASS "
fi
}

setghuserpass()
{
echo "Set Github User/Pass"
echo "Enter Username:"
read GHUSER
echo "Enter Password:"
read GHPASS
echo "Using ${GHUSER}/${GHPASS}"
}

setver()
{
PS3="Select an xTuple Version: "
TAGS=`git ls-remote --tags git://github.com/xtuple/xtuple.git | tail -10 | cut -d '/' -f 3 | cut -d v -f2`

select XTVER in ${TAGS};
do
 echo "You picked $XTVER ($REPLY)"
  XTVER=$XTVER
 break
done

#echo "Enter Version (default 4.6.0-1)"
#read XTVER

if [ -z $XTVER ]; then
XTVER=4.6.0-1
echo "using $XTVER"
else
XTVER=$XTVER
echo "using $XTVER"
fi
}


getback()
{
PS3="Select a backup: "
BKLIST=`ls ${MIG}/*.backup`
echo "Listing backups.."
sleep 1
select BACKUPNAME in $BKLIST;
do
 echo "You picked $BACKUPNAME ($REPLY)"
 CUSTDB=$BACKUPNAME
 break
done

if [ -z $CUSTDB ]; then
echo "You need to enter something/someone!"
sleep 2
clear
getback
fi
}

renamedb()
{
echo "Selected $CUSTDB to use as a template."
echo "We're going to symlink the name to it."
echo "Enter a name to call this, or use $CUST as a default name."
echo "We'll add a type later i.e. pilot, live, dev etc"
echo "Enter new name for ${CUSTDB}: or hit ENTER to use ${CUST}"
echo "Leave off the .backup extension!"
read NEWDBNAME
DBEXT='bak'

if [ -z  $NEWDBNAME ]; then

NEWDBNAME=${CUST}.${DBEXT}
ln -s ${CUSTDB} ${MIG}/${NEWDBNAME}
CUSTDB=${MIG}/${NEWDBNAME}
else
NEWDBNAME=${NEWDBNAME}.${DBEXT}
ln -s ${CUSTDB} ${MIG}/${NEWDBNAME}
CUSTDB=${MIG}/${NEWDBNAME}
fi
echo "$CUSTDB Symlinked "
echo "using $NEWDBNAME as template"
}


settype()
{
PS3="Select an Installation Type for $CUSTDB: "
TYPES='pilot live'

select TYPE in ${TYPES};
do
 echo "You picked $TYPE ($REPLY)"
 break
done

if [ -z $TYPE ]; then
echo "Select a type!"
clear
settype
fi
}

setedition()
{
PS3="Set the xTuple Edition: "
EDITIONS='enterprise standard postbooks'

select EDITION in ${EDITIONS};
do
 echo "You picked $EDITION ($REPLY)"
 break
done

if [ -z $EDITION ]; then
echo "Select an Edition!"
clear
setedition
fi
}

setssl()
{
echo "Set the SSL Cert and Key"
PS3="Select the SSL Cert: "
CERTS=`ls $CERTDIR/*.crt`
KEYS=`ls $CERTDIR/*.key`
select CERT in ${CERTS};
 do
  echo "Selected $CERT"
   PS3="Select the Key: "
   select KEY in ${KEYS};
    do
     echo "Selected $KEY"
   break
  done
 break
done

}

makedns()
{
RT53JSON=${RT53DIR}/create_${XTCRMACCT}_rt53.json
cat << EOF > ${RT53JSON}
{ "Comment":"Create record for $XTCRMACCT on Route 53",  "Changes": [ {"Action": "CREATE", "ResourceRecordSet":  {  "Name": "${XTCRMACCT}.${XTDOMAIN}.", "Type": "CNAME", "TTL": 60, "ResourceRecords":  [ {"Value": "${AWSDNSALIAS}" } ] }  }  ] }
EOF

RT53JSON_DELETE=${RT53DIR}/delete_${XTCRMACCT}_rt53.json
cat << EOF > ${RT53JSON_DELETE}
{ "Comment":"Delete record for $XTCRMACCT on Route 53",  "Changes": [ {"Action": "DELETE", "ResourceRecordSet":  {  "Name": "${XTCRMACCT}.${XTDOMAIN}.", "Type": "CNAME", "TTL": 60, "ResourceRecords":  [ {"Value": "${AWSDNSALIAS}" } ] }  }  ] }
EOF

}

dodns()
{
echo "Adding DNS Record to Route53"
RT53ADD="aws route53 change-resource-record-sets --hosted-zone-id ${AWSZONEID} --change-batch file://${RT53JSON}"
RT53ADDCMD=`${RT53ADD}`

RT53DEL="aws route53 change-resource-record-sets --hosted-zone-id ${AWSZONEID} --change-batch file://${RT53JSON_DELETE}"
##RT53DELCMD=`RT53DEL`

echo ${RT53ADDCMD} >> ${INSCRIPT}
echo ${RT53DELCMD} >> ${UNSCRIPT}

}


checkdns()
{
XTFQDN=${XTCRMACCT}.${XTDOMAIN}
XTFQDN="$(echo ${XTFQDN} | tr '[A-Z]' '[a-z]')"

DNSEXISTS=`getent hosts ${XTFQDN}`
if [[ -n "$DNSEXISTS" ]]
then
      echo "${XTFQDN} exists already"
      true
else
echo "${XTFQDN} Does Not Exist  - creating"
makedns
dodns
fi

}


previewruncmd()
{
echo "Here is your Command Preview:
sudo xtuple-server install-${TYPE}
--xt-name ${CUST} --xt-version ${XTVER} --xt-edition enterprise
--xt-ghuser ${GHUSER} --xt-ghpass ${GHPASS} --xt-maindb ${CUSTDB}
--xt-authkey xTuple --xt-adminpw ${XTPASS}
--nginx-domain ${XTFQDN}
--nginx-incrt ${CERT}
--nginx-inkey ${KEY}
--pg-worldlogin --pg-version 9.3"

INSTALLCMD="sudo xtuple-server install-${TYPE} --xt-name ${CUST} --xt-version ${XTVER} --xt-edition ${EDITION} --xt-ghuser ${GHUSER} --xt-ghpass ${GHPASS} --xt-maindb ${CUSTDB} --xt-authkey xTuple --xt-adminpw ${XTPASS} --nginx-domain ${XTFQDN}  --nginx-incrt ${CERT} --nginx-inkey ${KEY}  --pg-worldlogin --pg-version 9.3"
UNINSTALLCMD="sudo xtuple-server uninstall-${TYPE} --xt-name ${CUST} --xt-version ${XTVER} --xt-edition ${EDITION} --xt-adminpw ${XTPASS} --nginx-domain ${XTFQDN} --pg-version 9.3"

echo ${INSTALLCMD} >> ${INSCRIPT}
echo ${UNINSTALLCMD} >> ${UNSCRIPT}

}

runcmd()
{
run_cmd=`$INSTALLCMD` | grep 'info sys-report' | cut -d' ' -f4-100 >> ${CUSTLOG}

#sudo xtuple-server rename-database pilot --xt-name firetrucks --xt-version 4.6.0-1  --xt-edition enterprise --pg-dbname masterref_460_pilot --pg-newname firetrucks_pilot

}

startnode()
{
sudo service xtuple start
}

dbcleanup()
{
NEWPORTLIST=`pg_lsclusters -h`
CUSTPORT=`echo "$NEWPORTLIST" | sed "s/^ *//;s/ *$//;s/ \{1,\}/ /g" | grep $XTCRMACCT | cut -d' ' -f3`

DB=${CUST}_${TYPE}
PGCMD="psql -At -U ${XTADMIN} -p ${CUSTPORT} ${DB} "

echo "Adding All Extensions to admin user"
${PGCMD} -c "SELECT xt.js_init(); DELETE FROM xt.usrext WHERE usrext_usr_username='${XTADMIN}'; INSERT INTO xt.usrext(usrext_usr_username,usrext_ext_id) SELECT '${XTADMIN}', ext_id FROM xt.ext;"


$PGCMD -q < $SQLDIR/getpkgver.sql
XTDETAIL=`$PGCMD -c \
"SELECT data FROM ( \
SELECT 1,'Co: '||fetchmetrictext('remitto_name') AS data \
UNION \
SELECT 2,'Ap: '||fetchmetrictext('Application')||' v.'||fetchmetrictext('ServerVersion') \
UNION \
SELECT 4,'Pk: '||pkghead_name||':'||getpkgver(pkghead_name) \
FROM pkghead) as foo ORDER BY 1;"`
}

makereport()
{

REPORT=$REPORTDIR/${CUST}_Report.log
cat << EOF >> $REPORT
Customer: ${CUST}
Version: ${XTVER}
Edition: ${EDITION}

MobileURL: $XTFQDN
AdminUser: $XTADMIN
AdminPass: $XTPASS

==Desktop Client Information==
Server: $XTFQDN
Port: $CUSTPORT
Database: ${DB}

==Details for ${DB}==
$XTDETAIL
EOF

}


banner
setup
setcust
setver
getback
renamedb
settype
setedition
setpass
setghuserpass
checkdns
setssl
previewruncmd

echo "Do you want to run it actually?"
read RUNIT
case $RUNIT in
Y|y)
echo "Ok, Running..."
runcmd
;;
*)
echo "Not Gonna do it!"
exit 0;
;;
esac

echo "Starting node, adding extensions, making report"
startnode
dbcleanup
makereport

exit 0;
