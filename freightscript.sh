#!/bin/sh

# @author johnpelquingua.com
#
#----------------------------
#Start script for EIOS Server
#----------------------------
#

freightbitpath="/freightbit-logistics/"
tomcatpath="/usr/local/tomcat7/"

echo "Hello $USER"
echo "Starting..."

cd $freightbitpath
git status
git stash
git pull
git stash apply
mvn clean install -DskipTests

echo "Done with creating war file.."

echo "Shutting down tomcat..."
cd $tomcatpath
./bin/shutdown.sh

cd webapps/
ls
rm -rf ROOT
rm -rf ROOT.war
cp /root/freightbit-logistics/freightbit/target/freightbit-1.0-SNAPSHOT.war ROOT.war

echo "Starting tomcat..."
cd $tomcatpath
./bin/startup.sh

echo "You can now use eios.solutionsresource.com!"