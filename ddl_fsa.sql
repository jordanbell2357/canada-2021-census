CREATE TABLE fsa (
    geo_name CHAR(3),
    characteristic_id INTEGER,
    characteristic_name TEXT,
    c1_count_total FLOAT,
    c2_count_men FLOAT,
    c3_count_women FLOAT,
    PRIMARY KEY (geo_name, characteristic_id)
);