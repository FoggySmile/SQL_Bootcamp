CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits pv
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    JOIN person ON pv.person_id = person.id
    JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
WHERE person.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND menu.price < 800;