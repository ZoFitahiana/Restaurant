-- Table for ingredient
CREATE TABLE ingredient (
                            id BIGSERIAL PRIMARY KEY,
                            name VARCHAR(255) NOT NULL
);

-- Insert example ingredients
INSERT INTO ingredient (name) VALUES
                                  ('Sugar'),
                                  ('Salt'),
                                  ('Pepper'),
                                  ('Olive Oil'),
                                  ('Garlic');

-- Table for price
CREATE TABLE price (
                       id BIGSERIAL PRIMARY KEY,
                       ingredient_id BIGINT REFERENCES ingredient(id) ON DELETE CASCADE,
                       amount NUMERIC(10, 2) NOT NULL,
                       date_value DATE NOT NULL
);

-- Insert example prices
INSERT INTO price (ingredient_id, amount, date_value) VALUES
                                                          (1, 2.50, '2025-04-01'), -- Sugar
                                                          (2, 1.20, '2025-04-01'), -- Salt
                                                          (3, 3.00, '2025-04-01'), -- Pepper
                                                          (4, 15.00, '2025-04-01'), -- Olive Oil
                                                          (5, 1.50, '2025-04-01'); -- Garlic

-- Table for stock movement
CREATE TABLE stock_movement (
                                id BIGSERIAL PRIMARY KEY,
                                ingredient_id BIGINT REFERENCES ingredient(id) ON DELETE CASCADE,
                                quantity NUMERIC(10, 2) NOT NULL,
                                unit VARCHAR(10) NOT NULL CHECK (unit IN ('G', 'U', 'L')),
                                movement_type VARCHAR(10) NOT NULL CHECK (movement_type IN ('IN', 'OUT')),
                                creation_datetime TIMESTAMP NOT NULL
);

-- Insert example stock movements
INSERT INTO stock_movement (ingredient_id, quantity, unit, movement_type, creation_datetime) VALUES
                                                                                                 (1, 1000, 'G', 'IN', '2025-04-01 10:00:00'), -- Sugar, stock entry
                                                                                                 (2, 500, 'G', 'IN', '2025-04-01 10:05:00'),  -- Salt, stock entry
                                                                                                 (3, 200, 'G', 'OUT', '2025-04-01 10:10:00'), -- Pepper, stock removal
                                                                                                 (4, 50, 'L', 'IN', '2025-04-01 10:15:00'),   -- Olive Oil, stock entry
                                                                                                 (5, 300, 'G', 'OUT', '2025-04-01 10:20:00');  -- Garlic, stock removal
