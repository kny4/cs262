--
-- This SQL script implements sample queries on the Monopoly database.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Get the number of Game records.
SELECT *
FROM Game
;

-- Get the player records.
SELECT * 
FROM Player
;

-- Get all the users with Calvin email addresses.
SELECT *
FROM Player
WHERE emailAddress LIKE '%calvin%'
;

-- Get the highest score ever recorded.
SELECT score
FROM PlayerGame
ORDER BY score DESC
LIMIT 1
;

-- Get the cross-product of all the tables.
SELECT *
FROM Player, PlayerGame, Game
;

-- Get list of all games in descending order by timestamp.
SELECT *
FROM Game
ORDER BY time DESC
;

-- Get list of all games that occured in the past week.
SELECT *
FROM Game
WHERE starTime > '2020-10-16' - interval '7 days'
;

-- Get list of player non-NULL names.
SELECT *
FROM Player
WHERE name IS NOT NULL
;

-- Get IDs of players with game score greater than 2000.
SELECT player.ID
FROM PlayerGame
WHERE score > 2000
;

-- Get list of players with GMail accounts.
SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%'
;

-- Get all scores of "The King" in descreasing order
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'The King'
ORDER BY score DESC
;

-- Get name of winner of game played on 2006-06-28 13:20:00
SELECT Player.name
FROM Player, PlayerGame, Game
WHERE Player.ID = PlayerGame.playerID
  AND PlayerGame.gameID = Game.ID
  AND time = '2006-06-28 13:20:00'
ORDER BY score DESC
LIMIT 1
;
