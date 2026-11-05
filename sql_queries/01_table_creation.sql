DROP TABLE IF EXISTS bank_churn;

CREATE TABLE bank_churn (
    customer_id INT PRIMARY KEY,
    credit_score INT,
    geography VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance NUMERIC(12, 2),
    num_of_products INT,
    has_credit_card INT,
    is_active INT,
    estimated_salary NUMERIC(12, 2),
    exited INT,
    age_group VARCHAR(20),
    balance_category VARCHAR(30)
);


select *
from bank_churn;