SELECT v.generated_date AS missing_date
FROM v_generated_dates v
    LEFT JOIN person_visits vs ON v.generated_date = vs.visit_date
WHERE vs.visit_date IS NULL
ORDER BY v.generated_date;