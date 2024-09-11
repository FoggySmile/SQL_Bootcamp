WITH DateSeries AS (
    SELECT data::date
    FROM generate_series(
            '2022-01-01'::date,
            '2022-01-10'::date,
            '1 day'::interval
        ) AS data
),
FilteredVisits AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1
        OR person_id = 2
)
SELECT ds.data AS missing_data
FROM DateSeries ds
    LEFT JOIN FilteredVisits fv ON ds.data = fv.visit_date
WHERE fv.visit_date IS NULL
ORDER BY missing_data;