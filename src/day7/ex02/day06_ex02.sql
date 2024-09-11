SELECT person.name,
    menu.pizza_name,
    menu.price,
    (
        menu.price - menu.price * (person_discounts.discount * 0.01)
    ) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_discounts ON po.person_id = person_discounts.person_id
    AND menu.pizzeria_id = person_discounts.pizzeria_id
ORDER BY name,
    pizza_name;