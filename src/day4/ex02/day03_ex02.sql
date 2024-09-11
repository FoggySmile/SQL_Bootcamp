WITH not_ordered AS (
    SELECT *
    FROM menu
    WHERE NOT EXISTS (
            SELECT menu_id
            FROM person_order
            WHERE menu_id = menu.id
        )
)
SELECT not_ordered.pizza_name,
    not_ordered.price,
    pizzeria.name AS pizzeria_name
FROM not_ordered
    JOIN pizzeria ON not_ordered.pizzeria_id = pizzeria.id
ORDER BY pizza_name,
    price