
-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

DROP TABLE IF EXISTS brewery;

CREATE TABLE brewery (
  brewery_id SERIAL PRIMARY KEY not null,
  breweryname varchar(50) not null,
  address1 varchar(50) unique,
  address2 varchar(50),
  city varchar(50) not null,
  district varchar(50) not null,
  postalcode varchar(50) not null,
  country varchar(50) not null,
  phonenumber varchar(25),
  webaddress varchar(100) not null,
  imagepath varchar(200),
  user_image_upload boolean DEFAULT FALSE,
  brewerydescription text not null,
  UNIQUE (breweryname)
);

DROP TABLE IF EXISTS beer;

CREATE TABLE beer (
  beer_id SERIAL PRIMARY KEY,
  brewery_id integer not null,
  beername varchar(50) not null,
  beertype varchar(250) not null,
  abv varchar(10),
  flavor varchar(250),
  color varchar(250),
  aroma varchar(250),
  beerdescription text,
  imagepath varchar(200),
  CONSTRAINT fk_beer_brewery foreign key (brewery_id) references brewery(brewery_id),
  UNIQUE (brewery_id, beername)
);

DROP TABLE IF EXISTS review;

CREATE TABLE review (
review_id SERIAL PRIMARY KEY,
beer_id integer not null,
username varchar(100),
title varchar(100) not null,
review text not null,
rating integer not null,
review_date timestamp,
CONSTRAINT fk_beer_review foreign key (beer_id) references beer(beer_id) ON DELETE CASCADE
);

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;

CREATE TABLE app_user (
  user_id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

DROP TABLE IF EXISTS brewery_user;

CREATE TABLE brewery_user (
    brewery_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT pk_brewery_user_brewery_id_user_id PRIMARY KEY (brewery_id, user_id) 
);

COMMIT;



