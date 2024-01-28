create table tbl_geo(
    id bigint auto_increment primary key,
    lat double not null,
    lng double not null
);
insert into tbl_geo(lat,lng)
values (-37.3159, 81.1496);
insert into tbl_geo(lat, lng)
values (-43.9509, -34.4618);
insert into tbl_geo (lat, lng)
values (-68.6102, -47.0653);
insert into tbl_geo(lat, lng)
values (29.4572, -164.2990);
insert into tbl_geo (lat, lng)
values (-31.8129, 62.5342);
select * from tbl_geo;

create table tbl_address(
    id bigint auto_increment primary key,
    street varchar(255) not null,
    suite varchar(255) not null,
    city varchar(255) not null,
    zipcode varchar(255) not null,
    geo_id bigint,
    constraint fk_address_geo foreign key(geo_id)
                        references tbl_geo(id)
);

insert into tbl_address(street,suite,city,zipcode,geo_id)
values ('Kulas Light', 'Apt. 556', 'Gwenborough', '92998-3874', 1);
insert into tbl_address(street, suite, city, zipcode, geo_id)
values('Victor Plains', 'Suite 879', 'Wisokyburgh', '90566-7771', 2);
insert into tbl_address (street, suite, city, zipcode, geo_id)
values ('Douglas Extension', 'Suite 847', 'McKenziehaven', '59590-4157', 3);
insert into tbl_address(street, suite, city, zipcode, geo_id)
values('Hoeger Mall', 'Apt. 692', 'South Elvis', '53919-4257', 4);
insert into tbl_address (street, suite, city, zipcode, geo_id)
values ('Skiles Walks', 'Suite 351', 'Roscoeview', '33263', 5);

create table tbl_company(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    catch_phrase varchar(255) not null,
    bs varchar(255) not null
);

insert into tbl_company(name,catch_phrase,bs)
values ('Romaguera-Crona','Multi-layered client-server neural-net','harness real-time e-markets');
insert into tbl_company(name, catch_phrase, bs)
values('Deckow-Crist', 'Proactive didactic contingency', 'synergize scalable supply-chains');
insert into tbl_company (name, catch_phrase, bs)
values ('Romaguera-Jacobson', 'Face to face bifurcated interface', 'e-enable strategic applications');
insert into tbl_company(name, catch_phrase, bs)
values('Robel-Corkery', 'Multi-tiered zero tolerance productivity', 'transition cutting-edge web services');
insert into tbl_company (name, catch_phrase, bs)
values ('Keebler LLC', 'User-centric fault-tolerant solution', 'revolutionize end-to-end systems');

create table tbl_user(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    username varchar(255) not null,
    email varchar(255) not null,
    phone varchar(255) not null,
    website varchar(255) not null,
    address_id bigint,
    company_id bigint,
    constraint fk_user_address foreign key(address_id)
                     references tbl_address(id),
    constraint fk_user_company foreign key(company_id)
                     references tbl_company(id)
);

select * from tbl_geo;
select * from tbl_address;
select * from tbl_company;
select * from tbl_user;

create table tbl_post(
    id bigint auto_increment primary key,
    title varchar(255) not null,
    body varchar(255) not null,
    user_id bigint not null,
    constraint fk_post_user foreign key(user_id)
                     references tbl_user(id)
);

create table tbl_comment(
    id bigint auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null,
    body varchar(255) not null,
    post_id bigint not null,
    constraint fk_comment_post foreign key(post_id)
                        references tbl_post(id)
                        on delete cascade
);

select * from tbl_post;
select * from tbl_comment;

create table tbl_album(
    id bigint auto_increment primary key,
    title varchar(255) not null,
    user_id bigint not null,
    constraint fk_album_user foreign key(user_id)
                      references tbl_user(id)
                      on delete cascade
);

create table tbl_photo(
    id bigint auto_increment primary key,
    title varchar(255) not null,
    url varchar(255) not null,
    thumbnail_url varchar(255) not null,
    album_id bigint not null,
    constraint fk_photo_album foreign key(album_id)
                      references tbl_album(id)
                      on delete cascade
);

select * from tbl_album;
select * from tbl_photo;

create table tbl_todo(
    id bigint auto_increment primary key,
    title varchar(255) not null,
    completed tinyint default 0,
    user_id bigint not null,
    constraint fk_todo_user foreign key(user_id)
                      references tbl_user(id)
                      on delete cascade
);
select * from tbl_todo;
