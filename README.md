# mtls-vault
This project is a simple example of how to run Vault server and configure client with mTLS

## Prerequisites
- Docker
- Docker-compose

## How to run

`docker-compose up --build -d`

`docker-compose exec vault /mnt/entry.sh`

`docker-compose exec vc /app/client-test.py`