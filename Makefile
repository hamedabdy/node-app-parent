check-node:
    @echo "Node version: $(shell node -v)"
    @echo "NPM version: $(shell npm -v)"
    @node -e "if (parseInt(process.version.slice(1)) < 22) { throw new Error('Node 22+ required') }"

dev:
    @echo "🚀 Starting development environment..."
    docker-compose up --build

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

.PHONY: check-node dev down logs clean