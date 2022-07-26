
-- EXERCICIO 1 --

SELECT users.id, users.name, cities.name AS city
FROM users
JOIN cities
ON users."cityId" = cities.id
where cities.name = 'Rio de Janeiro'

--------------------------------------------------------

-- EXERCICIO 2 --

SELECT testimonials.id, tabela1.name AS writer, tabela2.name as recipient, testimonials.message
FROM testimonials
JOIN users tabela1
ON testimonials."writerId" = tabela1.id
JOIN users tabela2
ON testimonials."recipientId" = tabela2.id

-----------------------------------------------------------------------

-- EXERCICIO 3 --

SELECT users.id, users.name, courses.name, schools.name, t1."endDate"
FROM users
JOIN educations t1
ON t1."userId" = users.id
AND t1.status = 'finished'
JOIN courses
ON t1."courseId" = courses.id
JOIN schools
ON t1."schoolId" = schools.id
WHERE users.id = '30';

----------------------------------------------------------------------

-- EXERCÍCIO 4 --

SELECT users.id, users.name, roles.name, companies.name, t1."startDate"
FROM users
JOIN experiences t1
ON users.id = t1."userId"
AND t1."endDate" IS NULL
JOIN roles
ON t1."roleId" = roles.id
JOIN companies
ON t1."companyId" = companies.id
WHERE users.id = '50';
