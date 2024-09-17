all: 
	mkdir -p /home/npaolett/data/mariadb
	mkdir -p /home/npaolett/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker compose -f ./srcs/docker-compose.yml logs

clean:
	docker container stop nginx mariadb wordpress

fclean: clean
	@sudo rm -rf /home/npaolett/data/mariadb/*
	@sudo rm -rf /home/npaolett/data/wordpress/*
	@sudo rm -rf /home/npaolett/data/redis/*
	@docker system prune -af

re: fclean all

.PHONY: all logs clean fclean