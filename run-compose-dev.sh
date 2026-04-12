#explicit defaults 
export DJANGO_KEY=abc123
export DEBUG=TRUE
export POSTGRES_DB=config
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
docker compose -f docker-compose.dev.yml down -v
docker compose -f docker-compose.dev.yml build --no-cache
docker compose -f docker-compose.dev.yml up -d

sleep 5
docker exec impactdesk-project-api-1 python manage.py migrate
docker exec impactdesk-project-api-1 python manage.py loaddata initial_data
