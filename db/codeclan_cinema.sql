DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE showing_times;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE films(
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4,
  ticket_sold INT4,
  boxoffice INT4
);

CREATE TABLE customers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE showing_times(
  id SERIAL4 PRIMARY KEY,
  start_time TIME
);


CREATE TABLE screenings(
  id SERIAL4 PRIMARY KEY,
  screen_no INT4,
  seat INT4,
  showing_time_id INT4 REFERENCES showing_times(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE tickets(
  id SERIAL4 PRIMARY KEY,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT4 REFERENCES screenings(id) ON DELETE CASCADE,
  price INT4,
  seat_no VARCHAR
);
