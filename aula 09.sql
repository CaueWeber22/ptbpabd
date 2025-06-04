-- Trigger atividade
CREATE TRIGGER dbo.trigger_prevent_assignment_teaches
ON teaches
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE t
    FROM teaches t
    INNER JOIN Inserted i
        ON t.ID = i.ID
        AND t.course_id = i.course_id
        AND t.sec_id = i.sec_id
        AND t.semester = i.semester
        AND t.year = i.year
    WHERE (
        SELECT COUNT(*)
        FROM teaches t2
        WHERE 
            t2.ID = i.ID
            AND t2.year = i.year
    ) > 2;
END;

-- Inserindo duas aulas (válido)
INSERT INTO teaches (ID, course_id, sec_id, semester, year)
VALUES ('43779', '105', '2', 'Fall', 2002),
       ('43779', '137', '1', 'Spring', 2002);

SELECT * FROM teaches WHERE ID = 43779 AND year = 2002;

-- Tentando inserir uma terceira (não será mantida)
INSERT INTO teaches (ID, course_id, sec_id, semester, year)
VALUES ('43779', '169','2', 'Fall', 2002);

-- Verificar
SELECT * FROM teaches WHERE ID = 43779 AND year = 2002;

