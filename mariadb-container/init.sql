CREATE DATABASE site1;
CREATE USER 'site1'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON site1.* TO 'site1'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE site2;
CREATE USER 'site2'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON site2.* TO 'site2'@'%';
FLUSH PRIVILEGES;