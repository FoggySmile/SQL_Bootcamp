WITH new_values AS (
    SELECT generate_series(
            (
                SELECT MAX(id)
                FROM person_order
            ) + 1,
            (
                SELECT MAX(id)
                FROM person_order
            ) + (
                SELECT COUNT(*)
                FROM person
            ),
            1
        ) AS id,
        generate_series(
            (
                SELECT MIN(id)
                FROM person
            ),
            (
                SELECT MAX(id)
                FROM person
            ),
            1
        ) AS person_id,
        (
            SELECT id
            FROM menu
            WHERE pizza_name = 'greek pizza'
        ) AS menu_id,
        '2022-02-25'::date AS order_date
)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT *
FROM new_values;