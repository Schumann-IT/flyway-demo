-- Create "flyway_schema_history" table
CREATE TABLE "flyway_schema_history" (
  "installed_rank" integer NOT NULL,
  "version" character varying(50) NULL,
  "description" character varying(200) NOT NULL,
  "type" character varying(20) NOT NULL,
  "script" character varying(1000) NOT NULL,
  "checksum" integer NULL,
  "installed_by" character varying(100) NOT NULL,
  "installed_on" timestamp NOT NULL DEFAULT now(),
  "execution_time" integer NOT NULL,
  "success" boolean NOT NULL,
  PRIMARY KEY ("installed_rank")
);
-- Create index "flyway_schema_history_s_idx" to table: "flyway_schema_history"
CREATE INDEX "flyway_schema_history_s_idx" ON "flyway_schema_history" ("success");
-- Create "todo" table
CREATE TABLE "todo" (
  "todo_item_id" bigint NOT NULL,
  "creation_date" timestamp NULL,
  "is_complete" boolean NULL,
  "todo_date" date NULL,
  "todo_description" character varying(255) NULL,
  "todo_title" character varying(255) NULL,
  "update_date" timestamp NULL,
  PRIMARY KEY ("todo_item_id")
);
