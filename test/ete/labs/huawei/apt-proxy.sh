#!/bin/bash
sed -i '/#!\/bin\/bash/a\
            mkdir -p /etc/docker\
            cat > /etc/docker/daemon.json <<EOF\
            {\
              "insecure-registries" : ["docker-proxy.neo.futurewei.com:5000"]\
            }\
            EOF\
            cat > /etc/apt/apt.conf.d/30proxy<<EOF\
            Acquire::http { Proxy "http://apt-proxy.neo.futurewei.com:3142"; };\
            Acquire::https::Proxy "DIRECT";\
            EOF\
            apt-get -y update' $1

# don't use insecure docker proxy in dcae
perl -i -0pe 's/(?<=dcae_c_vm:)(.*?)\{ get_param: nexus_docker_repo \}/$1"nexus3.onap.org:10001"/s' $1
