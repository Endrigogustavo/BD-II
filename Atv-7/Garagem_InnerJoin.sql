CREATE DATABASE BDGaragem
USE BDGaragem


Create table Patio(
	Patio_Num Int,
	Ender Varchar(60),
	Capacidade Int,
	PRIMARY KEY (Patio_Num)
);

Create table Modelo(
	CodMod Int,
	Desc_Mod Varchar(50),
	PRIMARY KEY (CodMod),
);

Create table Cliente(
	CPF Varchar(14),
	Nome Varchar(20),
	Nasc Date,
	PRIMARY KEY (CPF),
);

Create table Veiculo(
	CPF Varchar(14),
	CodMod Int,
	Placa Varchar(8),
	Cor Varchar(20),
	Ano Date,
	PRIMARY KEY (Placa),
	FOREIGN KEY (CodMod) REFERENCES Modelo,
	FOREIGN KEY (CPF) REFERENCES Cliente
);

Create table Estaciona(
	Cod Int,
	Patio_Num Int,
	Placa Varchar(8),
	DtEntrada Date,
	DtSaida Date,
	HsEntrada Time,
	HsSaida Time,
	PRIMARY KEY (Cod),
	FOREIGN KEY (Patio_Num) REFERENCES Patio,
	FOREIGN KEY (Placa) REFERENCES Veiculo
);

-- Inserindo dados na tabela Patio
INSERT INTO Patio (Patio_Num, Ender, Capacidade) VALUES
(1, 'Endereço 1', 50),
(2, 'Endereço 2', 30),
(3, 'Endereço 3', 40),
(4, 'Endereço 4', 25),
(5, 'Endereço 5', 35),
(6, 'Endereço 6', 45),
(7, 'Endereço 7', 20),
(8, 'Endereço 8', 60),
(9, 'Endereço 9', 55),
(10, 'Endereço 10', 70),
(11, 'Endereço 11', 25),
(12, 'Endereço 12', 30),
(13, 'Endereço 13', 40),
(14, 'Endereço 14', 50),
(15, 'Endereço 15', 65);

-- Inserindo dados na tabela Modelo
INSERT INTO Modelo (CodMod, Desc_Mod) VALUES
(1, 'Sedan'),
(2, 'SUV'),
(3, 'Hatchback'),
(4, 'Caminhão'),
(5, 'Van'),
(6, 'Esportivo'),
(7, 'Compacto'),
(8, 'Utilitário'),
(9, 'Micro-ônibus'),
(10, 'Coupé'),
(11, 'Conversível'),
(12, 'Semi-reboque'),
(13, 'Trator'),
(14, 'Motocicleta'),
(15, 'Bicicleta');

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (CPF, Nome, Nasc) VALUES
('123.456.789-00', 'João', '1990-05-15'),
('987.654.321-00', 'Maria', '1985-10-20'),
('111.222.333-44', 'Pedro', '2000-03-25'),
('555.666.777-88', 'Ana', '1995-08-12'),
('999.888.777-66', 'Carlos', '1978-11-30'),
('444.333.222-11', 'Paula', '1982-04-07'),
('222.333.444-55', 'Lucas', '2002-09-18'),
('777.888.999-00', 'Mariana', '1998-12-24'),
('666.555.444-33', 'Fernanda', '1989-06-05'),
('333.444.555-66', 'Rodrigo', '1975-02-14'),
('888.999.000-11', 'Juliana', '1993-07-28'),
('777.666.555-44', 'Renato', '1980-10-03'),
('111.222.333-44', 'Patrícia', '2005-03-10'),
('999.888.777-66', 'Gustavo', '1990-01-20'),
('222.333.444-55', 'Carolina', '1973-11-09');

-- Inserindo dados na tabela Veiculo
INSERT INTO Veiculo (CPF, CodMod, Placa, Cor, Ano) VALUES
('123.456.789-00', 1, 'ABC1234', 'Azul', '2018-01-01'),
('987.654.321-00', 2, 'XYZ5678', 'Preto', '2020-06-15'),
('111.222.333-44', 3, 'DEF9999', 'Vermelho', '2015-12-10'),
('555.666.777-88', 4, 'GHI1111', 'Branco', '2019-03-20'),
('999.888.777-66', 5, 'JKL2222', 'Prata', '2017-11-05'),
('444.333.222-11', 6, 'MNO3333', 'Verde', '2016-08-25'),
('222.333.444-55', 7, 'PQR4444', 'Amarelo', '2014-02-28'),
('777.888.999-00', 8, 'STU5555', 'Cinza', '2021-09-10'),
('666.555.444-33', 9, 'VWX6666', 'Roxo', '2013-07-15'),
('333.444.555-66', 10, 'YZA7777', 'Laranja', '2012-05-30'),
('888.999.000-11', 11, 'BCD8888', 'Dourado', '2011-10-12'),
('777.666.555-44', 12, 'EFG9999', 'Prata', '2022-04-18'),
('111.222.333-44', 13, 'HIJ1010', 'Azul', '2023-11-22'),
('999.888.777-66', 14, 'KLM2020', 'Preto', '2024-03-05'),
('222.333.444-55', 15, 'NOP3030', 'Branco', '2020-07-08');

-- Inserindo dados na tabela Estaciona
INSERT INTO Estaciona (Cod, Patio_Num, Placa, DtEntrada, HsEntrada) VALUES
(1, 1, 'ABC1234', '2024-05-18', '08:00:00'),
(2, 2, 'XYZ5678', '2024-05-18', '09:30:00'),
(3, 3, 'DEF9999', '2024-05-18', '10:45:00'),
(4, 4, 'GHI1111', '2024-05-18', '11:15:00'),
(5, 5, 'JKL2222', '2024-05-18', '12:00:00'),
(6, 6, 'MNO3333', '2024-05-18', '13:30:00'),
(7, 7, 'PQR4444', '2024-05-18', '14:45:00'),
(8, 8, 'STU5555', '2024-05-18', '15:20:00'),
(9, 9, 'VWX6666', '2024-05-18', '16:00:00'),
(10, 10, 'YZA7777', '2024-05-18', '17:10:00'),
(11, 11, 'BCD8888', '2024-05-18', '18:30:00'),
(12, 12, 'EFG9999', '2024-05-18', '19:15:00'),
(13, 13, 'HIJ1010', '2024-05-18', '20:00:00'),
(14, 14, 'KLM2020', '2024-05-18', '21:20:00'),
(15, 15, 'NOP3030', '2024-05-18', '22:00:00');






-- INNER JOIN EX1
SELECT Patio.Ender, Estaciona.DtEntrada, Estaciona.DtSaida
FROM Estaciona
INNER JOIN Patio ON Estaciona.Patio_Num = Patio.Patio_Num
WHERE Estaciona.Placa = 'JEG1010';

-- INNER JOIN EX2
SELECT Cliente.CPF, Cliente.Nome
FROM Veiculo
INNER JOIN Cliente ON Veiculo.CPF = Cliente.CPF
WHERE Veiculo.Placa = 'JJJ2020';

-- INNER JOIN EX3
SELECT Veiculo.Placa, Veiculo.Cor
FROM Veiculo
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 1;

-- INNER JOIN EX4
SELECT Veiculo.Ano, Veiculo.Placa
FROM Veiculo
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 1;

-- INNER JOIN EX5
SELECT Veiculo.Placa, Veiculo.Ano, Modelo.Desc_Mod
FROM Veiculo
INNER JOIN Modelo ON Veiculo.CodMod = Modelo.CodMod
WHERE Veiculo.Ano >= '2000';

-- INNER JOIN EX6
SELECT Patio.Ender, Estaciona.DtEntrada, Estaciona.DtSaida
FROM Estaciona
INNER JOIN Patio ON Estaciona.Patio_Num = Patio.Patio_Num
WHERE Estaciona.Placa = 'JEG1010';

-- INNER JOIN EX7
SELECT COUNT(*)
FROM Estaciona
INNER JOIN Veiculo ON Estaciona.Placa = Veiculo.Placa
WHERE Veiculo.Cor = 'Verde';

-- INNER JOIN EX8
SELECT Cliente.*
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.CPF
WHERE Veiculo.CodMod = 1;

-- INNER JOIN EX9
SELECT Estaciona.Placa, Estaciona.HsEntrada, Estaciona.HsSaida
FROM Estaciona
INNER JOIN Veiculo ON Estaciona.Placa = Veiculo.Placa
WHERE Veiculo.Cor = 'Verde';

-- INNER JOIN EX10
SELECT *
FROM Estaciona
WHERE Placa = 'JJJ2020';

-- INNER JOIN EX11
SELECT Cliente.Nome
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.CPF
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 2;

-- INNER JOIN EX12
SELECT Cliente.CPF
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.CPF
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 3;

-- INNER JOIN EX13
SELECT Modelo.Desc_Mod
FROM Modelo
INNER JOIN Veiculo ON Modelo.CodMod = Veiculo.CodMod
INNER JOIN Estaciona ON Veiculo.Placa = Estaciona.Placa
WHERE Estaciona.Cod = 2;

-- INNER JOIN EX14
SELECT Veiculo.Placa, Cliente.Nome, Modelo.Desc_Mod
FROM Veiculo
INNER JOIN Cliente ON Veiculo.CPF = Cliente.CPF
INNER JOIN Modelo ON Veiculo.CodMod = Modelo.CodMod;
