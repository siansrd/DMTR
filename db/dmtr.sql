DROP TABLE transactions;
DROP TABLE businesses;
DROP TABLE categories;

CREATE TABLE businesses (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE categories (
  id SERIAL8 PRIMARY KEY,
  label VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  day DATE,
  amount DECIMAL(6,2),
  supplier VARCHAR(255),
  business_id int4 references businesses(id) ON DELETE CASCADE,
  category_id int4 references categories(id)
);



