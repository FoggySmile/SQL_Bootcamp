SELECT person.address,
    pizzeria.name,
    COUNT(*)
FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name,
    person.address
ORDER BY 1,
    2;