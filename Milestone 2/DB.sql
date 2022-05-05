-- Schema PLDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PLDB`;
CREATE SCHEMA IF NOT EXISTS `PLDB`;
USE `PLDB` ;

-- -----------------------------------------------------
-- Table `PLDB`.`Club`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Club (
Name                    VARCHAR(255)    NOT NULL,
HomeStadium            VARCHAR(255),
Website            VARCHAR(255),
PRIMARY KEY (Name)
);




-- -----------------------------------------------------
-- Table `PLDB`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Player (
FName           VARCHAR(255)    NOT NULL,
LName           VARCHAR(255) ,
HomeTeam           VARCHAR(255)    NOT NULL,
DoB           	DATE,
Nationality	VARCHAR(255),
Position		VARCHAR(255),
Weight		INT UNSIGNED,
Height		INT UNSIGNED,
PRIMARY KEY (FName, DoB, HomeTeam),
 FOREIGN KEY (HomeTeam) REFERENCES Club (Name)
 ON UPDATE CASCADE ON DELETE CASCADE
);





-- -----------------------------------------------------
-- Table `PLDB`.`PlaysIn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PlaysIn (
PlayerFName            VARCHAR(255)    NOT NULL,
PlayerLName           VARCHAR(255)    ,
ClubName           VARCHAR(255)    NOT NULL,
Season           VARCHAR(255),
PRIMARY KEY (PlayerFName,ClubName,Season),
 FOREIGN KEY (PlayerFName) REFERENCES Player (FName)
 ON UPDATE CASCADE  ON DELETE CASCADE,
 FOREIGN KEY (ClubName) REFERENCES Club (Name)
 ON UPDATE CASCADE  ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table `PLDB`.`Stadium`
-- -- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Stadium (
Name            VARCHAR(255)    NOT NULL,
ClubName        VARCHAR(255)    NOT NULL,
Attendance		INT UNSIGNED,
BuildingDate           	INT unsigned,
Street		VARCHAR(255),
District		VARCHAR(255),
City			VARCHAR(255),
Capacity		INT UNSIGNED,
PitchSize		varchar(255),
PRIMARY KEY (Name),
FOREIGN KEY (ClubName) REFERENCES Club (Name)
ON UPDATE CASCADE
);



-- -----------------------------------------------------
-- Table `PLDB`.`Matchs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Matchs (
AwayTeamScore            VARCHAR(255),
HomeTeamScore		VARCHAR(255),
Date		DATE 	NOT NULL,
Season		VARCHAR(255),
StadiumName		VARCHAR(255),
HomeTeam			VARCHAR(255),
AwayTeam			VARCHAR(255),
PRIMARY KEY (Date, HomeTeam, AwayTeam),
FOREIGN KEY (StadiumName) REFERENCES Stadium (Name)
 ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (HomeTeam) REFERENCES Club (Name)
 ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (AwayTeam) REFERENCES Club (Name)
ON UPDATE CASCADE ON DELETE CASCADE
);
-- -----------------------------------------------------
-- Table `PLDB`.`gets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS gets (
ClubName                    VARCHAR(255)    NOT NULL,
Possession            FLOAT,
Ycards              INT UNSIGNED,
Rcards                INT UNSIGNED,
Goals                    INT UNSIGNED,
Shots             		INT UNSIGNED,
Fouls			INT UNSIGNED,
HomeTeam			VARCHAR(255),
AwayTeam			VARCHAR(255),
MatchDate		DATE,
-- MatchSeason		VARCHAR(255),
primary key(ClubName ,HomeTeam,AwayTeam,MatchDate),
FOREIGN KEY (ClubName) REFERENCES Club (Name)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (MatchDate) REFERENCES Matchs (Date)
ON UPDATE CASCADE ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table `PLDB`.`Fan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Fan (
Username                VARCHAR(255)    NOT NULL,
Email                   VARCHAR(255)    NOT NULL,
Gender                  CHAR(1),
DoB               DATE,
ClubName		VARCHAR(255),
PRIMARY KEY (Username),
FOREIGN KEY (ClubName) REFERENCES Club (Name)
ON UPDATE CASCADE ON DELETE CASCADE
);


-- -----------------------------------------------------
-- View `PLDB`.`FanAge`
-- -----------------------------------------------------
CREATE OR REPLACE VIEW FanAge AS
SELECT TIMESTAMPDIFF(YEAR, F.DoB, CURDATE()) AS fan_age
FROM Fan F;


-- -----------------------------------------------------
-- View `PLDB`.`FansNo`
-- -----------------------------------------------------
CREATE OR REPLACE VIEW FansNo AS
SELECT COUNT(F.Username) AS fans_no
FROM Fan F;

-- -----------------------------------------------------
-- View `PLDB`.`PlayersNo`
-- -----------------------------------------------------
CREATE OR REPLACE VIEW PlayersNo AS
SELECT COUNT(P.FName) AS players_no
FROM Player P;

-- -----------------------------------------------------
-- Table `PLDB`.`givesReviews`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS givesReviews (
Username         VARCHAR(255)   NOT NULL,
Rating              ENUM('1','2','3','4','5','6','7','8','9','10')  NOT NULL,
Text             	VARCHAR(1024),
Review_Date		DATE,
Home_team  VARCHAR(255) ,
Away_Team VARCHAR(255),
Match_Date DATE,
-- Email            VARCHAR(255)    NOT NULL,
PRIMARY KEY (Username),
FOREIGN KEY (Username) REFERENCES Fan (Username)
ON UPDATE CASCADE ON DELETE CASCADE,

FOREIGN KEY (Match_Date) REFERENCES Matchs (Date)
ON UPDATE CASCADE ON DELETE CASCADE
);
 -- FOREIGN KEY (Email) REFERENCES Fan (Email)
-- ON UPDATE CASCADE ON DELETE CASCADE,


