Codigo Base

CREATE TABLE public.produtos
(
    valor_unit real NOT NULL,
    quantidade integer NOT NULL,
    id_nf integer NOT NULL,
    id_item integer NOT NULL,
    cod_prod integer NOT NULL,
    desconto integer
);

ALTER TABLE public.produtos
    OWNER to postgres;


INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod)
	VALUES (15, 3, 5, 1, 3);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod)
	VALUES (30, 6, 5, 2, 5);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (23, 22, 6, 1, 1, 15);

INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (15, 25, 6, 2, 3, 20);

INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (25, 10, 7, 1, 1, 3);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (13.5, 10, 7, 2, 2, 4);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (15, 10, 7, 3, 3, 4);
	
INSERT INTO public.produtos(
	valor_unit, quantidade, id_nf, id_item, cod_prod, desconto)
	VALUES (30, 10, 7, 4, 5, 1);
	
Questão 1
	
CREATE TABLE NF (
	ID_NF INTEGER,
	ID_ITEM INTEGER,
	COD_PROD INTEGER,
	VALOR_UNIT DECIMAL(10,2),
	QUANTIDADE INTEGER,
	DESCONTO REAL );
	
INSERT INTO NF VALUES (1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.50, 3, null),
(1, 3, 3, 15.00, 2, null),
(1, 4, 4, 10.00, 1, null),
(1, 5, 5, 30.00, 1, null),
(2, 1, 3, 15.00, 4, null),
(2, 2, 4, 10.00, 5, null),
(2, 3, 5, 30.00, 7, null),
(3, 1, 1, 25.00, 5, null),
(3, 2, 4, 10.00, 4, null),
(3, 3, 5, 30.00, 5, null),
(3, 4, 2, 13.50, 7, null),
(4, 1, 5, 30.00, 10, 15),
(4, 2, 4, 10.00, 12, 5),
(4, 3, 1, 25.00, 13, 5),
(4, 4, 2, 13.50, 15, 5),
(5, 1, 3, 15.00, 3, null),
(5, 2, 5, 30.00, 6, null),
(6, 1, 1, 25.00, 22, 15),
(6, 2, 3, 15.00, 25, 20),
(7, 1, 1, 25.00, 10, 3),
(7, 2, 2, 13.50, 10, 4),
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);


Questão A

SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT
FROM NF
WHERE DESCONTO IS NULL;

Questão B

SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO
FROM NF
WHERE DESCONTO IS NOT NULL;

Questão C
UPDATE NF
SET DESCONTO = 0
WHERE DESCONTO IS NULL;

Questão D

SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL, DESCONTO, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO
FROM NF;

Questão E

SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM NF
GROUP BY ID_NF
ORDER BY VALOR_TOTAL DESC;

Questão F

SELECT ID_NF, SUM((VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) * QUANTIDADE) AS VALOR_VENDIDO
FROM NF
GROUP BY ID_NF
ORDER BY VALOR_VENDIDO DESC;


Questão G

SELECT COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE
FROM NF
GROUP BY COD_PROD
ORDER BY QUANTIDADE DESC
LIMIT 1;

Questão H

SELECT ID_NF, COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE
FROM NF
GROUP BY ID_NF, COD_PROD
HAVING SUM(QUANTIDADE) > 10;


Questão I

SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT
FROM NF
GROUP BY ID_NF
HAVING SUM(QUANTIDADE * VALOR_UNIT) > 500
ORDER BY VALOR_TOT DESC;


Questão J

SELECT COD_PROD, AVG(DESCONTO) AS MEDIA
FROM NF
GROUP BY COD_PROD;


Questão K

SELECT COD_PROD, MIN(DESCONTO) AS MENOR, MAX(DESCONTO) AS MAIOR, AVG(DESCONTO) AS MEDIA
FROM NF
GROUP BY COD_PROD;

Questão L

SELECT ID_NF, COUNT(ID_ITEM) AS QTD_ITENS
FROM NF
GROUP BY ID_NF
HAVING COUNT(ID_ITEM) > 3;

