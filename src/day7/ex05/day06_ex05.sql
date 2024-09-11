COMMENT ON TABLE person_discounts IS 'This table stores the discount information for each person at different pizzerias. It aims to facilitate personalized marketing and enhance customer retention by offering discounts based on previous orders.';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for each record.';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key linking to the person table, identifies the customer receiving the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key linking to the pizzeria table, identifies the pizzeria where the discount is applicable.';
COMMENT ON COLUMN person_discounts.discount IS 'The discount percentage that the person gets at the specified pizzeria.';