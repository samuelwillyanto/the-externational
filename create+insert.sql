CREATE DATABASE The_Externational
GO
USE The_Externational
GO

CREATE TABLE region (
	region_id CHAR(5) PRIMARY KEY 
	CHECK (region_id LIKE ('RG[0-9][0-9][0-9]')),
	region_name VARCHAR(255) NOT NULL
)
GO

CREATE TABLE player (
	player_id CHAR(5) PRIMARY KEY CHECK (player_id LIKE 'PL[0-9][0-9][0-9]'),
	region_id CHAR(5) FOREIGN KEY REFERENCES region(region_id)
	ON UPDATE CASCADE ON DELETE CASCADE,
	player_name VARCHAR(255) NOT NULL
)
GO

CREATE TABLE position (
	position_id CHAR(5) PRIMARY KEY CHECK (position_id LIKE 'POS[0-9][0-9]'),
	position_name VARCHAR(255) NOT NULL
)
GO

CREATE TABLE team (
	team_id CHAR(5) PRIMARY KEY CHECK (team_id LIKE 'TM[0-9][0-9][0-9]'),
	region_id CHAR(5) FOREIGN KEY REFERENCES region(region_id) ON UPDATE CASCADE ON DELETE CASCADE,
	team_name VARCHAR(255) NOT NULL
)
GO

CREATE TABLE team_detail (
	team_id CHAR(5) FOREIGN KEY REFERENCES team(team_id) ON UPDATE CASCADE ON DELETE CASCADE,
	position_id CHAR(5) FOREIGN KEY REFERENCES position(position_id) ON UPDATE CASCADE ON DELETE CASCADE,
	player_id CHAR(5) FOREIGN KEY REFERENCES player(player_id),
	joined_date DATE NOT NULL,
	PRIMARY KEY(team_id, position_id, player_id)
)
GO

CREATE TABLE [match] (
	match_id CHAR(5) PRIMARY KEY CHECK (match_id LIKE 'MT[0-9][0-9][0-9]'),
	match_schedule DATETIME NOT NULL
)
GO

CREATE TABLE [match_detail] (
	match_id CHAR(5) FOREIGN KEY REFERENCES [match](match_id) ON UPDATE CASCADE ON DELETE CASCADE,
	team_id CHAR(5) FOREIGN KEY REFERENCES team(team_id) ON UPDATE CASCADE ON DELETE CASCADE,
	team_score INT NOT NULL,
	PRIMARY KEY (match_id, team_id)
)
GO

INSERT INTO region VALUES
('RG001', 'Southeast Asia'),
('RG002', 'China'),
('RG003', 'Europe'),
('RG004', 'Commonwealth of Independent States'),
('RG005', 'Russia'),
('RG006', 'Ukraine'),
('RG007', 'Pakistan'),
('RG008', 'Finland'),
('RG009', 'North Macedonia'),
('RG010', 'Denmark'),
('RG011', 'Moldowa'),
('RG012', 'Malaysia'),
('RG013', 'Poland'),
('RG014', 'Sweden'),
('RG015', 'Jordan'),
('RG016', 'Estonia'),
('RG017', 'Thailand'),
('RG018', 'Philipines'),
('RG019', 'Indonesia')
GO

INSERT INTO player VALUES
('PL001', 'RG002', 'poyoyo'),
('PL002', 'RG002', 'Ori'),
('PL003', 'RG002', 'old eLeVeN'),
('PL004', 'RG002', 'Pyw'),
('PL005', 'RG002', 'Dy'),
('PL006', 'RG006', 'Yatoro'),
('PL007', 'RG005', 'TORONTOTOKYO'),
('PL008', 'RG005', 'Collapse'),
('PL009', 'RG006', 'Mira'),
('PL010', 'RG005', 'Miposhka'),
('PL011', 'RG007', 'SumaiL'),
('PL012', 'RG008', 'Topson'),
('PL013', 'RG009', 'Saksa'),
('PL014', 'RG010', 'N0tail'),
('PL015', 'RG005', 'Nightfall'),
('PL016', 'RG005', 'gpk'),
('PL017', 'RG005', 'DM'),
('PL018', 'RG011', 'Save-'),
('PL019', 'RG005', 'Kingslayer'),
('PL020', 'RG002', 'flyfly'),
('PL021', 'RG002', 'Emo'),
('PL022', 'RG012', 'JT-'),
('PL023', 'RG002', 'Kaka'),
('PL024', 'RG012', 'Oli'),
('PL025', 'RG008', 'MATUMBAMAN'),
('PL026', 'RG013', 'Nisha'),
('PL027', 'RG014', 'zai'),
('PL028', 'RG015', 'YapzOr'),
('PL029', 'RG016', 'Puppey'),
('PL030', 'RG017', '23savage'),
('PL031', 'RG018', 'Karl'),
('PL032', 'RG018', 'Kuku'),
('PL033', 'RG019', 'Whitemon'),
('PL034', 'RG019', 'Xepher'),
('PL035', 'RG002', 'Ame'),
('PL036', 'RG002', 'Faith_bian'),
('PL037', 'RG002', 'XinQ'),
('PL038', 'RG002', 'y`'),
('PL039', 'RG012', 'NothingToSay')
GO

INSERT INTO team VALUES
('TM001', 'RG002', 'PSG.LGD'),
('TM002', 'RG002', 'Vici Gaming'),
('TM003', 'RG004', 'Team Spirit'),
('TM004', 'RG003', 'OG'),
('TM005', 'RG004', 'Virtus.pro'),
('TM006', 'RG002', 'Invictus Gaming'),
('TM007', 'RG003', 'Team Secret'),
('TM008', 'RG001', 'T1')
GO

INSERT INTO position VALUES
('POS01', 'Carry'),
('POS02', 'Mid'),
('POS03', 'Offlane'),
('POS04', 'Support 4'),
('POS05', 'Support 5')
GO

INSERT INTO team_detail VALUES
('TM001', 'POS01', 'PL035', '2020-09-16'),
('TM001', 'POS02', 'PL039', '2020-09-16'),
('TM001', 'POS03', 'PL036', '2020-09-16'),
('TM001', 'POS04', 'PL037', '2020-09-16'),
('TM001', 'POS05', 'PL038', '2020-09-16'),
('TM002', 'POS01', 'PL001', '2020-09-15'),
('TM002', 'POS02', 'PL002', '2017-01-09'),
('TM002', 'POS03', 'PL003', '2020-09-15'),
('TM002', 'POS04', 'PL004', '2019-09-21'),
('TM002', 'POS05', 'PL005', '2018-09-09'),
('TM003', 'POS01', 'PL006', '2020-12-19'),
('TM003', 'POS02', 'PL007', '2020-12-19'),
('TM003', 'POS03', 'PL008', '2020-12-19'),
('TM003', 'POS04', 'PL009', '2021-03-01'),
('TM003', 'POS05', 'PL010', '2020-12-19'),
('TM004', 'POS01', 'PL011', '2021-06-15'),
('TM004', 'POS02', 'PL012', '2018-06-03'),
('TM004', 'POS04', 'PL013', '2020-01-29'),
('TM004', 'POS05', 'PL014', '2015-10-31'),
('TM005', 'POS01', 'PL015', '2020-11-05'),
('TM005', 'POS02', 'PL016', '2020-11-05'),
('TM005', 'POS03', 'PL017', '2020-11-05'),
('TM005', 'POS04', 'PL018', '2020-11-05'),
('TM005', 'POS05', 'PL019', '2020-11-05'),
('TM006', 'POS01', 'PL020', '2019-06-14'),
('TM006', 'POS02', 'PL021', '2018-09-12'),
('TM006', 'POS03', 'PL022', '2019-04-07'),
('TM006', 'POS04', 'PL023', '2019-09-18'),
('TM006', 'POS05', 'PL024', '2018-09-12'),
('TM007', 'POS01', 'PL025', '2019-11-04'),
('TM007', 'POS02', 'PL026', '2018-09-11'),
('TM007', 'POS03', 'PL027', '2018-09-11'),
('TM007', 'POS04', 'PL028', '2017-05-04'),
('TM007', 'POS05', 'PL029', '2014-08-27'),
('TM008', 'POS01', 'PL030', '2021-03-04'),
('TM008', 'POS02', 'PL031', '2020-10-29'),
('TM008', 'POS03', 'PL032', '2021-01-18'),
('TM008', 'POS04', 'PL034', '2020-11-27'),
('TM008', 'POS05', 'PL033', '2021-01-18')
GO

INSERT INTO [match] VALUES
('MT001', '2021-10-12 14:55:00'),
('MT002', '2021-10-12 19:20:00'),
('MT003', '2021-10-13 14:25:00'),
('MT004', '2021-10-13 18:35:00'),
('MT005', '2021-10-14 21:50:00'),
('MT006', '2021-10-15 00:35:00'),
('MT007', '2021-10-15 14:10:00'),
('MT008', '2021-10-15 16:45:00'),
('MT009', '2021-10-15 20:15:00'),
('MT010', '2021-10-16 14:00:00')
GO

INSERT INTO match_detail VALUES
('MT001', 'TM006', 2),
('MT001', 'TM003', 1),
('MT002', 'TM007', 2),
('MT002', 'TM004', 0),
('MT003', 'TM001', 2),
('MT003', 'TM008', 1),
('MT004', 'TM005', 2),
('MT004', 'TM002', 1),
('MT005', 'TM006', 0),
('MT005', 'TM007', 2),
('MT006', 'TM001', 2),
('MT006', 'TM005', 0),
('MT007', 'TM003', 2),
('MT007', 'TM004', 0),
('MT008', 'TM008', 1),
('MT008', 'TM002', 2),
('MT009', 'TM005', 1),
('MT009', 'TM003', 2),
('MT010', 'TM006', 0),
('MT010', 'TM002', 0)