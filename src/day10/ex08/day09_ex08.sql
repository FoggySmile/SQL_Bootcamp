CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) RETURNS TABLE(fib_number bigint) AS $$
DECLARE a bigint := 0;
b bigint := 1;
c bigint;
BEGIN IF pstop > 0 THEN fib_number := a;
RETURN NEXT;
END IF;
WHILE b < pstop LOOP fib_number := b;
RETURN NEXT;
c := a + b;
a := b;
b := c;
END LOOP;
END;
$$ LANGUAGE plpgsql;
SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();