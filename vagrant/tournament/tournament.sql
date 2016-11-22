-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


DROP TABLE IF EXISTS matches CASCADE;
DROP TABLE IF EXISTS match_wins CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP DATABASE IF EXISTS tournament;

CREATE DATABASE tournament;
USE DATABASE tournament;
CREATE TABLE players (
  id  SERIAL PRIMARY KEY,
  name  varchar(50)
);
CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  player1 integer REFERENCES players ON DELETE CASCADE ON UPDATE CASCADE,
  player2 integer REFERENCES players ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE match_wins (
  id SERIAL PRIMARY KEY,
  match integer REFERENCES matches ON DELETE CASCADE ON UPDATE CASCADE,
  winner integer REFERENCES players ON DELETE CASCADE ON UPDATE CASCADE
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
