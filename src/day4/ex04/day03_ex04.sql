WITH GenderOrders AS (
    SELECT pizzeria.name AS pizzeria_name,
        person.gender
    FROM person_order po
        JOIN person ON po.person_id = person.id
        JOIN menu ON po.menu_id = menu.id
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
),
male_visits AS (
    SELECT pizzeria_name
    FROM GenderOrders
    WHERE GenderOrders.gender = 'male'
),
female_visits AS (
    SELECT pizzeria_name
    FROM GenderOrders
    WHERE GenderOrders.gender = 'female'
) (
    SELECT pizzeria_name
    FROM female_visits
    EXCEPT
    SELECT pizzeria_name
    FROM male_visits
)
UNION
(
    SELECT pizzeria_name
    FROM male_visits
    EXCEPT
    SELECT pizzeria_name
    FROM female_visits
)
ORDER BY pizzeria_name;