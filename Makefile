SHELL=/bin/bash
NAME=gossip-dev
LOCAL_REGISTRY=gmt.reg.me/test
TAG=v1
IMAGE=${LOCAL_REGISTRY}/${NAME}:${TAG}

build:
	@docker build -t ${IMAGE} . 
