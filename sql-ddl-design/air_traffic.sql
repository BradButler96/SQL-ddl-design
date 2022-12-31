-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');


CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline TEXT
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline_id INTEGER,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  departing_location_id INTEGER NOT NULL REFERENCES locations,
  arriving_location_id INTEGER NOT NULL REFERENCES locations
);

CREATE TABLE ticket (
  id SERIAL PRIMARY KEY,
  flight_id INTEGER REFERENCES flights,
  passenger_id INTEGER REFERENCES passengers,
  seat TEXT
);

INSERT INTO passengers (first_name, last_name)
  VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO locations (city, country)
  VALUES
  ('Washington DC', 'United States'),
  ('Tokyo', 'Japan'),
  ('Los Angeles', 'United States'),
  ('Seattle', 'United States'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('New York', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Charlotte', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('London', 'United Kingdom'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Beijing', 'China'),  
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),  
  ('Santiago', 'Chile');

INSERT INTO airlines (airline)
  VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO flights (airline_id, departure_time, arrival_time, departing_location_id, arriving_location_id)
  VALUES
  (1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 4),
  (2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 11),
  (3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 12),
  (3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 13),
  (4, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5, 14),
  (5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 15),
  (1, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 9),
  (6, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8, 16),
  (6, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 9, 17),
  (7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 10, 18);

INSERT INTO ticket (flight_id, passenger_id, seat)
  VALUES
  (1, 1, '33B'),
  (2, 2, '8A'),
  (3, 3, '12F'),
  (4, 1, '20A'),
  (5, 4, '23D'),
  (6, 2, '18C'),
  (7, 5, '9E'),
  (8, 6, '1A'),
  (9, 5, '32B'),
  (10, 7, '10D');

SELECT p.first_name, 
  p.last_name,
  t.seat,
  f.departure_time,
  f.arrival_time,
  concat(dep.city, ', ', dep.country) AS departing_location,
  concat(arr.city, ', ', arr.country) AS arriving_location
FROM ticket t
JOIN flights f
ON flight_id = f.id
JOIN passengers p 
ON passenger_id = p.id
JOIN locations dep
ON departing_location_id = dep.id
JOIN locations arr
ON arriving_location_id = arr.id





--------------------------------
-- passengers
-- -
-- id pk int
-- first_name string
-- last_name string

-- locations
-- -
-- id pk int
-- city string
-- country string

-- airlines
-- -
-- id pk int FK >- flights.airline_id
-- airline string

-- flights
-- -
-- id pk int FK >- ticket.flight_id
-- airline_id int
-- departure_time timestamp
-- arrival_time timestamp
-- departing_location_id int FK >- locations.id
-- arriving_location_id int FK >- locations.id

-- ticket
-- -
-- id pk int
-- flight_id int
-- passenger_id int FK >- passengers.id
-- seat string