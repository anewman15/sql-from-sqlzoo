-- Exercise #1
SELECT id, title FROM movie
  WHERE yr = 1962

-- Exercise #2
SELECT yr FROM movie
  WHERE title = 'Citizen Kane'

-- Exercise #3
SELECT id, title, yr FROM movie
  WHERE title LIKE '%Star Trek%' ORDER BY yr

-- Exercise #4
SELECT id FROM actor
  WHERE name = 'Glenn Close'

-- Exercise #5
SELECT id FROM movie
  WHERE title = 'Casablanca'

-- Exercise #6
SELECT actor.name FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
    WHERE title = 'Casablanca'

-- Exercise #7
SELECT actor.name FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
    WHERE title = 'Alien'

-- Exercise #8
SELECT title FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'

-- Exercise #9
SELECT title FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND casting.ord > 1

-- Exercise #10
SELECT movie.title, actor.name FROM movie
  JOIN casting ON movie.id = casting.movieid
  JOIN actor ON casting.actorid = actor.id
WHERE yr = 1962 AND casting.ord = 1

-- Exercise #11
SELECT yr, COUNT(title) AS movies FROM
  movie JOIN casting ON movie.id = casting.movieid
        JOIN actor   ON casting.actorid = actor.id
WHERE actor.name='Rock Hudson' GROUP BY yr HAVING movies > 2

-- Exercise #12
SELECT m.title, a.name FROM movie m
  JOIN casting c ON m.id = c.movieid AND c.ord = 1
  JOIN actor a ON a.id = c.actorid
WHERE  m.id IN (SELECT m1.id FROM movie m1
    JOIN casting c1 ON m1.id = c1.movieid
    JOIN actor a1 ON a1.id = c1.actorid
  WHERE  a1.name = 'Julie Andrews')

-- Exercise #13
SELECT actor.name FROM actor
  JOIN casting ON actorid=actor.id
WHERE ord = 1 GROUP BY actor.name HAVING COUNT(ord) >= 15

-- Exercise #14
SELECT movie.title, COUNT(casting.actorid) AS cast FROM movie
  JOIN casting ON movie.id = casting.movieid
WHERE yr = 1978 GROUP BY movie.title ORDER BY cast DESC, title

-- Exercise #15
SELECT actor.name  FROM casting
  JOIN movie ON movie.id=casting.movieid
  JOIN actor ON  actor.id=casting.actorid
WHERE actor.name !='Art Garfunkel' AND movie.id IN(SELECT movie.id FROM casting
    JOIN movie ON movie.id=casting.movieid
    JOIN actor ON  actor.id=casting.actorid
  WHERE actor.name='Art Garfunkel')