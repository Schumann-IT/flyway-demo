table "flyway_schema_history" {
  schema = schema.public
  column "installed_rank" {
    null = false
    type = integer
  }
  column "version" {
    null = true
    type = character_varying(50)
  }
  column "description" {
    null = false
    type = character_varying(200)
  }
  column "type" {
    null = false
    type = character_varying(20)
  }
  column "script" {
    null = false
    type = character_varying(1000)
  }
  column "checksum" {
    null = true
    type = integer
  }
  column "installed_by" {
    null = false
    type = character_varying(100)
  }
  column "installed_on" {
    null    = false
    type    = timestamp
    default = sql("now()")
  }
  column "execution_time" {
    null = false
    type = integer
  }
  column "success" {
    null = false
    type = boolean
  }
  primary_key {
    columns = [column.installed_rank]
  }
  index "flyway_schema_history_s_idx" {
    columns = [column.success]
  }
}
table "todo" {
  schema = schema.public
  column "todo_item_id" {
    null = false
    type = bigint
  }
  column "creation_date" {
    null = true
    type = timestamp
  }
  column "is_complete" {
    null = true
    type = boolean
  }
  column "todo_date" {
    null = true
    type = date
  }
  column "todo_description" {
    null = true
    type = character_varying(255)
  }
  column "todo_title" {
    null = true
    type = character_varying(255)
  }
  column "update_date" {
    null = true
    type = timestamp
  }
  primary_key {
    columns = [column.todo_item_id]
  }
}
schema "public" {
  comment = "standard public schema"
}