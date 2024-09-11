WITH count_orders AS (
    SELECT person_id,
        menu.pizzeria_id,
        COUNT (*) AS count_order
    FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
    GROUP BY person_id,
        pizzeria_id
)
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER (
        ORDER BY person_id,
            pizzeria_id
    ) AS id,
    person_id,
    pizzeria_id,
    CASE
        WHEN count_order = 1 THEN 10.5
        WHEN count_order = 2 THEN 22
        ELSE 30
    END AS discount
FROM count_orders;
-- 
-- SELECT * FROM person_discounts;