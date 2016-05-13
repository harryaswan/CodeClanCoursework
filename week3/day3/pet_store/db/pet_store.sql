CREATE TABLE stores (
    id SERIAL4 primary key,
    name VARCHAR(255),
    address VARCHAR(255),
    stock_type VARCHAR(255)
);

CREATE TABLE pets (
    id SERIAL4 primary key,
    store_id INT4 references stores(id),
    name VARCHAR(255),
    p_type VARCHAR(255),
    image VARCHAR(255)
);
