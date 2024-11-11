CREATE DATABASE PerfumariaAtv
USE PerfumariaAtv

CREATE TABLE Regiao (
    Cod_Reg INT PRIMARY KEY,
    Local VARCHAR(255),
    Nome_Regiao VARCHAR(255)
);

CREATE TABLE Vendedor (
    Cod_Ven INT PRIMARY KEY,
    Nome VARCHAR(255),
    Data_Nascimento DATE,
    CPF VARCHAR(14),
    CNH VARCHAR(20),
    Cod_Reg INT,
    FOREIGN KEY (Cod_Reg) REFERENCES Regiao
);

CREATE TABLE Ponto_Estrategico (
    Cod_Ponto INT PRIMARY KEY,
    Nome_Ponto VARCHAR(255),
    Cod_Reg INT,
    FOREIGN KEY (Cod_Reg) REFERENCES Regiao
);

CREATE TABLE Tipo_Carro (
    Cod_Tipo INT PRIMARY KEY,
    Descricao_Tipo VARCHAR(255)
);

CREATE TABLE Veiculo (
    Cod_Car INT PRIMARY KEY,
    Marca VARCHAR(255),
    Modelo VARCHAR(255),
    Ano INT,
    Cod_Tipo INT,
    FOREIGN KEY (Cod_Tipo) REFERENCES Tipo_Carro(Cod_Tipo)
);

CREATE TABLE Escala_Veiculo (
    Data_Escala DATE,
    Cod_Ven INT,
    Cod_Car INT,
    FOREIGN KEY (Cod_Ven) REFERENCES Vendedor,
    FOREIGN KEY (Cod_Car) REFERENCES Veiculo
);

CREATE TABLE Cliente (
    Cod_Cli INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF VARCHAR(14),
    Data_Nascimento DATE
);

CREATE TABLE Nota_Fiscal (
    Cod_Ven INT,
    Cod_Cli INT,
    Cod_Nota INT PRIMARY KEY,
    Data_Nota DATE,
    FOREIGN KEY (Cod_Ven) REFERENCES Vendedor,
    FOREIGN KEY (Cod_Cli) REFERENCES Cliente
);

CREATE TABLE Produto (
    Cod_Produto INT PRIMARY KEY,
    Nome VARCHAR(255),
    Marca VARCHAR(255),
    Estoque INT,
    Descricao TEXT,
    Preco DECIMAL(10, 2)
);

CREATE TABLE Item_Consumo (
    Cod_Produto INT,
    Quantidade INT,
    Cod_Nota INT,
    FOREIGN KEY (Cod_Produto) REFERENCES Produto,
    FOREIGN KEY (Cod_Nota) REFERENCES Nota_Fiscal
);



INSERT INTO Regiao (Cod_Reg, Local, Nome_Regiao) 
VALUES (1, 'São Paulo', 'Sudeste'), 
       (2, 'Rio de Janeiro', 'Sudeste'), 
       (3, 'Belo Horizonte', 'Sudeste'), 
       (4, 'Salvador', 'Nordeste'), 
       (5, 'Recife', 'Nordeste'), 
       (6, 'Curitiba', 'Sul'), 
       (7, 'Porto Alegre', 'Sul'), 
       (8, 'Brasília', 'Centro-Oeste'), 
       (9, 'Goiânia', 'Centro-Oeste'), 
       (10, 'Manaus', 'Norte');


INSERT INTO Vendedor (Cod_Ven, Nome, Data_Nascimento, CPF, CNH, Cod_Reg) 
VALUES (1, 'João Silva', '1980-05-10', '123.456.789-00', 'ABC12345', 1), 
       (2, 'Maria Souza', '1985-06-20', '234.567.890-11', 'DEF23456', 2), 
       (3, 'Pedro Oliveira', '1990-07-15', '345.678.901-22', 'GHI34567', 3), 
       (4, 'Ana Costa', '1975-08-25', '456.789.012-33', 'JKL45678', 4), 
       (5, 'Lucas Lima', '1992-09-30', '567.890.123-44', 'MNO56789', 5), 
       (6, 'Fernanda Dias', '1987-10-10', '678.901.234-55', 'PQR67890', 6), 
       (7, 'Carlos Nunes', '1978-11-11', '789.012.345-66', 'STU78901', 7), 
       (8, 'Juliana Santos', '1983-12-12', '890.123.456-77', 'VWX89012', 8), 
       (9, 'Bruno Almeida', '1995-01-15', '901.234.567-88', 'YZA90123', 9), 
       (10, 'Patricia Gomes', '1981-02-20', '012.345.678-99', 'BCD01234', 10);


INSERT INTO Ponto_Estrategico (Cod_Ponto, Nome_Ponto, Cod_Reg) 
VALUES (1, 'Ponto Central SP', 1), 
       (2, 'Ponto RJ Centro', 2), 
       (3, 'Ponto BH Leste', 3), 
       (4, 'Ponto Salvador Norte', 4), 
       (5, 'Ponto Recife Sul', 5), 
       (6, 'Ponto Curitiba Oeste', 6), 
       (7, 'Ponto Porto Alegre Norte', 7), 
       (8, 'Ponto Brasília Central', 8), 
       (9, 'Ponto Goiânia Leste', 9), 
       (10, 'Ponto Manaus Centro', 10);


INSERT INTO Tipo_Carro (Cod_Tipo, Descricao_Tipo) 
VALUES (1, 'SUV'), 
       (2, 'Sedan'), 
       (3, 'Hatchback'), 
       (4, 'Caminhonete'), 
       (5, 'Conversível'), 
       (6, 'Minivan'), 
       (7, 'Pickup'), 
       (8, 'Esportivo'), 
       (9, 'Moto'), 
       (10, 'Caminhão');


INSERT INTO Veiculo (Cod_Car, Marca, Modelo, Ano, Cod_Tipo) 
VALUES (1, 'Toyota', 'Corolla', 2020, 2), 
       (2, 'Honda', 'Civic', 2019, 2), 
       (3, 'Ford', 'EcoSport', 2021, 1), 
       (4, 'Chevrolet', 'S10', 2022, 4), 
       (5, 'BMW', 'Z4', 2021, 5), 
       (6, 'Fiat', 'Ducato', 2020, 6), 
       (7, 'Chevrolet', 'Montana', 2020, 7), 
       (8, 'Ferrari', '488', 2021, 8), 
       (9, 'Harley-Davidson', 'Sportster', 2019, 9), 
       (10, 'Volvo', 'FH16', 2022, 10);


INSERT INTO Escala_Veiculo (Data_Escala, Cod_Ven, Cod_Car) 
VALUES ('2023-01-10', 1, 1), 
       ('2023-02-15', 2, 2), 
       ('2023-03-20', 3, 3), 
       ('2023-04-25', 4, 4), 
       ('2023-05-30', 5, 5), 
       ('2023-06-05', 6, 6), 
       ('2023-07-10', 7, 7), 
       ('2023-08-15', 8, 8), 
       ('2023-09-20', 9, 9), 
       ('2023-10-25', 10, 10);


INSERT INTO Cliente (Cod_Cli, Nome, CPF, Data_Nascimento) 
VALUES (1, 'Rodrigo Farias', '123.456.789-00', '1990-01-01'), 
       (2, 'Letícia Rocha', '234.567.890-11', '1985-02-15'), 
       (3, 'Marcos Andrade', '345.678.901-22', '1992-03-03'), 
       (4, 'Camila Lima', '456.789.012-33', '1987-04-04'), 
       (5, 'Thiago Reis', '567.890.123-44', '1995-05-05'), 
       (6, 'Priscila Costa', '678.901.234-55', '1983-06-06'), 
       (7, 'Felipe Nogueira', '789.012.345-66', '1998-07-07'), 
       (8, 'Rafaela Barros', '890.123.456-77', '1989-08-08'), 
       (9, 'Gustavo Souza', '901.234.567-88', '1990-09-09'), 
       (10, 'Vanessa Melo', '012.345.678-99', '1980-10-10');


INSERT INTO Nota_Fiscal (Cod_Ven, Cod_Cli, Cod_Nota, Data_Nota) 
VALUES (1, 1, 1001, '2023-01-01'), 
       (2, 2, 1002, '2023-02-15'), 
       (3, 3, 1003, '2023-03-03'), 
       (4, 4, 1004, '2023-04-04'), 
       (5, 5, 1005, '2023-05-05'), 
       (6, 6, 1006, '2023-06-06'), 
       (7, 7, 1007, '2023-07-07'), 
       (8, 8, 1008, '2023-08-08'), 
       (9, 9, 1009, '2023-09-09'), 
       (10, 10, 1010, '2023-10-10');

INSERT INTO Produto (Cod_Produto, Nome, Marca, Estoque, Descricao, Preco) 
VALUES (1, 'Perfume Dior Sauvage', 'Dior', 50, 'Perfume masculino, fresco e picante', 450.00), 
       (2, 'Perfume Chanel No. 5', 'Chanel', 30, 'Perfume feminino clássico', 600.00), 
       (3, 'Loção Corporal Nivea', 'Nivea', 20, 'Hidratante para a pele', 50.00), 
       (4, 'Desodorante Rexona', 'Rexona', 40, 'Desodorante aerosol, proteção 48h', 20.00), 
       (5, 'Creme para Mãos Dove', 'Dove', 25, 'Creme hidratante para mãos', 15.00), 
       (6, 'Perfume Acqua di Gio', 'Giorgio Armani', 15, 'Perfume aquático e aromático', 500.00), 
       (7, 'Kit de Maquiagem Avon', 'Avon', 10, 'Kit com batom, sombra e blush', 120.00), 
       (8, 'Sabonete Líquido Natura', 'Natura', 35, 'Sabonete líquido com fragrância', 30.00), 
       (9, 'Óleo Corporal Jojoba', 'Granado', 20, 'Óleo para pele seca', 80.00), 
       (10, 'Perfume Gucci Bloom', 'Gucci', 12, 'Perfume floral feminino', 350.00);


INSERT INTO Item_Consumo (Cod_Produto, Quantidade, Cod_Nota) 
VALUES (1, 2, 1001), 
	   (2, 1, 1002), 
       (3, 1, 1003), 
       (4, 1, 1004), 
       (5, 2, 1005), 
       (6, 1, 1006), 
       (7, 1, 1007), 
       (8, 1, 1008),
	   (10, 1, 1010);

--A
SELECT R.Nome_Regiao, P.Nome_Ponto
FROM Regiao R
JOIN Ponto_Estrategico P ON R.Cod_Reg = P.Cod_Reg;

--B
SELECT Nome_Regiao
FROM Regiao;

--C
SELECT V.Nome AS Nome_Vendedor, VE.Marca, VE.Modelo, EV.Data_Escala
FROM Vendedor V
JOIN Escala_Veiculo EV ON V.Cod_Ven = EV.Cod_Ven
JOIN Veiculo VE ON EV.Cod_Car = VE.Cod_Car
WHERE EV.Data_Escala BETWEEN '2023-10-01' AND '2023-10-31';

--D
SELECT R.Nome_Regiao, V.Nome AS Nome_Vendedor
FROM Regiao R
JOIN Vendedor V ON R.Cod_Reg = V.Cod_Reg;

--E
SELECT P.Nome AS Nome_Produto, P.Marca, IC.Quantidade
FROM Nota_Fiscal NF
JOIN Item_Consumo IC ON NF.Cod_Nota = IC.Cod_Nota
JOIN Produto P ON IC.Cod_Produto = P.Cod_Produto
JOIN Vendedor V ON NF.Cod_Ven = V.Cod_Ven
WHERE V.Nome = 'João Silva';

--F
SELECT V.Nome AS Nome_Vendedor
FROM Nota_Fiscal NF
JOIN Item_Consumo IC ON NF.Cod_Nota = IC.Cod_Nota
JOIN Produto P ON IC.Cod_Produto = P.Cod_Produto
JOIN Vendedor V ON NF.Cod_Ven = V.Cod_Ven
WHERE P.Nome = 'Perfume Dior Sauvage';

--G
SELECT P.Nome AS Nome_Produto, P.Marca
FROM Produto P
WHERE P.Cod_Produto NOT IN (SELECT Cod_Produto FROM Item_Consumo);

--H
SELECT EV.Data_Escala, V.Nome AS Nome_Vendedor, VE.Marca, VE.Modelo
FROM Escala_Veiculo EV
JOIN Vendedor V ON EV.Cod_Ven = V.Cod_Ven
JOIN Veiculo VE ON EV.Cod_Car = VE.Cod_Car
WHERE VE.Cod_Car = 1;

--I
SELECT NF.Cod_Nota, SUM(IC.Quantidade) AS Total_Itens
FROM Nota_Fiscal NF
JOIN Item_Consumo IC ON NF.Cod_Nota = IC.Cod_Nota
GROUP BY NF.Cod_Nota;
