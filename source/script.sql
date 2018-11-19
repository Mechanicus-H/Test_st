.open airports_db
PRAGMA foreign_keys = ON;

CREATE TABLE cities(
city_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
name VARCHAR(30) NOT NULL
);

INSERT INTO cities (name) VALUES('Minsk');
INSERT INTO cities (name) VALUES('Moscow');
INSERT INTO cities (name) VALUES('St Petersburg');
INSERT INTO cities (name) VALUES('Berlin');
INSERT INTO cities (name) VALUES('Paris');


CREATE TABLE airports (
airport_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
city_id INTEGER NOT NULL,
name VARCHAR(30) NOT NULL,
address VARCHAR(100),
FOREIGN KEY(city_id) REFERENCES cities(city_id)
);

INSERT INTO airports (city_id, name, address) 
VALUES(1, 'Minsk 2', '220054, Minsk, National Airport Minsk');

INSERT INTO airports (city_id, name, address)
 VALUES(2, 'Vnukovo', '119027, Moscow, Rejsovaja st, 12');
INSERT INTO airports (city_id, name, address) 
VALUES(2, 'Domodedovo', '142015, a/p Domodedovo');

INSERT INTO airports (city_id, name, address) 
VALUES(3, 'Pulkovo', '196210, St Petersburg, Pilotov st, 18-4');

INSERT INTO airports (city_id, name, address) 
VALUES(4, 'Tegel', 'Berliner Flughafen-Gessellschat mbH, 13405 Berlin, Germany');
INSERT INTO airports (city_id, name, address) 
VALUES(4, 'Schonefeld', 'Berlin Schonefeld Airport, Schonefeld');

INSERT INTO airports (city_id, name, address) 
VALUES(5, 'Beauvais', 'Paris Beauvais Tille Airport');
INSERT INTO airports (city_id, name, address) 
VALUES(5, 'Le Bourget', 'Paris Le Bourget Airport');
INSERT INTO airports (city_id, name, address) 
VALUES(5, 'Charles de Gaulle Airport', 'B.P.20101, 95711 Roissy Charles de Gaulle, France');


CREATE TABLE plains(
plain_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
airport_id INTEGER NOT NULL,
bort_number VARCHAR(20),
model VARCHAR(30),
passenger_capacity INTEGER,
load_capacity INTEGER,
manufact_year INTEGER,
last_overhaul_year INTEGER,
FOREIGN KEY(airport_id) REFERENCES airports(airport_id)
);

#1
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(1, 'EW-366PA', 'Boeing 737-300', 143, 63276, 1997, 2015);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(1, 'EW-282PA', 'Boeing 737-300', 143, 63276, 1995, 2016);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(1, 'EW-254PA', 'Boeing 737-300', 143, 63276, 1993, 2014);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(1, 'EW-457PA', 'Boeing 737-800', 189, 63320, 2017, 0);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(1, 'EW-456PA', 'Boeing 737-800', 189, 63320, 2016, 0);

#2
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(2, 'EW-364PA', 'Boeing 737-800', 143, 63276, 1993, 2012);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(2, 'EW-212PK', 'Boeing 737-800', 143, 63276, 1997, 2011);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(2, 'EW-254PK', 'Boeing 737-800', 143, 63276, 1996, 2010);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(2, 'EL-477PA', 'Airbus A300', 345, 165000, 1989, 2005);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(2, 'EK-447PA', 'Airbus A300', 345, 165000, 1993, 2001);

#3
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(3, 'EW-364PA', 'Boeing 737-800', 143, 63276, 1993, 2012);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(3, 'EW-212PK', 'Boeing 737-800', 143, 63276, 1997, 2011);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(3, 'EW-254PK', 'Boeing 737-800', 143, 63276, 1996, 2010);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(3, 'EL-477PA', 'Airbus A300', 345, 165000, 1989, 2005);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(3, 'EK-447PA', 'Airbus A300', 345, 165000, 1993, 2001);

#4
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(4, 'EW-364PA', 'Boeing 737-800', 143, 63276, 1993, 2012);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(4, 'EW-212PK', 'Boeing 737-800', 143, 63276, 1997, 2011);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(4, 'EW-254PK', 'Boeing 737-800', 143, 63276, 1996, 2010);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(4, 'EL-477PA', 'Airbus A300', 345, 165000, 1989, 2005);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(4, 'EK-447PA', 'Airbus A300', 345, 165000, 1993, 2001);

#5
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(5, 'EW-364PA', 'Boeing 737-800', 143, 63276, 1993, 2012);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(5, 'EW-212PK', 'Boeing 737-800', 143, 63276, 1997, 2011);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(5, 'EW-254PK', 'Boeing 737-800', 143, 63276, 1996, 2010);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(5, 'EL-477PA', 'Airbus A300', 345, 165000, 1989, 2005);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(5, 'EK-447PA', 'Airbus A300', 345, 165000, 1993, 2001);

#6
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(6, 'EW-366PA', 'Boeing 737-300', 143, 63276, 1997, 2015);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(6, 'EW-282PA', 'Boeing 737-300', 143, 63276, 1995, 2016);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(6, 'EW-254PA', 'Boeing 737-300', 143, 63276, 1993, 2014);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(6, 'EW-457PA', 'Boeing 737-800', 189, 63320, 2017, 0);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(6, 'EW-456PA', 'Boeing 737-800', 189, 63320, 2016, 0);


#7
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(7, 'EW-366PA', 'Boeing 737-300', 143, 63276, 1997, 2015);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(7, 'EW-282PA', 'Boeing 737-300', 143, 63276, 1995, 2016);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(7, 'EW-254PA', 'Boeing 737-300', 143, 63276, 1993, 2014);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(7, 'EW-457PA', 'Boeing 737-800', 189, 63320, 2017, 0);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(7, 'EW-456PA', 'Boeing 737-800', 189, 63320, 2016, 0);

#8
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(8, 'EW-366PA', 'Boeing 737-300', 143, 63276, 1997, 2015);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(8, 'EW-282PA', 'Boeing 737-300', 143, 63276, 1995, 2016);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(8, 'EW-254PA', 'Boeing 737-300', 143, 63276, 1993, 2014);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(8, 'EW-457PA', 'Boeing 737-800', 189, 63320, 2017, 0);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(8, 'EW-456PA', 'Boeing 737-800', 189, 63320, 2016, 0);

#9
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(9, 'EW-366PA', 'Boeing 737-300', 143, 63276, 1997, 2015);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(9, 'EW-282PA', 'Boeing 737-300', 143, 63276, 1995, 2016);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(9, 'EW-254PA', 'Boeing 737-300', 143, 63276, 1993, 2014);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(9, 'EW-457PA', 'Boeing 737-800', 189, 63320, 2017, 0);
INSERT INTO plains (airport_id, bort_number, model, passenger_capacity, load_capacity, manufact_year, last_overhaul_year)
VALUES(9, 'EW-456PA', 'Boeing 737-800', 189, 63320, 2016, 0);
