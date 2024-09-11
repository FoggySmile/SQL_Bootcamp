SELECT data::date AS missing_data
FROM generate_series(
        '2022-01-01'::date,
        '2022-01-10'::date,
        '1 day'::interval
    ) AS data
    LEFT JOIN (
        SELECT visit_date
        FROM person_visits
        WHERE person_id = 1
            OR person_id = 2
    ) AS visits ON data = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_data;