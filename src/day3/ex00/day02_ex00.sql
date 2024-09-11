SELECT pizzeria_name,
    rating
FROM (
        SELECT pizzeria.name AS pizzeria_name,
            pizzeria.rating,
            person_visits.person_id
        FROM pizzeria
            LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    )
WHERE person_id IS NULL;