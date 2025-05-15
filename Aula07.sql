-- Questão 1
CREATE PROCEDURE student_grade_points
    @grade_param VARCHAR(2)
AS
BEGIN
    SELECT 
        s.name AS [Nome do estudante],
        s.dept_name AS [Departamento do estudante],
        c.title AS [Título do curso],
        c.dept_name AS [Departamento do curso],
        sec.semester AS [Semestre do curso],
        sec.year AS [Ano do curso],
        t.grade AS [Pontuação alfanumérica],
        CASE t.grade
            WHEN 'A+' THEN 4.3
            WHEN 'A'  THEN 4.0
            WHEN 'A-' THEN 3.7
            WHEN 'B+' THEN 3.3
            WHEN 'B'  THEN 3.0
            WHEN 'B-' THEN 2.7
            WHEN 'C+' THEN 2.3
            WHEN 'C'  THEN 2.0
            WHEN 'C-' THEN 1.7
            WHEN 'D'  THEN 1.0
            WHEN 'F'  THEN 0.0
            ELSE NULL
        END AS [Pontuação numérica]
    FROM takes t
    INNER JOIN student s ON t.ID = s.ID
    INNER JOIN section sec ON t.course_id = sec.course_id AND t.sec_id = sec.sec_id AND t.semester = sec.semester AND t.year = sec.year
    INNER JOIN course c ON t.course_id = c.course_id
    WHERE t.grade = @grade_param;
END;

EXEC student_grade_points @grade_param = 'A+';

-- Questão 2
CREATE FUNCTION dbo.return_instructor_location (@instructor_name VARCHAR(50))
RETURNS TABLE
AS
RETURN
    SELECT 
        i.name AS [Nome do instrutor],
        c.title AS [Curso ministrado],
        s.semester AS [Semestre do curso],
        s.year AS [Ano do curso],
        s.building AS [Prédio],
        s.room_number AS [Número da sala]
    FROM instructor i
    INNER JOIN teaches t ON i.ID = t.ID
    INNER JOIN section s ON t.course_id = s.course_id AND t.sec_id = s.sec_id AND t.semester = s.semester AND t.year = s.year
    INNER JOIN course c ON s.course_id = c.course_id
    WHERE i.name = @instructor_name;

SELECT * FROM dbo.return_instructor_location('Gustafsson');