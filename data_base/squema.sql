CREATE DATABASE catalog;

CREATE TABLE genre (
  id  INT GENERATED ALWAYS AS IDENTITY,
  name  VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);

CREATE TABLE label(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(32),
  color VARCHAR(20),
);

CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  source_id INT,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (label_id) REFERENCES label (id),
  FOREIGN KEY (source_id) REFERENCES source (id)
);

CREATE TABLE game(
  item_id INT REFERENCES item(id),
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY(item_id)
);

CREATE TABLE album (
  item_id  INT REFERENCES item(id),
  on_spotify  BOOLEAN,
  PRIMARY KEY(item_id)
);

CREATE TABLE book(
  item_id INT PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(32),
<<<<<<< HEAD
  cover_state VARCHAR(32)
  FOREIGN KEY (genre_id) REFERENCES genre (id),
  FOREIGN KEY (author_id) REFERENCES author (id),
  FOREIGN KEY (label_id) REFERENCES label (id),
);
=======
  cover_state VARCHAR(32),
  FOREIGN KEY (item_id) REFERENCES item (id),
);
>>>>>>> dev
