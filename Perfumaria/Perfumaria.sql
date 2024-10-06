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

CREATE TABLE Descricao_Veiculo (
    Cod_Veiculo INT PRIMARY KEY,
    Descricao VARCHAR(255)
);

-- Inserções para a tabela Regiao
INSERT INTO Regiao (Cod_Reg, Local, Nome_Regiao) VALUES (1, 'Norte', 'Amazônia'), (2, 'Sul', 'Paraná'), (3, 'Sudeste', 'São Paulo'), (4, 'Nordeste', 'Bahia'), (5, 'Centro-Oeste', 'Goiás'), (6, 'Norte', 'Roraima'), (7, 'Sul', 'Rio Grande do Sul'), (8, 'Sudeste', 'Rio de Janeiro'), (9, 'Nordeste', 'Pernambuco'), (10, 'Centro-Oeste', 'Mato Grosso');

-- Inserções para a tabela Vendedor
INSERT INTO Vendedor (Cod_Ven, Nome, Data_Nascimento, CPF, CNH, Cod_Reg) 
VALUES (1, 'João Silva', '1980-01-01', '123.456.789-00', 'CNH12345', 1),
       (2, 'Maria Souza', '1990-02-15', '987.654.321-00', 'CNH67890', 2),
       (3, 'Pedro Santos', '1975-05-23', '456.789.123-00', 'CNH54321', 3),
       (4, 'Ana Costa', '1988-11-30', '654.321.987-00', 'CNH67891', 4),
       (5, 'Lucas Oliveira', '1995-07-07', '321.654.987-00', 'CNH54322', 5),
       (6, 'Beatriz Lima', '1982-03-03', '789.123.456-00', 'CNH67892', 6),
       (7, 'Carlos Pereira', '1978-06-06', '123.789.456-00', 'CNH54323', 7),
       (8, 'Gabriel Ferreira', '1992-08-12', '456.123.789-00', 'CNH67893', 8),
       (9, 'Isabela Alves', '1986-09-19', '789.654.321-00', 'CNH54324', 9),
       (10, 'Paulo Rocha', '1999-12-25', '321.987.654-00', 'CNH67894', 10);

-- Inserções para a tabela Ponto_Estrategico
INSERT INTO Ponto_Estrategico (Cod_Ponto, Nome_Ponto, Cod_Reg)
VALUES (1, 'Ponto A', 1), (2, 'Ponto B', 2), (3, 'Ponto C', 3), (4, 'Ponto D', 4), 
       (5, 'Ponto E', 5), (6, 'Ponto F', 6), (7, 'Ponto G', 7), (8, 'Ponto H', 8), 
       (9, 'Ponto I', 9), (10, 'Ponto J', 10);

-- Inserções para a tabela Tipo_Carro
INSERT INTO Tipo_Carro (Cod_Tipo, Descricao_Tipo) 
VALUES (1, 'Sedan'), (2, 'Hatch'), (3, 'SUV'), (4, 'Caminhonete'), 
       (5, 'Conversível'), (6, 'Coupé'), (7, 'Van'), (8, 'Esportivo'), 
       (9, 'Picape'), (10, 'Minivan');

-- Inserções para a tabela Veiculo
INSERT INTO Veiculo (Cod_Car, Marca, Modelo, Ano, Cod_Tipo)
VALUES (1, 'Ford', 'Ka', 2019, 2), (2, 'Chevrolet', 'Onix', 2020, 2), 
       (3, 'Jeep', 'Compass', 2021, 3), (4, 'Fiat', 'Toro', 2018, 9), 
       (5, 'BMW', '320i', 2017, 1), (6, 'Toyota', 'Corolla', 2019, 1), 
       (7, 'Hyundai', 'HB20', 2020, 2), (8, 'Honda', 'Civic', 2021, 1), 
       (9, 'Volkswagen', 'Tiguan', 2020, 3), (10, 'Mercedes', 'Classe A', 2022, 6);

-- Inserções para a tabela Cliente
INSERT INTO Cliente (Cod_Cli, Nome, CPF, Data_Nascimento) 
VALUES (1, 'Cliente A', '111.111.111-11', '1980-01-01'), 
       (2, 'Cliente B', '222.222.222-22', '1990-02-15'),
       (3, 'Cliente C', '333.333.333-33', '1985-03-03'), 
       (4, 'Cliente D', '444.444.444-44', '1975-04-04'),
       (5, 'Cliente E', '555.555.555-55', '2000-05-05'), 
       (6, 'Cliente F', '666.666.666-66', '1995-06-06'),
       (7, 'Cliente G', '777.777.777-77', '1987-07-07'), 
       (8, 'Cliente H', '888.888.888-88', '1978-08-08'),
       (9, 'Cliente I', '999.999.999-99', '1988-09-09'), 
       (10, 'Cliente J', '000.000.000-00', '1999-10-10');

-- Inserções para a tabela Nota_Fiscal
INSERT INTO Nota_Fiscal (Cod_Ven, Cod_Cli, Cod_Nota, Data_Nota) 
VALUES (1, 1, 1001, '2023-01-01'), (2, 2, 1002, '2023-02-15'), 
       (3, 3, 1003, '2023-03-03'), (4, 4, 1004, '2023-04-04'), 
       (5, 5, 1005, '2023-05-05'), (6, 6, 1006, '2023-06-06'), 
       (7, 7, 1007, '2023-07-07'), (8, 8, 1008, '2023-08-08'), 
       (9, 9, 1009, '2023-09-09'),
