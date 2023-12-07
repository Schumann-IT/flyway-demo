## Preparation

- Start the development database
```
docker compose up -d postgres_db
```

## Run migrations

*Auto-Migrate*
- n/a

*Manual*
- Atlas CLI
```
atlas schema apply --url "postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable" --to "file://db/schema.hcl" --dev-url "docker://postgres/15"
```
- Docker Compose
```
docker compose up migration
```
