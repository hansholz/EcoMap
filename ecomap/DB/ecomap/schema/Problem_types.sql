DROP TABLE IF EXISTS Problem_types;
CREATE TABLE Problem_types (
    /*
        This table provides description of all problem types
    */
    id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
