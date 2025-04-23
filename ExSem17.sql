-- Questão 1
CREATE SCHEMA avaliacaocontinua;

-- Questão 2
CREATE TABLE avaliacaocontinua.company (
    company_name VARCHAR(100) NOT NULL PRIMARY KEY,
    city VARCHAR(100)
);


-- Questão 3
CREATE TABLE avaliacaocontinua.employee (
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(100)
);


-- Questão 4
CREATE TABLE avaliacaocontinua.manages (
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    manager_name VARCHAR(100)
);


-- Questão 5, 6 e 7
CREATE TABLE avaliacaocontinua.works (
    person_name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    PRIMARY KEY (person_name),
    CONSTRAINT FK_works_employee FOREIGN KEY (person_name)
        REFERENCES avaliacaocontinua.employee(person_name)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT FK_works_company FOREIGN KEY (company_name)
        REFERENCES avaliacaocontinua.company(company_name)
        ON UPDATE CASCADE ON DELETE CASCADE
);--


-- Questão 8
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT FK_manages_employee FOREIGN KEY (person_name)
    REFERENCES avaliacaocontinua.employee(person_name)
    ON UPDATE CASCADE ON DELETE CASCADE;
