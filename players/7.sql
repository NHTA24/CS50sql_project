SELECT COUNT("last_name") FROM players
WHERE (bats = "R" AND throws = "L") OR (bats = "L" AND throws = "R");
