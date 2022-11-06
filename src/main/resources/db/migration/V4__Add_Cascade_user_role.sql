alter table user_role
    drop constraint fkfpm8swft53ulq2hl11yplpr5;

alter table user_role
    add constraint fkfpm8swft53ulq2hl11yplpr5
        foreign key (user_id) references usr
            on delete cascade;

