SELECT DISTINCT pz.name AS pizzeria_name
FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN person p ON pv.person_id = p.id
    JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
    LEFT JOIN person_order po ON pv.person_id = po.person_id
    AND menu.id = po.menu_id
WHERE p.name = 'Andrey'
    AND po.person_id IS NULL
ORDER BY pizzeria_name;