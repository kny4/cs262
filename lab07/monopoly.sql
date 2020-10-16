--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player; 
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS GameProperty; --added by kny4

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

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	position varchar(50) NOT NULL,
	PRIMARY KEY (gameID, playerID)
	);

--added by kny4
CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	property varchar(50),
	development varchar(50),
	PRIMARY KEY (gameID, property)
)
-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON GameProperty TO PUBLIC; --added by kny4

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

--added cash and position by kny4
INSERT INTO PlayerGame VALUES (1, 1, 0.00, 1, 'start');
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 1, 'start');
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 1, 'start');
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 1, 'start');
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 1, 'start');
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 1, 'start');
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 1, 'start');
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 1, 'start');

--added by kny4

INSERT INTO GameProperty VALUES (1, 'Boardwalk', 1, 'hotel');
INSERT INTO GameProperty VALUES (2, 'Boardwalk', 2, 'house');
INSERT INTO GameProperty VALUES (3, 'Boardwalk', 3, 'none');
INSERT INTO GameProperty VALUES (1, 'Electric Company', 3, 'none');
INSERT INTO GameProperty VALUES (1, 'New York Ave', 3, 'house');
