-- Exercise #1
SELECT yr, subject, winner FROM nobel
  WHERE yr = 1950

-- Exercise #2
SELECT winner FROM nobel
  WHERE yr = 1962 AND subject = 'Literature'

-- Exercise #3
SELECT yr, subject FROM nobel
  WHERE winner = 'Albert Einstein'

-- Exercise #4
SELECT winner FROM nobel
  WHERE subject = 'Peace' AND yr >= 2000

-- Exercise #5
SELECT * FROM nobel
  WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

-- Exercise #6
SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

-- Exercise #7
SELECT winner FROM nobel
  WHERE winner LIKE 'John%'

-- Exercise #8
SELECT yr, subject, winner FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)

-- Exercise #9
SELECT yr, subject, winner FROM nobel
  WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine')

-- Exercise #10
SELECT yr, subject, winner FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

-- Exercise #11
SELECT * FROM nobel
  WHERE winner LIKE 'PETER GR%NBERG'

-- Exercise #12
SELECT * FROM nobel
  WHERE winner = 'EUGENE O''NEILL'

-- Exercise #13
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner

-- Exercise #14
SELECT winner, subject FROM nobel
 WHERE yr=1984 ORDER BY subject IN ('Physics','Chemistry'), subject, winner
 