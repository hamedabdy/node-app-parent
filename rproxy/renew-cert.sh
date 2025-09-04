#!/bin/bash
docker-compose run --rm certbot renew
docker-compose restart nginx

### FOR PRODUCTION: Set up a cron job to run this script periodically, e.g., weekly.
# Renew certificates twice daily
# 0 12 * * * /path/to/renew-certs.sh
# 0 0 * * * /path/to/renew-certs.sh