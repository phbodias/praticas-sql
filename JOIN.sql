
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
JOIN courses
ON t1."courseId" = courses.id
JOIN schools
ON t1."schoolId" = schools.id
WHERE users.id = '30';

----------------------------------------------------------------------

