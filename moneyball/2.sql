SELECT year, salary FROM salaries
JOIN players ON players.id = salaries.player_id
WHERE first_name = "Cal" AND last_name LIKE "%Ripken%"
ORDER BY year DESC;
