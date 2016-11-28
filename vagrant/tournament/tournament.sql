-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


DROP TABLE IF EXISTS matches CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP VIEW IF EXISTS wins;
DROP VIEW IF EXISTS games;
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;
USE DATABASE tournament;
CREATE TABLE players (
  id  SERIAL PRIMARY KEY,
  name  varchar(50)
);
CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  winner integer REFERENCES players ON DELETE CASCADE ON UPDATE CASCADE,
  loser integer REFERENCES players ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE VIEW wins AS
  SELECT players.id, COUNT(matches.winner)
  FROM players
  JOIN matches ON players.id = matches.winner
  GROUP BY players.id;

CREATE VIEW games AS
  SELECT players.id, COUNT(matches.id)
  FROM players
  JOIN matches ON players.id = matches.winner OR players.id = matches.loser
  GROUP BY players.id;
