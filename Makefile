MODE=development
PROJECT_NAME=Monitoring

# ----------------------------- Private Commands ----------------------------- #
--copy_config:
	@echo "Copy Prometheus Configs"
	mkdir -p volumes/prometheus volumes/alertmanager
	cp configs/prometheus.yml volumes/prometheus/prometheus.yml
	cp configs/alertmanager.yml volumes/alertmanager/alertmanager.yml
	cp configs/grafana.ini volumes/grafana/grafana.ini

# ------------------------------ Public Commands ----------------------------- #
up: --copy_config
	@echo "Starging docker containers..."
	COMPOSE_PROJECT_NAME=${PROJECT_NAME} docker-compose up -d
	@echo "Done."

down:
	@echo "Removing docker containers..."
	COMPOSE_PROJECT_NAME=${PROJECT_NAME} docker-compose down
	@echo "Done."