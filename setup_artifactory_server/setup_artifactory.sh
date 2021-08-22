JFROG_HOME=$PWD

if [ ! -d $JFROM_HOME/var/artifactory/etc ]; then
	mkdir -p $JFROG_HOME/var/artifactory/etc
	cd $JFROG_HOME/var/artifactory/etc/
	touch ./system.yaml
	sudo chown -R 1030:1030 $JFROG_HOME/var/artifactory
fi


# run the container
docker run --name artifactory --rm -d  -v $JFROG_HOME/var/artifactory/:/var/opt/jfrog/artifactory  -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-cpp-ce:latest
