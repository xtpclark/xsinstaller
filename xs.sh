#!/bin/bash
#set -vx
# set -eu
EDITOR=vi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
echo "Working dir is $DIR"

#TMOUT=15

WORKDATE=`/bin/date "+%m%d%y_%s"`
PLAINDATE=`date`


enviro()
{
WORKING=$DIR
SETS=${WORKING}/ini/settings.ini
PLAN=${WORKING}/planin
CERTDIR=${WORKING}/certs
MIG=${WORKING}/xtupledb
RT53DIR=${WORKING}/route53
REPORTDIR=${WORKING}/report
CUSTLOGDIR=${WORKING}/custlogs
SQLDIR=${WORKING}/sql
SCRIPTDIR=${WORKING}/scripts
BAKDIR=${WORKING}/xtupledb
GLOBALDIR=${WORKING}/globals
STARTXS=`date "+%T"`
}

pre()
{
enviro
echo "Checking environment"
if [ ! -f ~/.xsinstaller ]
then
echo "Writing .xsinstaller"
touch ~/.xsinstaller
setup
echo "Checking environment again"
pre
else
enviro
setrt53
echo "Set Env"
fi
}

setservertype()
{
PS3="Select ServerType: Mobile or Non-Mobile "
echo "Is this a mobile xtuple install or a non-mobile xtuple install?"
SERVERTYPES="mobile non-mobile"

select SERVERTYPE in ${SERVERTYPES};
do
  echo "You picked $SERVERTYPE ($REPLY) "
  break
done
if [ -z $SERVERTYPE ]; then
echo "Select a server type! "
clear
setservertype
fi
}



setup()
{

DEPS='awscli jq s3cmd wget pwgen tree python-magic'
DIRS='planin xtupledb route53 report scripts certs logs mail custlogs sql ini global'

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
echo""
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
cat << EOF > ${SQLDIR}/getpkgver.sql
-- Function: public.getpkgver(text)

-- DROP FUNCTION public.getpkgver(text);

CREATE OR REPLACE FUNCTION public.getpkgver(text)
  RETURNS text AS
\$BODY\$
-- Copyright (c) 1999-2014 by OpenMFG LLC, d/b/a xTuple.
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  pPkgName ALIAS FOR \$1;
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
\$BODY\$
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
echo "Do you want to run aws configure ?"
OPTS='yes no'
  select OPT in $OPTS
    do
       if [ $OPT = 'yes' ]
        then
        aws configure
        break
         else
        echo "leaving"
        break 
     fi
     done

 fi

if [ -f ~/.s3cfg ]
then
echo "Found s3cmd config: ~/.s3cfg"
else
echo "AWS s3cmd won't work! You should create ~/.s3cfg (Run s3cmd --configure ?)"
OPTS='yes no'
  select OPT in $OPTS
    do
       if [ $OPT = 'yes' ]
        then
        s3cmd  --configure
        break
         else
        echo "leaving"
        break 
     fi
     done



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

XTCHK='xtupled xtuple-server npm n psql nginx'

for PART in $XTCHK; do

if [ -z `which $PART` ]
then
echo "Cannot find ${PART}! Fix your server!"
echo "Do you want to run bootstrap, etc? Need a BIG 'YES' here..."
read FIXSERVER
case $FIXSERVER in
YES)
echo "Run Bootstrap? [ YES | NO ]"
read BOOTSTRAP
case $BOOTSTRAP in
YES)
BSCMD="wget --quiet -O ${DIR}/bootstrap.sh http://www.xtuple.com/bootstrap"
GETBS=`$BSCMD`
chmod 755 ${DIR}/bootstrap.sh
RUNBS=`sudo ${DIR}/bootstrap.sh`
;;
NO)
echo "Skipping Bootstrap"
;;
esac

echo "Run NPM Install? [ YES | NO ]"
read NPMINSTALL
case $NPMINSTALL in
YES)
NPMCMD="npm install -fg xtuple-server-commercial"
RUNNPM=`$NPMCMD`
;;
NO)
echo "Skipping NPM Install"
;;
esac

echo "Run xtuple-server setup? [ YES | NO ]"
read XSSETUP
case $XSSETUP in
YES)
XSETUPCMD="sudo xtuple-server setup"
RUNXS=`$XSETUPCMD`
;;
NO)
echo "Skipping xtuple-server Setup"
;;
esac

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
if [ -e $SETS ]
 then
  echo "${SETS} Exists, reading settings"
   XTDOMAIN=`grep XTDOMAIN ${SETS} | cut -d':' -f2`
   AWSDNSALIAS=`grep AWSDNSALIAS ${SETS} | cut -d':' -f2`
   AWSZONEID=`grep AWSZONEID ${SETS} | cut -d':' -f2`
   MTO=`grep MTO ${SETS} | cut -d':' -f2`

export EMAIL=xsinstaller@${AWSDNSALIAS}


echo "Using: $XTDOMAIN $AWSDNSALIAS $AWSZONEID, sending emails to ${MTO}"
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

 echo "Set an Email address to send the install report to"
 echo "i.e. admin@example.com"
read MTO

cat << EOF > $SETS
XTDOMAIN:${XTDOMAIN}
AWSDNSALIAS:${AWSDNSALIAS}
AWSZONEID:${AWSZONEID}
MTO:${MTO}
EOF

echo "Wrote: ${SETS}"
echo "XTDOMAIN:${XTDOMAIN}"
echo "AWSDNSALIAS:${AWSDNSALIAS}"
echo "AWSZONEID:${AWSZONEID}"
echo "MTO:${MTO}"
fi
}

settype()
{
CMD="sudo xtuple-server"
PARAM="install-"

echo "Select the type of installation"
PS3="Select an Installation Type: "
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
PARAM="${PARAM}${TYPE}"
CMD+=" ${PARAM}"
}




XTADMIN=admin


banner(){
echo "Hi there ${USER} ! This will create a new customer db and mobilize it!"
}


setcust(){
PARAM="--xt-name"
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
CUSTLOG=${CUSTLOGDIR}/${CUST}_${WORKDATE}.log
echo "Enter Customer Email to send Customer Report to."
echo "Just hit enter to use default: $MTO"
read MTCUST

  if [ -z $MTCUST ]; then
   echo "Sending Customer Report email to $MTO."
    MTCUST=$MTO
  else
   echo "Sending Customer Report to $MTCUST."
  fi

fi

if [ ${SERVERTYPE}=="non-mobile" ]; then
    echo "Set a clustername, or use ${CUST}"
    read CLUSTERNAME

      if [ -z ${CLUSTERNAME} ]; then
        CLUSTERNAME=${CUST}
       else
        CLUSTERNAME=${CLUSTERNAME}
      fi
 fi

INSCRIPT=${SCRIPTDIR}/${CUST}_${WORKDATE}_installer.sh
UNSCRIPT=${SCRIPTDIR}/${CUST}_${WORKDATE}_uninstaller.sh

PARAM="${PARAM} ${CUST}"
CMD+=" ${PARAM}"

}


setxtuser()
{
XTUSER=admin
}

setpass()
{
PARAM="--xt-adminpw"
echo "Set Admin Password (or empty to generate)"
read XTPASS
if [ -z  $XTPASS ]; then
XTPASS=`pwgen -1`
echo "using $XTPASS "
else
XTPASS=$XTPASS
echo "using $XTPASS "
fi
PARAM="${PARAM} ${XTPASS}"
CMD+=" ${PARAM}"
}

setghuserpass()
{
PARAM="--xt-ghuser"
echo "Set Github User/Pass"
echo "Enter Username:"
read GHUSER
PARAM=" ${PARAM} ${GHUSER}"
CMD+=" ${PARAM}"

PARAM="--xt-ghpass"
echo "Enter Password:"
read GHPASS
echo "Using ${GHUSER}/${GHPASS}"
PARAM=" ${PARAM} ${GHPASS}"
CMD+=" ${PARAM}"
}

setver()
{
PARAM="--xt-version"
PS3="Select an xTuple Version: "
TAGS=`git ls-remote --tags git://github.com/xtuple/xtuple.git | tail -10 | cut -d '/' -f 3 | cut -d v -f2`

select XTVER in ${TAGS};
do
 echo "You picked $XTVER ($REPLY)"
  XTVER=$XTVER
 break
done

if [ -z $XTVER ]; then
XTVER=4.6.0-1
echo "using $XTVER"

else
XTVER=$XTVER
echo "using $XTVER"
fi
PARAM="$PARAM ${XTVER}"
CMD+=" $PARAM"
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
 ORIGDB=$BACKUPNAME
 CUSTDB=$BACKUPNAME
 break
done

if [ -z $CUSTDB ]; then
echo "You need to enter something!"
sleep 2
clear
getback
fi
}

getglobalback()
{
PS3="Select a globals file: "
GLOLIST=`ls ${GLOBALDIR}/*.sql`
echo "Listing globals sql backups.."
sleep 1
select GLOBACKUPNAME in $GLOLIST;
do
 echo "You picked $GLOBACKUPNAME ($REPLY)"
 break
done

if [ -z $GLOBACKUPNAME ]; then
echo "Using default init.sql instead"
GLOBACKUPNAME=${GLOBALDIR}/init.sql
fi
echo "Using $GLOBACKUPNAME"
}

renamedb()
{
PARAM="--xt-maindb"
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
DBTORESTORE=${CUSTDB}
else
NEWDBNAME=${NEWDBNAME}.${DBEXT}
ln -s ${CUSTDB} ${MIG}/${NEWDBNAME}
CUSTDB=${MIG}/${NEWDBNAME}
DBTORESTORE=${CUSTDB}

fi
echo "$CUSTDB Symlinked "
echo "using $NEWDBNAME as template"
PARAM="${PARAM} ${CUSTDB}"
echo "${PARAM}"
CMD+=" ${PARAM}"

if [ ${SERVERTYPE}=="non-mobile" ]; then
    echo "Set a dbname to restore to, or use ${CUST}_db"
    read DBRESTORE

      if [ -z ${DBRESTORE} ]; then
        DBRESTORE=${CUST}_db
       else
        DBRESTORE=${DBRESTORE}
      fi

  fi


}


setpgport()
{
PARAM="--pg-port"
echo "Set a PostgreSQL Port to bind this install to (--pg-port [integer])"
echo "Or press any-key to select next port automatically"
read XSPGPORT
if [ -z $XSPGPORT ]; then
echo "Using next available pg-port"
else
XSPGPORT=${XSPGPORT}
PARAM="${PARAM} ${XSPGPORT}"
echo "${PARAM}"
CMD+=" ${PARAM}"
fi
}

setpgworldlogin()
{
PARAM="--pg-worldlogin"
echo "Set if postgres should allow world md5 login (--pg-worldlogin [boolean])"
echo "Press any-key to accept default (TRUE)"
PS3="Select true/false: "
OPTS='true false'
select OPT in $OPTS;
do
echo "You selected $OPT ($REPLY)"
break
done;

case $OPT in
true)
XSPGWORLD="1"
;;
false)
XSPGWORLD="0"
;;
esac
echo "Using: ${PARAM} ${XSPGWORLD}" 
PARAM=" ${PARAM} ${XSPGWORLD}"
CMD+=" ${PARAM}"
}

xtauthkey()
{
PARAM="--xt-authkey"
echo "Set the xTuple Authkey to use"
echo "This should match what the QT Client"
echo "is using for Credit Card hashing"
echo "Press any key for default"
read XSAUTHKEY
if [ -z $XSAUTHKEY ]; then
XSAUTHKEY="xTuple"
else
XSAUTHKEY="${XSAUTHKEY}"
fi
echo "Using: ${PARAM} ${XSAUTHKEY}"
PARAM=" ${PARAM} ${XSAUTHKEY}"
CMD+=" ${PARAM}"
}

settypeopts()
case $TYPE in
live)

;;
esac

setedition()
{
PARAM="--xt-edition"
PS3="Set the xTuple Edition: "
EDITIONS='manufacturing distribution enterprise standard postbooks'

select EDITION in ${EDITIONS};
do
 echo "You picked $EDITION ($REPLY)"
 PARAM="${PARAM} ${EDITION}"
 CMD+=" $PARAM"
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
PARAM="--nginx-incrt"
echo "Set the SSL Cert and Key"
PS3="Select the SSL Cert: "
CERTS=`ls $CERTDIR/*.crt`
KEYS=`ls $CERTDIR/*.key`
select CERT in ${CERTS};
 do
  echo "Selected $CERT"
PARAM="${PARAM} ${CERT}"
CMD+=" ${PARAM}"

PARAM="--nginx-inkey"
   PS3="Select the Key: "
   select KEY in ${KEYS};
    do
     echo "Selected $KEY"
PARAM="${PARAM} ${KEY}"
CMD+=" ${PARAM}"
   break
  done
 break
done

}

checkdns()
{
PARAM="--nginx-domain"
XTFQDN="${XTCRMACCT}.${XTDOMAIN}"
XTFQDN="$(echo ${XTFQDN} | tr '[A-Z]' '[a-z]')"

DNSEXISTS=`getent hosts ${XTFQDN}`
if [[ -n ${DNSEXISTS} ]]
then
      echo "${XTFQDN} exists already"
      true
else
echo "${XTFQDN} Does Not Exist  - creating"
makedns
fi
PARAM="${PARAM} ${XTFQDN}"
CMD+=" ${PARAM}"
}

makedns()
{
RT53JSON=${RT53DIR}/create_${XTCRMACCT}_${WORKDATE}_rt53.json
cat << EOF > ${RT53JSON}
{ "Comment":"Create record for $XTCRMACCT on Route 53",  "Changes": [ {"Action": "CREATE", "ResourceRecordSet":  {  "Name": "${XTCRMACCT}.${XTDOMAIN}.", "Type": "CNAME", "TTL": 60, "ResourceRecords":  [ {"Value": "${AWSDNSALIAS}" } ] }  }  ] }
EOF

RT53JSON_DELETE=${RT53DIR}/delete_${XTCRMACCT}_${WORKDATE}_rt53.json
cat << EOF > ${RT53JSON_DELETE}
{ "Comment":"Delete record for $XTCRMACCT on Route 53",  "Changes": [ {"Action": "DELETE", "ResourceRecordSet":  {  "Name": "${XTCRMACCT}.${XTDOMAIN}.", "Type": "CNAME", "TTL": 60, "ResourceRecords":  [ {"Value": "${AWSDNSALIAS}" } ] }  }  ] }
EOF

}

dodns()
{
echo "Adding DNS Record to Route53"
RT53ADD="aws route53 change-resource-record-sets --hosted-zone-id ${AWSZONEID} --change-batch file://${RT53JSON}"
# Do it.
RT53ADDCMD=`${RT53ADD}`

RT53DEL="aws route53 change-resource-record-sets --hosted-zone-id ${AWSZONEID} --change-batch file://${RT53JSON_DELETE}"
# Just write rt53 delete command to uninstall script, don't actually execute it...
# RT53DELCMD=${RT53DEL}

echo ${RT53ADD} >> ${INSCRIPT}
echo ${RT53DEL} >> ${UNSCRIPT}

}


pgversion()
{
PARAM="--pg-version"
PGVER="9.3"
PARAM="${PARAM} ${PGVER}"
CMD+=" $PARAM"
}

previewruncmd()
{
echo "
Here is your Command Preview:
${CMD}"

#INSTALLCMD="sudo xtuple-server install-${TYPE} --xt-name ${CUST} --xt-version ${XTVER} --xt-edition ${EDITION} --xt-ghuser ${GHUSER} --xt-ghpass ${GHPASS} --xt-maindb ${CUSTDB} --xt-authkey xTuple --xt-adminpw ${XTPASS} --nginx-domain ${XTFQDN}  --nginx-incrt ${CERT} --nginx-inkey ${KEY}  --pg-worldlogin --pg-version 9.3"
UNINSTALLCMD="sudo xtuple-server uninstall-${TYPE} --xt-name ${CUST} --xt-version ${XTVER} --xt-edition ${EDITION} --xt-adminpw ${XTPASS} --nginx-domain ${XTFQDN} --pg-version 9.3"

echo ${CMD} >> ${INSCRIPT}
echo ${UNINSTALLCMD} >> ${UNSCRIPT}

}

runcmd()
{
#run_cmd=`$INSTALLCMD` | grep 'info sys-report' | cut -d' ' -f4-100 >> ${CUSTLOG}
run_cmd=`$CMD` | grep 'info sys-report' | cut -d' ' -f4-100 >> ${CUSTLOG}

}

startnode()
{
sudo service xtuple start
}

lickey()
{
echo "Enter license key if you have one"
read LIC
if [ -z $LIC ]; then
echo "skipping"
else
echo "Using $LIC"
LICSQL="UPDATE metric SET metric_value=\'${LIC}\' WHERE metric_name=\'RegistrationKey\';"
fi
}

dbcleanup()
{
NEWPORTLIST=`pg_lsclusters -h`
CUSTPORT=`echo "$NEWPORTLIST" | sed "s/^ *//;s/ *$//;s/ \{1,\}/ /g" | grep $XTCRMACCT | cut -d' ' -f3`

DB=${CUST}_${TYPE}
PGCMD="psql -At -U ${XTADMIN} -p ${CUSTPORT} ${DB} "

echo "Adding All Extensions to admin user"
${PGCMD} -c "SELECT xt.js_init(); DELETE FROM xt.usrext WHERE usrext_usr_username='${XTADMIN}'; INSERT INTO xt.usrext(usrext_usr_username,usrext_ext_id) SELECT '${XTADMIN}', ext_id FROM xt.ext;"

if [ -z $LICSQL ]; then
true
else
${PGCMD} -c "${LICSQL}"
fi


$PGCMD -q < $SQLDIR/getpkgver.sql

XTAPPVER=`$PGCMD -c "SELECT fetchmetrictext('ServerVersion');"`

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
EC2DATA=`ec2metadata --instance-id --local-ipv4 --public-ipv4 --availability-zone`

REPORT=$REPORTDIR/${CUST}_${WORKDATE}.log
cat << EOF >> $REPORT

Install Date: ${PLAINDATE}

Customer: ${CUST}
Mobile Version: ${XTVER}
Edition: ${EDITION}

MobileURL: $XTFQDN
AdminUser: $XTADMIN
AdminPass: $XTPASS

==Desktop Client Information==
Client Version: ${XTAPPVER}
Server: $XTFQDN
Port: $CUSTPORT
Database: ${DB}

==Details for ${DB}==
DB linked to: ${ORIGDB}
$XTDETAIL

==xTuple Server Command==
$CMD

==EC2Data==
$EC2DATA

EOF
}

makecustreport()
{
STOPXS=`date "+%T"`
EC2DATA=`ec2metadata --instance-id --local-ipv4 --public-ipv4 --availability-zone`

CUSTREPORT=$REPORTDIR/${CUST}_report_${WORKDATE}.log

cat << EOF >> $CUSTREPORT
Hello,

We have loaded a database for you in xTuple Cloud.

Please login with the following information.

For Mobile Web point your web browser to:
http://${XTFQDN}
And login with: 
User: $XTADMIN
Pass: $XTPASS

For xTuple Desktop:

Client Version: ${XTAPPVER}
Edition: ${EDITION}

Server: $XTFQDN
Port: $CUSTPORT
Database: ${DB}
User: $XTADMIN
Pass: $XTPASS

Mobile Version: ${XTVER}

==Details for ${DB}==
$XTDETAIL

Start: ${STARTXS}
Stop: ${STOPXS}

EOF
}

getfortune()
{
FORTUNE=`which fortune`
if [ -z $FORTUNE ]; then
#nevermind
true
else
FORTUNE=`fortune`
cat << EOF >> $REPORT

==Fortune==
$FORTUNE

EOF
fi
}

addnote()
{
echo "Would you like to add a note to the report? [ Y ] to add."
read ADDNOTE
case ${ADDNOTE} in
Y|y)
${EDITOR} $REPORT
;;
N|n|*)
echo "nope"
;;
esac
}


mailreport()
{
MAILPRGM=`which mutt`
if [ -z $MAILPRGM ]; then
echo "Couldn't mail anything - no mailer."
echo "Set up Mutt."
true
else
MSUB="Mobile Instance loaded by xsInstaller for you on $HOSTNAME"
MES="${REPORT}"

$MAILPRGM -s "CloudOps Mobilized $DB for you on $HOSTNAME" $MTO < $MES
fi
}

mailcustreport()
{
MAILPRGM=`which mutt`
if [ -z $MAILPRGM ]; then
echo "Couldn't mail anything - no mailer."
echo "Set up Mutt."
true
else
MSUB="Your Mobile Instance details for $XTFQDN"
MES="${CUSTREPORT}"

$MAILPRGM -s "Your Mobile Instance details for $XTFQDN" $MTCUST < $MES
fi
}

mkcluster()
{
AWSPORTLIST=`pg_lsclusters -h`
AWSCUSTEXIST=`echo "$AWSPORTLIST" | sed "s/^ *//;s/ *$//;s/ \{1,\}/ /g" | cut -d' ' -f2 | sort | grep $CLUSTERNAME`

if [ -n "$AWSCUSTEXIST" ]
then
   AWSCUSTEXISTLINE=`echo "$AWSPORTLIST" | sed "s/^ *//;s/ *$//;s/ \{1,\}/ /g" | grep $CLUSTERNAME`
   echo "$CLUSTERNAME already Exists!"
   echo "We should exit..."
   echo "$AWSCUSTEXISTLINE"
   exit 0;
else
   echo "OK, nothing found... continuing with install"
fi

MKPGVER=9.3
MKCLUSTERCMD="sudo pg_createcluster ${MKPGVER} ${CLUSTERNAME} --start  -- --auth=trust --auth-host=trust --auth-local=trust"
MKCLUSTER=`${MKCLUSTERCMD}`

NEWPORTLIST=`pg_lsclusters -h`
CUSTPORT=`echo "$NEWPORTLIST" | sed "s/^ *//;s/ *$//;s/ \{1,\}/ /g" | grep $CLUSTERNAME | cut -d' ' -f3`

echo "Cluster ${CLUSTERNAME} on Port ${CUSTPORT} found"
echo "Loading globals using $GLOBACKUPNAME"
psql -U postgres -p ${CUSTPORT} < ${GLOBACKUPNAME}

echo Loaded Globals
echo "Creating DB ${DBRESTORE}"

createdb -U admin -p ${CUSTPORT} ${DBRESTORE}
echo "Created ${DBRESTORE}"

echo "Restoring Database ${NEWDBNAME} to ${DBRESTORE} on ${CUSTPORT}"

pg_restore -U admin -p ${CUSTPORT} -d ${DBRESTORE} ${DBTORESTORE}

}

pre
banner
setservertype

case $SERVERTYPE in
mobile)

settype
setcust
getback
renamedb
setver
setedition
setpass
setghuserpass
setpgport
lickey
xtauthkey
checkdns
setssl
setpgworldlogin
pgversion
previewruncmd

echo "Do you want to run it actually?"
read RUNIT
case $RUNIT in
Y|y)
echo "Ok, Running..."
runcmd
startnode
dbcleanup
dodns
makereport
getfortune
makecustreport
addnote
mailreport
mailcustreport
;;
*)
echo "Not Gonna do it!"
exit 0;
;;
esac

echo "Starting node, adding extensions, making report"

exit 0;


;;
non-mobile)
setcust
getback
renamedb
getglobalback
mkcluster
exit 0;
;;
*)
exit 0;
;;
esac
