#/bin/sh

echo "###############################################################\n"
echo "# A script to update WAR of production server                 #\n"
echo "# By Martynas Stakė (martynas@idega.is) 2017                  #\n"
echo "###############################################################\n"
echo "\n"

BETA_SERVER_LOGIN="idegaweb@10.160.50.20";
DOMAIN_BETA="beta.felix.is";

declare -A DOMAINS=( ["central.felix.is"]="idegaweb@10.160.50.20" ["club.felix.is"]="idegaweb@10.160.50.21" ["trainer.felix.is"]="idegaweb@10.160.50.21" ["member.felix.is"]="idegaweb@10.160.50.22" );

NGINX_RESTART_QUERY="sudo service nginx restart";

echo 'Copying to '$BETA_SERVER_LOGIN'...';
scp $HOME/.m2/repository/com/idega/webapp/custom/sportian/5.0.0-SNAPSHOT/sportian-5.0.0-SNAPSHOT.war $BETA_SERVER_LOGIN:/home/idegaweb/ROOTNEW.zip
# echo $HOME/.m2/repository/com/idega/webapp/custom/sportian/5.0.0-SNAPSHOT/sportian-5.0.0-SNAPSHOT.war $BETA_SERVER_LOGIN:/home/idegaweb/ROOTNEW.zip

for DOMAIN in "${!DOMAINS[@]}";
do

echo 'Removing '$DOMAIN' configuration from NGINX...';
ssh -t $BETA_SERVER_LOGIN 'sudo mv /etc/nginx/conf.d/upstream.'$DOMAIN'.conf.off /etc/nginx/conf.d/upstream.'$DOMAIN'.conf';
ssh -t $BETA_SERVER_LOGIN "sudo mv /etc/nginx/conf.d/upstream.conf /etc/nginx/conf.d/upstream.conf.off";
ssh -t $BETA_SERVER_LOGIN $NGINX_RESTART_QUERY;
# echo $BETA_SERVER_LOGIN 'sudo mv /etc/nginx/conf.d/upstream.'$DOMAIN'.conf.off /etc/nginx/conf.d/upstream.'$DOMAIN'.conf';
# echo $BETA_SERVER_LOGIN "sudo mv /etc/nginx/conf.d/upstream.conf /etc/nginx/conf.d/upstream.conf.off";
# echo $BETA_SERVER_LOGIN $NGINX_RESTART_QUERY;

echo 'Copying WAR to '$DOMAIN'...';
scp $BETA_SERVER_LOGIN:/home/idegaweb/ROOTNEW.zip ${DOMAINS[$DOMAIN]}:/home/idegaweb/tomcat/$DOMAIN/wars/;
# echo $BETA_SERVER_LOGIN:/home/idegaweb/ROOTNEW.zip ${DOMAINS[$DOMAIN]}:/home/idegaweb/tomcat/$DOMAIN/wars/;

echo 'Shutting down '$DOMAIN'...';
ssh ${DOMAINS[$DOMAIN]} '/home/idegaweb/tomcat/'$DOMAIN'/bin/./shutdown.sh';
# echo ${DOMAINS[$DOMAIN]} '/home/idegaweb/tomcat/'$DOMAIN'/bin/./shutdown.sh';

echo 'Updating '$DOMAIN'...';
ssh ${DOMAINS[$DOMAIN]} '/home/idegaweb/tomcat/'$DOMAIN'/wars/update.sh';
# echo ${DOMAINS[$DOMAIN]} '/home/idegaweb/tomcat/'$DOMAIN'/wars/update.sh';

echo 'Waiting for '$DOMAIN' to startup...';
sleep 1800;

echo 'Restoring '$DOMAIN' configuration to NGINX...';
ssh $BETA_SERVER_LOGIN 'sudo mv /etc/nginx/conf.d/upstream.'$DOMAIN'.conf /etc/nginx/conf.d/upstream.'$DOMAIN'.conf.off';
ssh $BETA_SERVER_LOGIN "sudo mv /etc/nginx/conf.d/upstream.conf.off /etc/nginx/conf.d/upstream.conf";
ssh $BETA_SERVER_LOGIN $NGINX_RESTART_QUERY;
# echo $BETA_SERVER_LOGIN 'sudo mv /etc/nginx/conf.d/upstream.'$DOMAIN'.conf /etc/nginx/conf.d/upstream.'$DOMAIN'.conf.off';
# echo $BETA_SERVER_LOGIN "sudo mv /etc/nginx/conf.d/upstream.conf.off /etc/nginx/conf.d/upstream.conf";
# echo $BETA_SERVER_LOGIN $NGINX_RESTART_QUERY;

done;