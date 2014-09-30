<h3>xsinstaller (xTuple-Server Installer)</h3>


<h3>Purpose:</h3>
This is a wrapper for the xtuple-server install-TYPE cli modes to generate the long list of parameters needed to create an xTuple Server Instance.

<h3>Things it does:</h3>
* Sets up your xtuple-server following the steps in the quickstart guide on the xtuple-server wiki.
* Grabs a postbooks db
* creates a key/cert 
* Checks that the xtuple-server has needed files/services (xtuple-server, nginx, etc)
* Adds support and configures AWSCLI and S3CMD to populate Route53 DNS and grab files or put backups in an S3 Bucket (WIP).
* Creates directory structure for containing the files it needs
* Prompts you through the instance creation process and explains itself (mostly)
* Generates a report that can be auto-mailed to end users with details of their service
* Reads an ini file if using the same parameters in a shared environment
* Stores an install/uninstall script for instances you create.
* Allows you to preview the parameters list and optionally execute or change it.
* Keeps you from typing or remembering a lot of parameters (so doesn't the webmin interface, but this is less typing than that.)

<h3>Things it does NOT do: (yet)</h3>
* Does not use node (it's just dumb bash)
* Does not uninstall (but does store an uninstall script which you can poke manually)
* Does not set up cron/backups (yet)
* Does not read a database or receive JSON to get parameters for xtuple-sever (yet)
* Does not restore-database (but you can put your .backup in the xtupledb dir and choose it)
* Does not offer every option to xtuple-server install-TYPE (yet, mostly avoids the obscure things)
* Fold laundry, or make your lunch, etc.

<h3>Usage:</h3>
Starting from a fresh server install that is supported by xtuple-server (Ubuntu 12.x/14.x), grab this script, run it as a normal user and follow the prompts.

<h3>Notes/Errata:</h3>
* your certs and keys go in the certs folder
* your backups (or commercial versions of xtupledb's) go in the xtupledb folder
* parameter settings go in the ini/settings.ini file (currently only supporting aws route53 settings, which you are prompted for on first-run.)
* .xsinstaller file is created in $HOME of the user running it. If you wish to re-run through the setup steps, remove this file.
* re-bootstrap, npm install, and xtuple-server setup will be made more robust soon. You can work around this easily enough though.

* Read the xsInstaller.sh script. It is pretty straight forward.
