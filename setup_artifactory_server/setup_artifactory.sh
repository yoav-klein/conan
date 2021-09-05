
JFROG_HOME=$PWD
if [ ! -d $JFROG_HOME/artifactory ]; then
	mkdir -p $JFROG_HOME/artifactory/var/etc/
	cd $JFROG_HOME/artifactory/var/etc/
	touch ./system.yaml
	chown -R $UID $JFROG_HOME/artifactory/var
	chmod -R 777 $JFROG_HOME/artifactory/var
fi

docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory \
-d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-cpp-ce:latest
