SELECT person_order.order_date,
    CONCAT(person_copy.name, ' (age:', person_copy.age, ')') AS person_information
FROM person_order
    NATURAL JOIN (
        SELECT id AS person_id,
            name,
            age
        FROM person
    ) AS person_copy
ORDER BY person_order.order_date,
    person_information;