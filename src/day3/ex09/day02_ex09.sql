SELECT DISTINCT person.name AS person_name
FROM person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
    AND menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
GROUP BY person.id,
    person.name
HAVING COUNT(DISTINCT menu.pizza_name) = 2
ORDER BY person.name;