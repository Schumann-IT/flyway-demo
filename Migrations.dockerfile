FROM flyway/flyway

COPY src/main/resources/db/migration /flyway/sql
