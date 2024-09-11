CREATE OR REPLACE FUNCTION func_minimum(arr numeric []) RETURNS numeric AS $$
SELECT MIN(val)
FROM UNNEST(arr) AS t(val);
$$ LANGUAGE sql STABLE;
SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);