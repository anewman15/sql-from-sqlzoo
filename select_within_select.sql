-- Exercise #1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- Exercise #2
SELECT name FROM world
  WHERE continent = 'Europe' AND gdp/population >
    (SELECT gdp/population FROM world
      WHERE name = 'United Kingdom')

-- Exercise #3
SELECT name, continent FROM world
  WHERE continent IN
    (SELECT continent FROM world
      WHERE name IN ('Argentina', 'Australia')) ORDER BY name

-- Exercise #4
SELECT name, population FROM world
  WHERE population >
    (SELECT population FROM world
      WHERE name = 'Canada') AND population <
    (SELECT population FROM world
      WHERE name = 'Poland')

-- Exercise #5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world
    WHERE name = 'Germany')*100), '%') AS percentage FROM world
  WHERE continent = 'Europe'

-- Exercise #6
SELECT name FROM world
  WHERE gdp > ALL (SELECT gdp FROM world
    WHERE continent = 'Europe' AND gdp > 0)

-- Exercise #7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- Exercise #8
SELECT continent, name FROM world x
  WHERE name = (SELECT name FROM world y
    WHERE y.continent = x.continent ORDER BY name LIMIT 1)