DROP TABLE loans;
DROP TABLE customers;
DROP TABLE games;

CREATE TABLE games (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  owner VARCHAR(255),
  times_played INT4,
  genre VARCHAR(255),
  player_count INT4,
  play_time INT4
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
  returned BOOLEAN,
  day_borrowed VARCHAR(255)
);
