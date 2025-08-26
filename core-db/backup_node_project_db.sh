#!/bin/bash
# Backup script for node-project database from core-db Docker container

BACKUP_DIR="db-backups"
CONTAINER_NAME="node-app-parent-db-1"
DB_NAME="node-project"
DB_USER="root"
DB_PASS="hamed" # Change this to your actual DB password
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_${DB_NAME}_$DATE.sql"

mkdir -p "$BACKUP_DIR"

echo "Starting backup of $DB_NAME from $CONTAINER_NAME..."
docker exec $CONTAINER_NAME mariadb-dump -u$DB_USER -p$DB_PASS $DB_NAME > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_FILE"
else
  echo "Backup failed!"
fi
