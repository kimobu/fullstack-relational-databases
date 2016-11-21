-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS match_wins;
CREATE DATABASE tournament;
CREATE TABLE players (
  id  SERIAL PRIMARY KEY,
  name  varchar(50)
);
CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  player1 integer REFERENCES players,
  player2 integer REFERENCES players
);
CREATE TABLE match_wins (
  id SERIAL PRIMARY KEY,
  match integer REFERENCES matches,
  winner integer REFERENCES players
);


INSERT INTO players (name) VALUES ('test1');
INSERT INTO players (name) VALUES ('test2');
insert into matches (player1, player2) values (1,2);
insert into matches (player1, player2) values (1,2);
insert into matches (player1, player2) values (1,2);
insert into matches (player1, player2) values (2,1);
insert into match_wins (match, winner) values (1,1);
insert into match_wins (match, winner) values (2,1);
insert into match_wins (match, winner) values (3,2);
insert into match_wins (match, winner) values (4,1);
