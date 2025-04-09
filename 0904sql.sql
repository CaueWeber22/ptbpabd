/*Exercício 1*/
SELECT 
i.ID, 
i.name,
COUNT(t.course_id) as 'Number of sections'
FROM instructor i 
LEFT OUTER JOIN 
	teaches t ON i.ID = t.ID
GROUP BY i.ID, i.name

/*Exercício 2*/
SELECT 
i.ID, 
i.name,
(	
	SELECT COUNT(*) 
	FROM teaches as t 
	WHERE t.id = i.id
)
as 'Number of sections'
FROM instructor i 
GROUP BY i.ID, i.name

/*Exercício 3*/
SELECT 
s.course_id,
s.sec_id,
i.ID,
s.semester,
s.year,
COALESCE(i.name, '-')
FROM section s
LEFT JOIN teaches t ON s.course_id = t.course_id 
AND s.sec_id = t.sec_id 
AND s.semester = t.semester 
AND s.year = t.year
LEFT JOIN instructor i ON t.ID = i.ID
WHERE s.semester = 'Spring' AND s.year = 2010
ORDER BY s.course_id, s.sec_id;

/*Exercicio 4*/
SELECT
    s.ID,
    s.name,
    c.title,
    c.dept_name,
    t.grade,
    CASE
        WHEN t.grade = 'A+' THEN 4
        WHEN t.grade = 'A'  THEN 3.7
        WHEN t.grade = 'A-' THEN 3.3
        WHEN t.grade = 'B+' THEN 3
        WHEN t.grade = 'B'  THEN 2.7
        WHEN t.grade = 'B-' THEN 2.3
        WHEN t.grade = 'C+' THEN 2
        WHEN t.grade = 'C'  THEN 1.7
        WHEN t.grade = 'C-' THEN 1.3
        ELSE NULL
    END AS points,
    c.credits,
    CASE
        WHEN t.grade = 'A+' THEN 4
        WHEN t.grade = 'A'  THEN 3.7
        WHEN t.grade = 'A-' THEN 3.3
        WHEN t.grade = 'B+' THEN 3
        WHEN t.grade = 'B'  THEN 2.7
        WHEN t.grade = 'B-' THEN 2.3
        WHEN t.grade = 'C+' THEN 2
        WHEN t.grade = 'C'  THEN 1.7
        WHEN t.grade = 'C-' THEN 1.3
        ELSE NULL
    END * c.credits AS "Pontos Totais"
FROM takes t
LEFT JOIN course c ON t.course_id = c.course_id
LEFT JOIN student s ON t.ID = s.ID;



/*Exercicio 5*/
CREATE VIEW coeficiente_rendimento AS
SELECT
    s.ID,
    s.name,
    c.title,
    c.dept_name,
    t.grade,
    CASE
        WHEN t.grade = 'A+' THEN 4
        WHEN t.grade = 'A'  THEN 3.7
        WHEN t.grade = 'A-' THEN 3.3
        WHEN t.grade = 'B+' THEN 3
        WHEN t.grade = 'B'  THEN 2.7
        WHEN t.grade = 'B-' THEN 2.3
        WHEN t.grade = 'C+' THEN 2
        WHEN t.grade = 'C'  THEN 1.7
        WHEN t.grade = 'C-' THEN 1.3
        ELSE NULL
    END AS points,
    c.credits,
    CASE
        WHEN t.grade = 'A+' THEN 4
        WHEN t.grade = 'A'  THEN 3.7
        WHEN t.grade = 'A-' THEN 3.3
        WHEN t.grade = 'B+' THEN 3
        WHEN t.grade = 'B'  THEN 2.7
        WHEN t.grade = 'B-' THEN 2.3
        WHEN t.grade = 'C+' THEN 2
        WHEN t.grade = 'C'  THEN 1.7
        WHEN t.grade = 'C-' THEN 1.3
        ELSE NULL
    END * c.credits AS "Pontos Totais"
FROM takes t
LEFT JOIN course c ON t.course_id = c.course_id
LEFT JOIN student s ON t.ID = s.ID;

SELECT * FROM coeficiente_rendimento;
