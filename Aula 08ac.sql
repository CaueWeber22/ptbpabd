-- Trigger atividade
CREATE TRIGGER dbo.lost_credits
ON dbo.takes
AFTER DELETE AS
IF (ROWCOUNT_BIG() = 0)
RETURN;
BEGIN
	UPDATE dbo.student
    SET tot_cred = tot_cred - (SELECT credits FROM dbo.course INNER JOIN deleted ON course.course_id = deleted.course_id) 
    WHERE student.id = (SELECT DISTINCT ID FROM deleted);	
END

SELECT ID, count(*) AS qtd_courses FROM takes 
GROUP BY ID
ORDER BY qtd_courses;

-- Estudante selecionado
SELECT * FROM takes t WHERE t.ID = '30299' ORDER BY t.course_id;


-- Após a inserção o aluno possuirá 41 créditos
INSERT INTO takes (ID, course_id, sec_id, semester, [year], grade) VALUES ('30299', '105', '1', 'Fall', 2009, 'A+');

SELECT ID, name, dept_name, tot_cred FROM student WHERE ID = '30299';

--Após o delete, voltara a ter 38
DELETE FROM takes WHERE ID = '30299' AND course_id='105';

SELECT ID, name, dept_name, tot_cred FROM student WHERE ID = '30299';