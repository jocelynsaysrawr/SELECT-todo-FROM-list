DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app;
\c todo_app;
CREATE TABLE task (
    task_id SERIAL NOT NULL PRIMARY KEY,
    title varchar(255) NOT NULL,
    description text,
    created_at timestamp NOT NULL DEFAULT now(),
    updated_at timestamp,
    completed boolean NOT NULL DEFAULT false
);

ALTER TABLE task 
    DROP COLUMN completed,
    ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE task
    ALTER COLUMN updated_at SET NOT NULL,
    ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO task
VALUES
    (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO task
VALUES
    (DEFAULT, 'Study PostgreSQL', 'Read all the documentation', DEFAULT, DEFAULT, NULL);

SELECT title FROM task WHERE completed_at is NULL;

UPDATE task SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM task WHERE completed_at is NULL;

SELECT * FROM task ORDER BY created_at DESC;