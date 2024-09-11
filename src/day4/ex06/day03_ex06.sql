SELECT DISTINCT menu1.pizza_name AS pizza_name,
    pizzeria1.name AS pizzeria_name_1,
    pizzeria2.name AS pizzeria_name_2,
    menu1.price AS price
FROM menu menu1
    JOIN menu menu2 ON menu1.pizza_name = menu2.pizza_name
    AND menu1.price = menu2.price
    AND menu1.pizzeria_id != menu2.pizzeria_id
    JOIN pizzeria pizzeria1 ON menu1.pizzeria_id = pizzeria1.id
    JOIN pizzeria pizzeria2 ON menu2.pizzeria_id = pizzeria2.id
WHERE menu1.pizzeria_id > menu2.pizzeria_id
ORDER BY pizza_name;