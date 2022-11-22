build-image:
	docker build -t jasmingacic/example . 
push-image: 
	docker push -t jasmingacic/example

deploy-example:
	kubectl apply -f deployment.yaml 

deploy-api:
	cp ./docs/swagger.yaml . && kusk deploy --overlay overlay.yaml

build-api: 
	swag