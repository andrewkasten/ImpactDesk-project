

docker compose -f docker-compose.prod.yml build --no-cache
docker compose -f docker-compose.prod.yml up -d db

sleep 3
docker compose -f docker-compose.prod.yml run --rm api python manage.py migrate --noinput
docker compose -f docker-compose.prod.yml up -d
