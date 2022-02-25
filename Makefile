start:
	docker-compose pull foreman
	docker-compose up --no-build foreman

build:
	docker-compose up --force-recreate --build foreman

clean:
	docker-compose down -v --remove-orphans --rmi=all
