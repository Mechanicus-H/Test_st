.open airports_db;
PRAGMA foreign_keys = ON;

CREATE TABLE cities(
city_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
name VARCHAR(30) NOT NULL,
);

INSERT INTO cities (name) VALUES('Minsk');
INSERT INTO cities (name) VALUES('Mogilev');
INSERT INTO cities (name) VALUES('Vitebsk');
INSERT INTO cities (name) VALUES('Gomel');
INSERT INTO cities (name) VALUES('Grodno');
INSERT INTO cities (name) VALUES('Brest');

CREATE TABLE airports (
airport_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
city_id INTEGER NOT NULL,
name VARCHAR(30) NOT NULL,
FOREIGN KEY(city_id) REFERENCES cities(city_id)
);
 
INSERT INTO airports (city_id, name) VALUES(1, 'Minsk-1');
INSERT INTO airports (city_id, name) VALUES(1, 'Minsk-2');
INSERT INTO airports (city_id, name) VALUES(6, 'Brest-central');

SELECT * FROM airports;
