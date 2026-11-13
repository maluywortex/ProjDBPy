CREATE USER 'braintraining_app'@'localhost'
IDENTIFIED BY 'root';

GRANT SELECT, INSERT ON mydb.* 
TO 'braintraining_app'@'localhost';