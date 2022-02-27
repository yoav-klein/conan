JFROG_HOME=$PWD
if [ ! -d $JFROG_HOME/artifactory ]; then
	mkdir -p $JFROG_HOME/artifactory/var/etc/
	cd $JFROG_HOME/artifactory/var/etc/
	touch ./system.yaml
	chown -R $UID $JFROG_HOME/artifactory/var
	chmod -R 777 $JFROG_HOME/artifactory/var
fi

docker-compose up -d
