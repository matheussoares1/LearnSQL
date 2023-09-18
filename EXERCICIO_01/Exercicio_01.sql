
/*Questão 01*/
CREATE TABLE CLIENTES (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    DataNascimento DATE,
    Endereco VARCHAR(255),
    CEP CHAR(8),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2)
);



INSERT INTO CLIENTES (CPF, Nome, DataNascimento, Endereco, CEP, Bairro, Cidade, UF)
VALUES
    ('12345678901', 'João da Silva', '1990-05-15', 'Rua Principal, 123', '12345678', 'Centro', 'São Paulo', 'SP'),
    ('98765432109', 'Maria Souza', '1985-10-20', 'Avenida Secundária, 456', '98765432', 'Bairro Novo', 'Rio de Janeiro', 'RJ');


/*Questão 02*/

ALTER TABLE CLIENTES
ADD DataUltimaCompra DATE;


UPDATE CLIENTES
SET DataUltimaCompra = '2023-09-15'
WHERE CPF = '12345678901';

UPDATE CLIENTES
SET DataUltimaCompra = '2023-09-14'
WHERE CPF = '98765432109';

/*  */
/*Questão 03*/

INSERT INTO CLIENTES (CPF, Nome, DataNascimento, Endereco, CEP, Bairro, Cidade, UF)
VALUES
    ('04496332780', 'João da Silva', '1969-11-25', 'Rua Antônio Numes', '88045963', 'Palmeiras', 'Londrina', 'PR'),
    ('05485031490', 'Ana Regina Fagundes', '1986-09-21', 'Rua Palmeias Novas', '88078923', 'Leblon', 'Rio de Janeiro', 'RJ'),
    ('03350314905', 'Fernando Soares', '1990-03-05', 'Rua Palmeias Novas', '88048917', 'Copacabana', 'Rio de Janeiro', 'RJ');


/*Questão 04*/

SELECT *
FROM CLIENTES
WHERE Cidade = 'Rio de Janeiro';


/*Questão 05*/

DELETE FROM CLIENTES
WHERE Cidade = 'Londrina';

/*CONSULTA FINAL*/

SELECT *
FROM CLIENTES;