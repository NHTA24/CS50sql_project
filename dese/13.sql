SELECT name, graduated FROM schools
JOIN graduation_rates ON graduation_rates.school_id = schools.id
WHERE graduated > (
    SELECT AVG("graduated") FROM graduation_rates
);
