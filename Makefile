DM_IP := $(shell docker-machine ip)

help:
	@egrep "^#" Makefile

# target: browse                        - Browse the local website
browse:
	open http://ukulele.mydocker/app_dev.php

# target: docker-up|du                  - Start docker containers
du: docker-up
docker-up:
	docker-compose up -d --build
	grep -q -F "ukulele.mydocker" /etc/hosts || echo "$(DM_IP) ukulele.mydocker" | sudo tee -a /etc/hosts

# target: docker-down|db                - Stop docker containers
dd: docker-down
docker-down:
	docker-compose down
	sudo sed -ie "/ukulele.mydocker/d" /etc/hosts

# target: docker-build|db                - Setup PHP & (node)JS dependencies
db: docker-build
docker-build: build-composer

build-composer:
	docker-compose exec app sh -c "composer install --prefer-dist --classmap-authoritative --no-progress --no-ansi --no-interaction"


# target: fixtures                - Load fixtures into DB & Elasticsearch.
fixtures:
	bin/console doctrine:schema:drop --force
	bin/console doctrine:schema:up --force
	bin/console hautelook_alice:doctrine:fixtures:load -n
	bin/console fos:elastica:populate

# target: bash                           - Connect to the app docker container
bash:
	docker-compose exec app bash
