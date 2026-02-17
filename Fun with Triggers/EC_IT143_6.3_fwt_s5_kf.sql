-- Q2: How to keep track of when a record was last modified?
-- A2: Maybe use an after update trigger?

-- Q3: Did it work?
-- A3: Well, lets see...yup


DELETE FROM dbo.t_hello_world
WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');


INSERT INTO dbo.t_hello_world(my_message)
VALUES('Hello World2'), ('Hello World3');


SELECT t.*
FROM dbo.t_hello_world AS t;


UPDATE dbo.t_hello_world SET my_message = 'Hello World4'
WHERE my_message = 'Hello World3';

SELECT t.*
FROM dbo.t_hello_world AS t;