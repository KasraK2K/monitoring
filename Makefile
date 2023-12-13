MODE=development
PROJECT_NAME=Monitoring

# ----------------------------- Private Commands ----------------------------- #
--copy_config:
	@echo "Copy Prometheus Configs"
	cp configs/prometheus.yml volumes/prometheus
	cp configs/alertmanager.yml volumes/alertmanager

# ------------------------------ Public Commands ----------------------------- #
up: --copy_config
	@echo "Starging docker containers..."
	COMPOSE_PROJECT_NAME=${PROJECT_NAME} docker-compose up -d
	@echo "Done."

down:
	@echo "Removing docker containers..."
	COMPOSE_PROJECT_NAME=${PROJECT_NAME} docker-compose down
	@echo "Done."