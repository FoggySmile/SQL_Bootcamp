SELECT name AS person_name
FROM v_persons_female
UNION
SELECT name AS person_name
FROM v_persons_male
ORDER BY person_name;