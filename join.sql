--Exercise #1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

--Exercise #2
SELECT id, stadium, team1, team2 FROM game
  WHERE id = 1012

-- Exercise #3
SELECT player, teamid, stadium, mdate FROM game
  JOIN goal ON (id=matchid)
    WHERE teamid = 'GER'

-- Exercise #4
SELECT team1, team2, player FROM game
  JOIN goal ON game.id = goal.matchid
    WHERE goal.player LIKE 'Mario%'

-- Exercise #5
SELECT player, teamid, coach, gtime FROM goal
  JOIN eteam ON goal.teamid = eteam.id
    WHERE gtime <= 10

-- Exercise #6
SELECT mdate, teamname FROM game
  JOIN eteam ON game.team1 = eteam.id
    WHERE eteam.coach = 'Fernando Santos'

-- Exercise #7
SELECT player FROM game
  JOIN goal ON game.id = goal.matchid
    WHERE stadium = 'National Stadium, Warsaw'

-- Exercise #8
SELECT DISTINCT player FROM game
  JOIN goal ON matchid = id 
    WHERE (game.team1='GER' OR game.team2='GER') AND goal.teamid != 'GER'

-- Exercise #9
SELECT teamname, COUNT(*) AS total_goals FROM eteam
  JOIN goal ON eteam.id = goal.teamid GROUP BY teamname ORDER BY teamname

-- Exercise #10
SELECT stadium, COUNT(*) AS total_goals FROM game
  JOIN goal ON game.id = goal.matchid
    GROUP BY stadium ORDER BY stadium

-- Exercise #11
SELECT matchid, mdate, COUNT(*) AS goals FROM game
  JOIN goal ON game.id = goal.matchid 
    WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate

-- Exercise #12
SELECT matchid, mdate, COUNT(*) AS goals FROM game
  JOIN goal ON game.id = goal.matchid
    WHERE goal.teamid = 'GER' GROUP BY goal.matchid, game.mdate

-- Exercise #13
SELECT game.mdate, game.team1, 
  SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1, game.team2,
  SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
  GROUP BY game.id, game.mdate, game.team1, game.team2 
  ORDER BY mdate, matchid, team1, team2
