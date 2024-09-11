WITH GenderVisits AS (
    SELECT pizzeria.name AS pizzeria_name,
        person.gender
    FROM person_visits v
        JOIN person ON v.person_id = person.id
        JOIN pizzeria ON v.pizzeria_id = pizzeria.id
),
male_visits AS (
    SELECT pizzeria_name
    FROM GenderVisits
    WHERE GenderVisits.gender = 'male'
),
female_visits AS (
    SELECT pizzeria_name
    FROM GenderVisits
    WHERE GenderVisits.gender = 'female'
) (
    SELECT pizzeria_name
    FROM female_visits
    EXCEPT ALL
    SELECT pizzeria_name
    FROM male_visits
)
UNION ALL
(
    SELECT pizzeria_name
    FROM male_visits
    EXCEPT ALL
    SELECT pizzeria_name
    FROM female_visits
)
ORDER BY pizzeria_name;