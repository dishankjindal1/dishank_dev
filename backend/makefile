start:
	docker-compose up --build --remove-orphans -d

stop:
	docker-compose stop

run-redis:
	docker run redis

rm-dang:
	. make-scripts/docker-image-cleanup.sh

make fswatch:
	. make-scripts/run-fswatch.sh
