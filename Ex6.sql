-- Questão 1

CREATE TABLE pessoa (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    idade INT CHECK (idade >= 0)
);

-- Questão 2
ALTER TABLE pessoa
ADD CONSTRAINT unique_id_nome_sobrenome UNIQUE (id, nome, sobrenome);

-- Questão 3
ALTER TABLE pessoa
ALTER COLUMN idade INT NOT NULL;

-- Questão 4
CREATE TABLE endereco (
    id INT PRIMARY KEY,
    rua VARCHAR(100)
);

ALTER TABLE pessoa
ADD endereco_id INT;

ALTER TABLE pessoa
ADD CONSTRAINT fk_endereco
FOREIGN KEY (endereco_id) REFERENCES endereco(id);