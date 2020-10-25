-- Andrew Feikema
-- Date: 10/25
-- CS 262 Lab 08 pt. 2

-- 1.
SELECT *
  FROM Player, PlayerGame
  WHERE name = 'The King'
  AND playerid = 2
  ORDER BY score DESC
  ;

-- 2.
SELECT playerid, gameid, score, position
  FROM Game, PlayerGame
  WHERE time = '2006-06-28 13:20:00'
  AND gameID = id
  ORDER BY score DESC
  LIMIT 1;

-- 3. 
-- The clause makes the query response exclude the player of the highest id

-- 4.
-- Generally, one can analyze all relationship between each two items by joining a table to itself.
-- In a table of rankings for teams in a sports league, we could use this approach to find the greatest
-- difference between any two teams for a certain statistic such as points scored.
