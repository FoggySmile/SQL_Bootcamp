SELECT visits.name,
    COALESCE(visits.count, 0) + COALESCE(orders.count, 0) AS total_count
FROM (
        SELECT pizzeria.name,
            COUNT(*),
            'order' AS action_type
        FROM person_order
            JOIN menu ON menu.id = person_order.menu_id
            JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
        GROUP BY pizzeria.name
        ORDER BY 2 DESC
    ) AS orders
    FULL JOIN (
        SELECT pizzeria.name,
            COUNT(*),
            'visit' AS action_type
        FROM person_visits
            JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY pizzeria.name
        ORDER BY 2 DESC
    ) AS visits ON visits.name = orders.name;