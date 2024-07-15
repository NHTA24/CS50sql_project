SELECT first_name, last_name, salary FROM players
JOIN salaries ON salaries.player_id = players.id
ORDER BY salary ASC, first_name ASC, last_name ASC, player_id ASC
LIMIT 50;
