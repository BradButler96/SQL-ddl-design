-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Region (
    id SERIAL PRIMARY KEY,
    state TEXT NOT NULL,
    city TEXT NOT NULL,
    zip_code INT NOT NULL
);

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    preferred_region_id INT,
    num_of_posts INT DEFAULT 0,
    CONSTRAINT fk_preferred_region_id FOREIGN KEY (preferred_region_id) REFERENCES Region(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY
);

CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    poster_id INT,
    post_region_id INT,
    category_id INT,
    CONSTRAINT fk_poster_id FOREIGN KEY (poster_id) REFERENCES Users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_post_region_id FOREIGN KEY (post_region_id) REFERENCES Region(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE ON UPDATE CASCADE
);



------------------------------------------------------------------------------------------------
-- Region
-- -
-- id pk int
-- state string
-- city string
-- zip_code string

-- Users
-- -
-- id pk int
-- preferred_region_id int FK >- Region.id
-- num_of_posts int


-- Categories
-- -
-- id pk int


-- Posts
-- -
-- id pk int
-- title string
-- description string
-- poster_id int FK >- Users.id
-- post_region_id int FK >- Region.id
-- category_id int FK >- Categories.id