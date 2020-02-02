REGISTRY=gcr.io/home-260209/
PROJECT_NAME=haskel_hello_world

build:
	docker build -t ${REGISTRY}${PROJECT_NAME} .

push: build
	docker push ${REGISTRY}${PROJECT_NAME}

deploy: push
	gcloud builds submit --tag ${REGISTRY}${PROJECT_NAME}
