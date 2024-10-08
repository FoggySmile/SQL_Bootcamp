CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS TABLE(
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
    ) AS $$
SELECT id,
    name,
    age,
    gender,
    address
FROM person
WHERE gender = 'female';
$$ LANGUAGE sql STABLE;
SELECT *
FROM fnc_persons_female();
CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS TABLE(
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
    ) AS $$
SELECT id,
    name,
    age,
    gender,
    address
FROM person
WHERE gender = 'male';
$$ LANGUAGE sql STABLE;
SELECT *
FROM fnc_persons_male();