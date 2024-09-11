SELECT COALESCE(person.name, '-') AS person_name,
    vd.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
        SELECT *
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) AS vd
    FULL JOIN person ON vd.person_id = person.id
    FULL JOIN pizzeria ON vd.pizzeria_id = pizzeria.id
ORDER BY person_name,
    visit_date,
    pizzeria_name;