DROP TABLE loans;
DROP TABLE customers;
DROP TABLE games;
DROP TABLE genres;
DROP TABLE play_times;
DROP TABLE player_counts;

CREATE TABLE genres (
  id SERIAL8 PRIMARY KEY,
  genre VARCHAR(255)
);

CREATE TABLE play_times(
  id SERIAL4 PRIMARY KEY,
  play_time INT8
);

CREATE TABLE player_counts(
  id SERIAL4 PRIMARY KEY,
  player_count INT8
);

CREATE TABLE games (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  owner VARCHAR(255),
  times_played INT4,
  genre_id INT8 REFERENCES genres(id),
  player_count_id INT4 REFERENCES player_counts(id),
  play_time_id INT4 REFERENCES play_times(id)
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  badge_number INT4,
  name VARCHAR(255)
);

CREATE TABLE loans (
  id SERIAL8 PRIMARY KEY,
  game_id INT8 REFERENCES games(id),
  customer_id INT8 REFERENCES customers(id),
  returned BOOLEAN DEFAULT false,
  day_borrowed VARCHAR(255)
);
