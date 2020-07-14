-- Exercise #1
SELECT name, continent, population FROM world

-- Exercise #2
SELECT name FROM world
  WHERE population >= 200000000

-- Exercise #3
SELECT name, gdp/population AS per_capita_gdp FROM world
  WHERE population >= 200000000

-- Exercise #4
SELECT name, population/1000000 AS population_in_millions FROM world
  WHERE continent = 'South America'

-- Exercise #5
SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

-- Exercise #6
SELECT name FROM world
  WHERE name LIKE '%United%'

-- Exercise #7
SELECT name, population, area FROM world
  WHERE area > 3000000 OR population > 250000000

-- Exercise #8
SELECT name, population, area FROM world
  WHERE area > 3000000 XOR population > 250000000

-- Exercise #9
SELECT name, ROUND(population/1000000, 2) AS pop_in_mill, ROUND(gdp/1000000000, 2) AS gdp_in_bill FROM world
  WHERE continent = 'South America'

-- Exercise #10
SELECT name, ROUND(gdp/population, -3) AS per_capita_gdp FROM world
  WHERE gdp >= 1000000000000

-- Exercise #11
SELECT name, capital FROM world
  WHERE LENGTH(name) = LENGTH(capital)

-- Exercise #12
SELECT name, capital FROM world
  WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital

-- Exercise #13
SELECT name FROM world
  WHERE name LIKE '%a%'
    AND name LIKE '%e%'
    AND name LIKE '%i%'
    AND name LIKE '%o%'
    AND name LIKE '%u%'
    AND name NOT LIKE '% %'
    