-- Exercise #1
SELECT SUM(population) AS world_population
FROM world

-- Exercise #2
SELECT DISTINCT continent FROM world

-- Exercise #3
SELECT SUM(GDP) AS gdp_africa FROM world
  WHERE continent = 'Africa'

-- Exercise #4
SELECT COUNT(*) AS area_100k FROM world
  WHERE area >= 1000000

-- Exercise #5
SELECT SUM(population) AS baltic_pop FROM world
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- Exercise #6
SELECT continent, COUNT(*) AS country_count FROM world
  GROUP BY continent

-- Exercise #7
SELECT continent, COUNT(*) AS country_count FROM world
  WHERE population >= 10000000 GROUP BY continent

-- Exercise #8
SELECT continent FROM world
  GROUP BY continent HAVING SUM(population) >= 100000000
