-- Q1
SELECT u.id AS "userId", u.name AS "userName", c.name AS "cityName" 
FROM users u 
JOIN cities c 
ON u."cityId" = c.id
WHERE c.name = 'Rio de Janeiro'
;

-- Q2
SELECT t.id, u1.name AS writer, u2.name AS recipient, t.message
FROM testimonials t
JOIN users u1
ON t."writerId" = u1.id
JOIN users u2
ON t."recipientId" = u2.id
;

-- Q3
SELECT 
	e."userId" AS id, 
	u.name, 
	c.name AS course, 
	s.name AS school, 
	e."endDate"
FROM educations e
JOIN users u
ON e."userId" = u.id
JOIN courses c
ON e."courseId" = c.id
JOIN schools s
ON e."schoolId" = s.id
WHERE e."userId" = 30
;

-- Q4
SELECT 
	e."userId" AS id, 
	u.name,
	r.name AS role,
	c.name AS company, 
	e."startDate"
FROM experiences e
JOIN users u
ON e."userId" = u.id
JOIN roles r
ON e."roleId" = r.id
JOIN companies c
ON e."companyId" = c.id
WHERE e."endDate" IS NULL AND u.id = 50
;

-- Bonus
SELECT 
	e."schoolId" AS id,
	s.name AS school,
	c2.name AS course,
	c.name AS company,
	r.name AS role
FROM applicants a
JOIN educations e
ON a."userId" = e."userId"
JOIN schools s
ON e."schoolId" = s.id
JOIN courses c2
ON e."courseId" = c2.id
JOIN jobs j
ON a."jobId" = j.id
JOIN companies c
ON j."companyId" = c.id
JOIN roles r
ON j."roleId" = r.id
WHERE 
	r.name = 'Software Engineer' AND
	c.id = 10 AND
	j.active = 'true'
;
