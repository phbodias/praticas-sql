-- EXERCÍCIO 1 --
SELECT
    COUNT("endDate")
FROM
    experiences;

--Como foi especificado uma tabela, o método Count ignorará automaticamente as colunas com valores NULL.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXERCÍCIO 2 --
SELECT
    "userId" AS id,
    COUNT("userId") AS educations
FROM
    educations
GROUP BY
    "userId"
ORDER BY
    "userId";

--Como não foi especificado pelo enunciado, considerei para este exercício apenas as graduações já finalizadas.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EXERCÍCIO 3 -- 
SELECT
    users.name AS writer,
    COUNT(testimonials."writerId") AS "testimonailCount"
FROM
    testimonials
    JOIN users ON testimonials."writerId" = users.id
WHERE
    users.id = 435
GROUP BY
    users.name;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EXERCÍCIO 4 -- 
SELECT
    MAX(jobs.salary) AS "maximumSalary",
    roles.name AS role
FROM
    jobs
    JOIN roles ON roles.id = jobs."roleId"
WHERE
    jobs.active
GROUP BY
    roles.name
ORDER BY
    roles.name;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BÔNUS -- 
SELECT
    schools.name AS school,
    courses.name AS course,
    COUNT(e1."schoolId") AS "studentsCount"
FROM
    educations e1
    JOIN courses ON e1."courseId" = courses.id
    JOIN schools ON e1."schoolId" = schools.id
WHERE
    e1.status = 'ongoing'
    OR e1.status = 'finished'
GROUP BY
    courses.id,
    schools.id
ORDER BY
    "studentsCount" DESC
LIMIT
    3;