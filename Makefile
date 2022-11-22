default: get-swag swag-init build-image push-image deploy-example deploy-api

get-swag:
	curl --output swag.tar.gz -SLf   https://github.com/swaggo/swag/releases/download/v1.8.7/swag_1.8.7_Linux_x86_64.tar.gz
	tar -xzf swag.tar.gz 

	rm swag.tar.gz 
	mv swag /usr/local/bin/
swag-init:
	swag init

build-image:
	docker build -t jasmingacic/example . 
push-image: 
	docker push jasmingacic/example

deploy-example:
	kubectl apply -f deployment.yaml 

deploy-api:
	cp ./docs/swagger.yaml . && kusk deploy --overlay overlay.yaml --name example && rm swagger.yaml


	