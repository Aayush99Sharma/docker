-- Create database
CREATE DATABASE IF NOT EXISTS rdsdb;

-- Create user and set password
CREATE USER 'admin'@'%' IDENTIFIED BY 'root';

-- Grant privileges to the user on the database
GRANT ALL PRIVILEGES ON rdsdb.* TO 'admin'@'%';

-- Flush privileges
FLUSH PRIVILEGES;

