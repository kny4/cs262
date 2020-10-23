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

-- Lab08: Exercise 8.1-8.2 written by Kelsey Yen (kny4)
-- 8.1
-- a. Get list of all games in descending order by timestamp.
SELECT *
FROM Game
ORDER BY time DESC
;
-- b. Get list of all games that occured in the past week.
SELECT *
FROM Game
WHERE time BETWEEN '2020-10-16' AND '2020-10-23'
;
-- c. Get list of player non-NULL names.
SELECT *
FROM Player
WHERE name IS NOT NULL
;
-- d. Get IDs of players with game score greater than 2000.
SELECT player.ID
FROM PlayerGame
WHERE score > 2000
;
-- e. Get list of players with GMail accounts.
SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%'
;
-- 8.2
-- a. Get all scores of "The King in descreasing order"
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'The King'
ORDER BY score DESC
;

-- b. Get name of winner of game played on 2006-06-28 13:20:00
SELECT Player.name
FROM Player, PlayerGame, Game
WHERE Player.ID = PlayerGame.playerID
  AND PlayerGame.gameID = Game.ID
  AND time = '2006-06-28 13:20:00'
ORDER BY score DESC
LIMIT 1
;

-- c. So what does that P1.ID < P2. ID clause do in the last example query
--    The AND makes sure the IDs are different, since the table is joining itself.

-- d. The query that joined the Player table to itself seems rather contrived.
-- Can you think of a realistic situation in which you'd want to join a table to itself?
--    This could be useful if an ID can fulfill two roles in a table
--    i.e. an ID that is both a father and a son in a family tree table