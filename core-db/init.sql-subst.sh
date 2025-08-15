# /bin/bash

# init.sql-subst.sh
envsubst < /docker-entrypoint-initdb.d/init.sql.template > /docker-entrypoint-initdb.d/init.sql

# Now run the init SQL
mysql -u root -p"${DB_ROOT_PASSWORD}" "${DB_NAME}" < /docker-entrypoint-initdb.d/init.sql