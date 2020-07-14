-- Exercise #1
SELECT id FROM stops WHERE name = 'Craiglockhart'

-- Exercise #2
SELECT id FROM stops WHERE name = 'Craiglockhart'

-- Exercise #3
SELECT stops.id, stops.name FROM stops
  JOIN route ON stops.id = route.stop
WHERE num = 4 AND company = 'LRT' ORDER BY route.pos

-- Exercise #4
SELECT company, num, COUNT(*) AS links
FROM route WHERE stop = 149 OR stop = 53 GROUP BY company, num HAVING links = 2

-- Exercise #5
SELECT a.company, a.num, a.stop, b.stop FROM route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 AND b.stop = (SELECT stops.id FROM stops WHERE stops.name = 'London Road')

-- Exercise #6
SELECT a.company, a.num, stopa.name, stopb.name FROM route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road'

-- Exercise #7
SELECT DISTINCT a.company, a.num FROM route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.id = 115 AND stopb.id = 137

-- Exercise #8
SELECT DISTINCT a.company, a.num FROM route a
  JOIN route b ON (a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross'

-- Exercise #9
SELECT b.name,r2.company,r2.num FROM route r1
  JOIN route r2 ON (r1.num = r2.num AND r1.company = r2.company)
  JOIN stops a ON (a.id = r1.stop AND a.name = 'Craiglockhart' AND r1.company = 'LRT')
  JOIN stops b ON(b.id = r2.stop)