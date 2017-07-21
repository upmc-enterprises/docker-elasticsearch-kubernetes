# docker-elasticsearch-kubernetes

Ready to use lean (120MB) Elasticsearch Docker image ready for using within a Kubernetes cluster.

[![Docker Repository on Quay.io](https://quay.io/repository/pires/docker-elasticsearch-kubernetes/status "Docker Repository on Quay.io")](https://quay.io/repository/pires/docker-elasticsearch-kubernetes)

## Current software

* OpenJDK JRE 8u121
* Elasticsearch 5.3.1

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* `DISCOVERY_SERVICE` - the service to be queried for through DNS.

## Auth using Search Guard plug in

A basic configuration is included which defines two roles:
admin        - can do everything
service-acct - can do CRUD on all indices and CREATE_INDEX

There are users defined for each role as well, see the config/sq_internal_users.yml to modify those.

When the container is up and running, you need to initialize the users by issuing the following command
( this requires downloading the sgadmin tool from searchguard or you can bash onto the container and run it there )

Do a docker ps to get the port to use below (if ports are mapped), note that this is 9300 port (node communication), not the 9200 port.

$./tools/sgadmin.sh  -h localhost -p 9300 -ts /elasticsearch/certs/truststore.jks -ks /elasticsearch/certs/node-keystore.jks -icl -nhnv -cd /elasticsearch/config

