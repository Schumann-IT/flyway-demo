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
