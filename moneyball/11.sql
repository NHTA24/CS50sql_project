SELECT first_name, last_name, (salary/H) AS 'dollars per hit' FROM players
JOIN performances ON performances.player_id = players.id AND performances.year = salaries.year
JOIN salaries ON salaries.player_id = players.id
WHERE performances.H > 0
   AND performances.year = 2001
ORDER BY (salary/H) ASC, first_name ASC, last_name ASC
LIMIT 10;
