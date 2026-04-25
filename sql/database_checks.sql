-- Database QA Validation Script

-- Verify that the database 'foobar' exists
SHOW DATABASES;

-- Switch to the 'foobar' database
USE foobar;

-- Create a test table to validate database write capability
CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Verify that the table was created
SHOW TABLES;

-- Insert test data into the table
INSERT INTO test_table (name) VALUES ('test_user_1');

-- Verify inserted data
SELECT * FROM test_table;

-- Negative Test: Try selecting from a non-existent table
SELECT * FROM non_existent_table;

-- Clean up (optional)
-- DROP TABLE test_table;