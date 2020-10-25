-- Andrew Feikema
-- Date: 10/25
-- CS 262 Lab 08 pt. 1

-- 1.
SELECT *
  FROM Game
  ORDER BY time DESC

  ;

-- 2.
SELECT * 
  FROM Game
  WHERE time > CURRENT_TIMESTAMP - interval '7 weeks'
  ;

-- 3.
SELECT *
  FROM Player
 WHERE name IS NOT NULL;
 ;

-- 4.
  SELECT ID 
  FROM Player, PlayerGame
  WHERE Score > 2000 AND ID = GameID;

-- 5.
SELECT *
  FROM Player
  WHERE emailAddress LIKE '%@gmail.com';

