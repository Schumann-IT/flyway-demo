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
