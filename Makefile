SHELL=/bin/bash
NAME=gossip-dev
NAMESPACE=default
LOCAL_REGISTRY=gmt.reg.me/test
TAG=v1
IMAGE=${LOCAL_REGISTRY}/${NAME}:${TAG}
MANIFEST=./manifest
TOOLS=./tools
SVC=${NAME}-headless
IMAGE_PULL_POLICY=Always
SERVICE_ACCOUNT=admin
REPLICAS=3

all: build push deploy

build:
	@docker build -t ${IMAGE} . 

push:
	@docker push ${IMAGE}

deploy: cp sed
	@kubectl create -f ${MANIFEST}/.

cp:
	@find ${MANIFEST} -type f -name "*.sed" | sed s?".sed"?""?g | xargs -I {} cp {}.sed {}

sed:
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.name}} -v ${NAME}
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.namespace}} -v ${NAMESPACE}
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.image}} -v ${IMAGE}
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.image.pull.policy}} -v ${IMAGE_PULL_POLICY}
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.service.account}} -v ${SERVICE_ACCOUNT}
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.svc}} -v ${SVC}
	@${TOOLS}/sed.sh -m ${MANIFEST} -t {{.replicas}} -v ${REPLICAS}

clean:
	@kubectl delete -f ${MANIFEST}/.

po: 
	@kubectl get pods -o wide
