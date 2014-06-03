
    create table record (
        id  bigserial not null,
        name varchar(128),
        number varchar(13) not null,
        primary key (id)
    );

    create index record_name on record(lower(name));

    create index record_number on record(lower(number));
