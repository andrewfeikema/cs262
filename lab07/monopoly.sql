--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author Andrew Feikema
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TYPE IF EXISTS developments;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

-- all possible development counts: 0 - 4 houses, 1 hotel 
CREATE TYPE developments AS ENUM ('0 houses', '1 house', '2 houses', '3 houses', '4 houses', '1 hotel');

CREATE TABLE Property (
	gameID integer REFERENCES Game(ID),
	ownerID integer REFERENCES Player(ID),
	name varchar(50), -- e.g. Oriental Ave.
	buildings developments,
	PRIMARY KEY(gameID, name)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score real,
	position varchar(50)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 1, 'Oriental Ave.', '1 house');
INSERT INTO Property VALUES (1, 2, 'Free Parking', '0 houses');
INSERT INTO Property VALUES (1, 3, 'St. Charles Place', '2 houses');
INSERT INTO Property VALUES (2, 1, 'Illinois Ave.', '1 hotel');
INSERT INTO Property VALUES (2, 2, 'Chance 1', '0 houses');
INSERT INTO Property VALUES (2, 3, 'Luxury Tax', '0 houses');
INSERT INTO Property VALUES (3, 2, 'Go', '0 houses');
INSERT INTO Property VALUES (3, 3, 'Income Tax', '0 houses');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 'Oriental Ave.');
INSERT INTO PlayerGame VALUES (1, null, 0.00, 'Free Parking');
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 'St. Charles Place');
INSERT INTO PlayerGame VALUES (2, 2, 1000.00, 'Illinois Ave.');
INSERT INTO PlayerGame VALUES (2, null, 0.00, 'Chance 1');
INSERT INTO PlayerGame VALUES (2, null, 500.00, 'Luxury Tax');
INSERT INTO PlayerGame VALUES (3, null, 0.00, 'Go');
INSERT INTO PlayerGame VALUES (3, null, 5500.00, 'Income Tax');
