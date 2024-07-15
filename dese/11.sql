SELECT schools.name, per_pupil_expenditure, graduated FROM schools
JOIN expenditures ON districts.id = expenditures.district_id
JOIN districts ON districts.id = schools.district_id
JOIN graduation_rates ON schools.id = graduation_rates.school_id
ORDER BY per_pupil_expenditure DESC, schools.name ASC;
