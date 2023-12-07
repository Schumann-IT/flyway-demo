## Preparation

- Start the development database
```
docker compose up -d postgres_db
```

## Run migrations

*Auto-Migrate*
- Start the application, migrations run automatically on startup
- NOTE: Auto-Migration MUST be disabled in production to avoid race condition

*Manual*
- Maven
```
mvn flyway:migrate
```
- Docker Compose
```
docker compose up migration
```
