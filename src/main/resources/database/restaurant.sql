-- Table for ingredient
CREATE TABLE ingredient (
                            id BIGSERIAL PRIMARY KEY,
                            name VARCHAR(255) NOT NULL
);

-- Table for price
CREATE TABLE price (
                       id BIGSERIAL PRIMARY KEY,
                       ingredient_id BIGINT REFERENCES ingredient(id) ON DELETE CASCADE,
                       amount NUMERIC(10, 2) NOT NULL,
                       date_value DATE NOT NULL
);

-- Table for stock movement
CREATE TABLE stock_movement (
                                id BIGSERIAL PRIMARY KEY,
                                ingredient_id BIGINT REFERENCES ingredient(id) ON DELETE CASCADE,
                                quantity NUMERIC(10, 2) NOT NULL,
                                unit VARCHAR(10) NOT NULL CHECK (unit IN ('G', 'U', 'L')),
                                movement_type VARCHAR(10) NOT NULL CHECK (movement_type IN ('IN', 'OUT')),
                                creation_datetime TIMESTAMP NOT NULL
);
