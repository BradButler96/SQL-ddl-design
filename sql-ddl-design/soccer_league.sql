-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE Teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE Refs (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    yrs_as_ref INT
);

CREATE TABLE Players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team TEXT NOT NULL,
    position TEXT
);

CREATE TABLE Season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Matches (
    id SERIAL PRIMARY KEY,
    home_team INT NOT NULL,
    away_team INT NOT NULL,
    location TEXT,
    date DATE,
    season_id INT,
    ref1 INT,
    ref2 INT,
    ref3 INT,
    CONSTRAINT fk_home_team FOREIGN KEY (home_team) REFERENCES Teams(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_away_team FOREIGN KEY (away_team) REFERENCES Teams(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_season_id FOREIGN KEY (season_id) REFERENCES Season(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ref1 FOREIGN KEY (ref1) REFERENCES Refs(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ref2 FOREIGN KEY (ref2) REFERENCES Refs(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_ref3 FOREIGN KEY (ref3) REFERENCES Refs(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Results (
    id SERIAL PRIMARY KEY,
    match_id INT,
    results(Home-Away) TEXT,
    CONSTRAINT fk_match_id FOREIGN KEY (match_id) REFERENCES Matches(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Goals (
    id SERIAL PRIMARY KEY,
    match_id INT,
    player_id INT,
    CONSTRAINT fk_match_id FOREIGN KEY (match_id) REFERENCES Matches(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_player_id FOREIGN KEY (player_id) REFERENCES Players(id) ON DELETE CASCADE ON UPDATE CASCADE

);




------------------------------------------------------------------------------------------------
-- Teams
-- -
-- id pk int
-- name string
-- city string

-- Refs
-- -
-- id pk int FK >- Matches.ref2
-- name string
-- yrs_as_ref int

-- Players
-- -
-- id pk int
-- name string
-- team string
-- position string

-- Season
-- -
-- id pk int
-- start_date date
-- end_date date

-- Matches
-- -
-- id pk int FK >- Results.match_id
-- home_team int FK >- Teams.id
-- away_team int FK >- Teams.id
-- location string
-- date date
-- season_id int FK >- Season.id
-- ref1 int FK >- Refs.id
-- ref2 int
-- ref3 int FK >- Refs.id

-- Results
-- -
-- id pk int
-- match_id int
-- results stribng

-- Goals
-- -
-- id pk int
-- match_id int FK >- Matches.id
-- player_id int FK >- Players.id
