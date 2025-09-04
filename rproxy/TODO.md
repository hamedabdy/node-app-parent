3. Certificate Management Options 
Option A: Self-Signed Certificates (Development) 

Create self-signed certificates: 

# Create certificates directory
mkdir -p nginx/certs

# Generate self-signed certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout nginx/certs/privkey.pem \
    -out nginx/certs/fullchain.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"


Option C: Automated Certificate Management with Docker
Create nginx/docker-compose.certbot.yml:
version: '3.8'

services:
  certbot:
    image: certbot/certbot
    volumes:
      - ./certs:/etc/letsencrypt
      - ./www:/var/www/certbot
    command: certonly --webroot --webroot-path=/var/www/certbot --email your-email@domain.com --agree-tos --no-eff-email -d your-domain.com