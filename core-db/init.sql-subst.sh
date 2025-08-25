# /bin/bash
set -Eeuo pipefail

TEMPLATE="/docker-entrypoint-initdb.d/init.sql.template"
OUTPUT="/tmp/20-init.sql"
BACKUP_FILE="/docker-entrypoint-initdb.d/30-backup20250609.sql"

# Use MariaDB official env names to align with image behavior
: "${MYSQL_ROOT_PASSWORD:?ERROR: MYSQL_ROOT_PASSWORD is required}"
: "${MYSQL_DATABASE:?ERROR: MYSQL_DATABASE is required}"
: "${MYSQL_USER:?ERROR: MYSQL_USER is required}"
: "${MYSQL_PASSWORD:?ERROR: MYSQL_PASSWORD is required}"

# Only generate SQL if template exists
# CREATE the OUTPUT file in /tmp
if [ -f "$TEMPLATE" ]; then
  envsubst < "$TEMPLATE" > "$OUTPUT"
  chmod 600 "$OUTPUT"
else
  echo "⚠️ No template found at $TEMPLATE, skipping."
fi

# Only run manual SQL if server is up and we are on first init.
# The MariaDB entrypoint will auto-run *.sql in this directory on first init,
# so you typically do NOT need to run mysql yourself here.
# If you must run it (e.g., to control order), do it conditionally:
if [ ! -d "/var/lib/mysql/mysql" ]; then
  # First init. Let the entrypoint process $OUTPUT automatically.
  :
else
  # Post-init runs: apply idempotent grants if necessary.
  if [ -f "$OUTPUT" ]; then
    echo "Applying idempotent init SQL post-init..."
    mariadb --protocol=socket --socket=/var/run/mariadb/mariadb.sock \
      -uroot -p"$MYSQL_ROOT_PASSWORD" \
      ${MYSQL_DATABASE:+ "$MYSQL_DATABASE"} < "$OUTPUT" \
      ${MYSQL_DATABASE:+ "$MYSQL_DATABASE"} < "$BACKUP_FILE"
  fi
fi

echo "🎉 Initialization complete."