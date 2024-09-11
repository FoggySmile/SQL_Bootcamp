(
    SELECT pizzeria.name,
        COUNT(*),
        'order' AS action_type
    FROM person_order
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    GROUP BY pizzeria.name
    ORDER BY 2 DESC
    LIMIT 3
)
UNION
(
    SELECT pizzeria.name,
        COUNT(*),
        'visit' AS action_type
    FROM person_visits
        JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    GROUP BY pizzeria.name
    ORDER BY 2 DESC
    LIMIT 3
)
ORDER BY action_type,
    count DESC;