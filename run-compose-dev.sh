set -e

docker compose -f docker-compose.dev.yml build --no-cache
docker compose -f docker-compose.dev.yml up -d db
echo "Waiting for database..."
sleep 3
docker compose -f docker-compose.dev.yml run --rm api python manage.py migrate --noinput
docker compose -f docker-compose.dev.yml up -d
