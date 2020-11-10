--
-- This SQL script initializes the package manager database, deleting any pre-existing version.
--
-- @author Andrew Feikema
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS Package;
DROP TABLE IF EXISTS Person;
DROP TYPE IF EXISTS State;
DROP TYPE IF EXISTS BuildingCode CASCADE;
DROP TYPE IF EXISTS HallCode CASCADE;
DROP TYPE IF EXISTS PackageColor;
DROP TYPE IF EXISTS PackageSize;
DROP TYPE IF EXISTS PackageType;
DROP TYPE IF EXISTS Role;

-- all possible package statuses
CREATE TYPE State AS ENUM ('Unassigned', 'Registered', 'Received', 'Archived', 'Deleted');
CREATE TYPE BuildingCode AS Enum ('SE', 'NVW', 'KHVR', 'BHT', 'BV', 'BB', 'RVD');
CREATE TYPE HallCode AS ENUM ('SZ', 'EL', 'NO', 'VW', 'KL', 'HZ', 'VR', 'BL', 'HY', 'TM', 'BS', 'VE', 'BO', 'BN', 'RK', 'VD');
CREATE TYPE PackageColor AS ENUM ('Yellow', 'Brown', 'White', 'Other');
CREATE TYPE PackageSize AS ENUM ('Small', 'Medium', 'Large', 'Other');
CREATE TYPE PackageType AS ENUM ('Envelope', 'Box', 'Bag', 'Other');
CREATE TYPE Role AS ENUM ('Resident', 'Deskie', 'Both');

CREATE TABLE Person (
	emailPrefix varchar(10) PRIMARY KEY,
	firstname varchar(25) NOT NULL,
	lastname varchar(25) NOT NULL,
    ResidentHall HallCode,
	ResidentRoom varchar(20), -- e.g. 208
	DeskCode BuildingCode,
	PersonType Role
	);

-- Create the schema.
CREATE TABLE Package (
	ID integer PRIMARY KEY,
	DeskID integer NOT NULL,
    Recipient varchar(10) REFERENCES Person(emailPrefix),
	Building BuildingCode NOT NULL,
    Status State NOT NULL,
	EnteredTime timestamp,
	EnteredDeskie varchar(10) REFERENCES Person(emailPrefix),
	ReceivedTime timestamp,
	ReceivedDeskie varchar(10) REFERENCES Person(emailPrefix)
	);

-- Sample Entries

INSERT INTO Person ( emailPrefix, firstname, lastname, ResidentHall, ResidentRoom, DeskCode, PersonType) VALUES
	('ajf34', 'Andrew', 'Feikema', 'SZ', '268', 'SE', 'Resident'),
	('eac2', 'Emily', 'Costa', 'TM', '123', 'BHT', 'Resident'),
	('ctu2', 'Coleman', 'Ulry', 'VD', '323', 'RVD', 'Resident'),
	('bjd47', 'Ben', 'DeVries', 'VR', '300', 'KHVR', 'Both'),
	('eaj23', 'Ella', 'Johnson', 'VR', '350', 'KHVR', 'Deskie'),
	('mgv3', 'Megan', 'Vandee', 'EL', '234', 'BHT', 'Deskie'),
	('ys2', 'August', 'Shi', 'SZ', '268', 'SE', 'Resident'),
	('cib26', 'Cece', 'Byrd', 'EL', '268', 'SE', 'Resident');


INSERT INTO Package ( ID, DeskID, Recipient, Building, Status, EnteredTime, EnteredDeskie, ReceivedTime, ReceivedDeskie) VALUES
	(1, 1, 'ajf34', 'SE', 'Archived', '2020-10-21 14:03:12', 'bjd47', '2020-2-1 18:03:24', 'bjd47'),
	(2, 21, 'ajf34', 'SE', 'Registered', '2019-5-11 17:53:47', 'bjd47', '2020-2-1 18:03:24', 'bjd47'),
	(31, 1, 'eac2', 'BHT', 'Registered', '2020-1-31 18:03:24', 'mgv3', '2020-2-1 18:03:24', 'bjd47');