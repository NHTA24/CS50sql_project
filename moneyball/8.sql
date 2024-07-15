SELECT salary FROM salaries
JOIN performances ON performances.player_id = salaries.player_id
WHERE salaries.year = 2001
ORDER BY performances.HR DESC
LIMIT 1;