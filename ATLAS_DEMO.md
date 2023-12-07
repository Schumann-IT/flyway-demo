# Atlas Demo

## Preparation

- Apply the initial schema (instead of starting off of an existing DB)
```bash
docker-compose down
rm -Rf data
docker-compose up -d postgres_db
cd db/new
# create database
atlas schema apply --url "postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable" --to "file://schema.hcl" --dev-url "docker://postgres/15"
# seed db
atlas migrate hash --dir "file://data"  
atlas migrate apply --dir "file://data" --url 'postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable' --allow-dirty
```

## Initialize DB migrations from an existing database

**Use Case: When migrating from Flyway**

- Setup and migrate the DB to the current version via flyway
```bash
docker-compose down
rm -Rf data
docker-compose up -d postgres_db
# DO FLYWAY MIGRATION HERE 
```
- Create the initial schema
```bash
# Atlas DDL
atlas schema inspect -u "postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable" > schema.hcl
# OR SQL
atlas schema inspect -u "postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable" --format '{{ sql . "  " }}' > schema.sql
```
- Create the initial migration files (only needed for versioned workflow)
```bash
atlas migrate diff initial --dir "file://migrations" --dev-url "docker://postgres/15/dev?search_path=public" --to "postgresql://postgres:postgres123@localhost:5432/postgres?search_path=public&sslmode=disable" --format '{{ sql . "  " }}'
```
- Commit migration files and schema.hcl or sql

## Developer Workflow

### Initialize Database

```bash
docker-compose down
# (optional) cleanup data dir
rm -rf data
# start db
docker-compose up -d postgres_db
docker-compose up migration
```

### Add DB Migration

- chdir to the database schema directory
```bash
cd db/new
```

- Make any change to the schema.hcl. E.g. add a column
- Apply the Schema to the dev database (declarative workflow)
```bash
atlas schema apply --url "postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable" --to "file://schema.hcl" --dev-url "docker://postgres/15"
```

- Create the migration file for the latest change (only needed for versioned workflow)
```bash
atlas migrate diff remove_doktyp_feld_column --dir "file://migrations" --dev-url "docker://postgres/15/dev?search_path=public" --to "postgresql://postgres:postgres123@localhost:5432/postgres?search_path=public&sslmode=disable" --format '{{ sql . "  " }}'
```
- Commit migration files so that others will be up-to-date

### Add data seeding

- Assuming we are using only the declarative workflow
- Thus no migrations directory exists
- Create a new data seed
```bash
# create seed file
atlas migrate new --dir "file://data_seeds" my_data_seed

## Add seed data to the new file

# calculate new checksum
atlas migrate hash --dir "file://data_seeds"

# apply seed data
atlas migrate apply --dir "file://data_seeds" --url 'postgresql://postgres:postgres123@localhost:5432/postgres?sslmode=disable' --allow-dirty
```

## Deploy to any Environment

### Using Container Image

- Create Image within a pipleline
```bash
docker build -t project-migrations:latest -f Dockerfile.migrations .
```
- run a kubernetes job as part of the deployment
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: project-migration
  annotations:
    argocd.argoproj.io/hook: PreSync
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
spec:
  template:
    spec:
      containers:
        - name: migration
          image: project-migrations:latest
          args:
            - >
              migrate apply
              --url 'postgresql://postgres:postgres123@postgres_db:5432/postgres?sslmode=disable'
      restartPolicy: Never
 
```

### Using ArgoCD

- Using this approach, no migration files are needed any more. Only the schema.hcl is needed.
- Migration files can still be used for data seeding
- Data seeds can be deployed using a container image and a kubernetes job as described above

```yaml
apiVersion: db.atlasgo.io/v1alpha1
kind: AtlasSchema
metadata:
  annotations:
    argocd.argoproj.io/sync-wave: "1"
  name: project
spec:
  url: postgresql://postgres:postgres123@postgres_db:5432/postgres?sslmode=disable
  schema:
    hcl: |
      # CONTENTS OF db/new /schema.hcl here #
```
