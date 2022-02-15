
drop table album CASCADE;
drop table album_singer CASCADE;
drop table collection CASCADE;
drop table genre CASCADE;
drop table singer CASCADE;
drop table singer_genre CASCADE; 
drop table track CASCADE;
drop table rack_collection CASCADE;



create table if not exists genre (
	id serial primary key,
	genre_name varchar(40) unique not null
);


create table if not exists singer (
	id serial primary key,
	full_name text unique not null,
	nickname varchar(40) unique not null
);


create table if not exists singer_genre (
	singer_id int references singer(id),
	genre_id int references genre(id),
	constraint singer_genre_pk primary key (singer_id, genre_id)
);


create table if not exists album (
	id serial primary key,
	album_name text unique not null,
	release_year int not null
);

create table if not exists album_singer (
	singer_id int references singer(id),
	album_id int references album(id), 
	constraint album_singer_pk primary key (singer_id, album_id)
);


create table if not exists track (
	id serial primary key,
	track_name text unique not null,
	duration numeric not null,
	album_id int references album(id) 
);


create table if not exists collection (
	id serial primary key,
	track_name text unique not null,
	release_year int not null,
	track_id int references track(id) 
);

create table if not exists track_collection (
	track_id int references track(id),
	collection_id int references collection(id), 
	constraint track_collection_pk primary key (track_id, collection_id)
);

