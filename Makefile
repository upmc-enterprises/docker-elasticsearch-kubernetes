# Makefile for the Docker image upmcenterprises/docker-elasticsearch-kubernetes
# MAINTAINER: Steve Sloka <slokas@upmc.edu>

.PHONY: all container push

TAG ?= 6.2.4_0
PREFIX ?= upmcenterprises

all: container

container:
	docker build -t $(PREFIX)/docker-elasticsearch-kubernetes:$(TAG) .

push:
	docker push $(PREFIX)/docker-elasticsearch-kubernetes:$(TAG)
