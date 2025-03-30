/*Exercício 1*/
SELECT * FROM student AS s LEFT JOIN takes as t ON s.ID = t.ID;


/*Exercício 2*/


SELECT s.ID, s.name, COUNT(t.course_id) as quantidade_cursos
FROM student as s
LEFT JOIN takes AS t ON s.ID = t.ID
LEFT JOIN department AS d ON  s.dept_name = d.dept_name
WHERE d.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name
ORDER BY quantidade_cursos DESC;


/*Exercício 3 */

CREATE VIEW civil_eng_students AS 
SELECT s.ID, s.name, COUNT(t.course_id) as quantidade_cursos
FROM student as s
LEFT JOIN takes AS t ON s.ID = t.ID
LEFT JOIN department AS d ON  s.dept_name = d.dept_name
WHERE d.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name;

SELECT * FROM civil_eng_students ORDER BY quantidade_cursos DESC;