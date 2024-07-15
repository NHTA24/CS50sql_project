SELECT year, HR FROM performances
JOIN players ON players.id = performances.player_id
WHERE last_name = "Griffey" AND birth_year = 1969
ORDER BY year DESC;
