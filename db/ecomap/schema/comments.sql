CREATE TABLE ecomap.comments
(id INT NOT NULl AUTO_INCREMENT,
content VARCHAR(255) NOT NULL,
problem_id BIGINT NOT NULL,         -- problem, comment belongs to
user_id BIGINT NOT NULL,            -- user, comment belongs to
created_date DATE NOT NULL,         -- date of create
modified_date DATE NULL,            -- date, when comment was modified
modified_user_id BIGINT NULL,       -- user, who modified comment
PRIMARY KEY(id),
FOREIGN KEY(problem_id) REFERENCES problem(problem_id),
FOREIGN KEY(user_id) REFERENCES user(user_id));
