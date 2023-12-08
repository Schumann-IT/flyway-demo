create table todo
(
    todo_item_id     bigint not null
        primary key,
    creation_date    timestamp,
    is_complete      boolean,
    todo_date        date,
    todo_description varchar(255),
    todo_title       varchar(255),
    update_date      timestamp
);