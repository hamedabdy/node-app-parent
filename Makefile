check-node:
	@echo "Node version: $(shell node -v)"
	@echo "NPM version: $(shell npm -v)"
	@node -e "if (parseInt(process.version.slice(1)) < 22) { throw new Error('Node 22+ required') }"

dev:
	@echo "🚀 Starting development environment..."
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build

down:
	@echo "🛑 Stopping services..."
	docker-compose down

logs:
	@echo "📋 Logs from all services..."
	docker-compose logs -f

clean:
	@echo "🧹 Removing containers, images, and volumes..."
	docker-compose down --volumes --remove-orphans
	docker system prune -f
	docker image prune -f
	docker volume prune -f
	docker rmi $$(docker images -q)

.PHONY: check-node dev down logs clean

test:
	@echo "🚀 Starting test environment..."
	docker-compose -f docker-compose.yml -f docker-compose.test.yml up --abort-on-container-exit --exit-code-from core-server

up:
	@echo "🚀 Starting production environment..."
	docker-compose -f docker-compose.yml up --build

# Build the images (no up, just build)
build:
	docker-compose build