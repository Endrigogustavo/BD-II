CREATE DATABASE Comércio
USE Comércio


Create Table TBL_Estado_Civil(
		cod_est_civ int,
		desc_est_civ Varchar(30),

		Primary Key(cod_est_civ)
);


INSERT INTO TBL_Estado_Civil (cod_est_civ, desc_est_civ) VALUES
(1, 'Solteiro'),
(2, 'Casado'),
(3, 'Separado'),
(4, 'Divorciado'),
(5, 'Viúvo'),
(6, 'União Estável'),
(7, 'Companheiro'),
(8, 'Desquitado'),
(9, 'Namorando'),
(10, 'Noivo');

Create Table TBL_Tipo_Fone(
		cod_fone int,
		desc_fone Varchar(30),

		Primary Key(cod_fone)
);

INSERT INTO TBL_Tipo_Fone (cod_fone, desc_fone) VALUES
(1, 'Fixo'),
(2, 'Celular'),
(3, 'Inteligente'),
(4, 'Satélite'),
(5, 'Público'),
(6, 'Residencial'),
(7, 'Comercial'),
(8, 'Fax'),
(9, 'VoIP'),
(10, 'Rádio');

Create Table TBL_Produto(
		cod_produto int,
		nome_produto Varchar(30),
		tipo_produto Varchar(50),

		Primary Key(cod_produto)
);

INSERT INTO TBL_Produto (cod_produto, nome_produto, tipo_produto) VALUES
(1, 'Notebook', 'Eletrônico'),
(2, 'Smartphone', 'Eletrônico'),
(3, 'Tablet', 'Eletrônico'),
(4, 'Teclado', 'Acessório'),
(5, 'Mouse', 'Acessório'),
(6, 'Monitor', 'Eletrônico'),
(7, 'Impressora', 'Periférico'),
(8, 'Headset', 'Acessório'),
(9, 'Câmera', 'Periférico'),
(10, 'Smartwatch', 'Eletrônico');


Create Table TBL_Func(
		cod_func int,
		nome_func Varchar(60),

		Primary Key(cod_func)
);
INSERT INTO TBL_Func (cod_func, nome_func) VALUES
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Carlos Santos'),
(4, 'Ana Souza'),
(5, 'Roberto Lima'),
(6, 'Paula Costa'),
(7, 'Marcos Pereira'),
(8, 'Juliana Alves'),
(9, 'Fernando Araújo'),
(10, 'Cláudia Mendes');

Create Table TBL_Premio(
		cod_func int,
		valor_premio Varchar(60),

		Foreign Key(cod_func) References TBL_Func
);
INSERT INTO TBL_Premio (cod_func, valor_premio) VALUES
(1, '1000.00'),
(2, '1200.00'),
(3, '1500.00'),
(4, '1100.00'),
(5, '1300.00'),
(6, '1250.00'),
(7, '1400.00'),
(8, '1150.00'),
(9, '1050.00'),
(10, '1350.00');

Create Table TBL_Dependente(
		cod_dep int,
		nome_dep Varchar(50),
		data_nasc Date,
		cod_func int,

		Primary Key(cod_dep),
		Foreign Key(cod_func) References TBL_Func
);
INSERT INTO TBL_Dependente (cod_dep, nome_dep, data_nasc, cod_func) VALUES
(1, 'Pedro Silva', '2010-05-15', 1),
(2, 'Ana Silva', '2012-07-20', 1),
(3, 'Lucas Oliveira', '2008-03-12', 2),
(4, 'Gabriela Santos', '2009-09-25', 3),
(5, 'Felipe Souza', '2011-11-10', 4),
(6, 'Mariana Lima', '2013-01-05', 5),
(7, 'Thiago Costa', '2014-02-22', 6),
(8, 'Beatriz Pereira', '2015-04-18', 7),
(9, 'Mateus Alves', '2016-06-30', 8),
(10, 'Sofia Mendes', '2017-08-12', 10);


Create Table TBL_Cliente(
		cod_cliente int,
		nome_cliente Varchar(50),
		data_nasc Date,
		cod_est_civ int,
		salario Float,

		Primary Key(cod_cliente),
		Foreign Key(cod_est_civ) References TBL_Estado_Civil
);
INSERT INTO TBL_Cliente (cod_cliente, nome_cliente, data_nasc, cod_est_civ, salario) VALUES
(1, 'José da Silva', '1985-04-10', 1, 3000.00),
(2, 'Maria de Souza', '1990-05-15', 2, 3500.00),
(3, 'Carlos Santos', '1978-07-20', 3, 4000.00),
(4, 'Ana Oliveira', '1982-08-25', 4, 4500.00),
(5, 'Paulo Costa', '1980-09-30', 5, 3200.00),
(6, 'Fernanda Lima', '1992-10-05', 6, 3700.00),
(7, 'Ricardo Alves', '1988-11-10', 7, 3300.00),
(8, 'Juliana Mendes', '1975-12-15', 8, 4100.00),
(9, 'Renata Pereira', '1983-01-20', 9, 2900.00),
(10, 'André Araújo', '1995-02-25', 10, 3800.00);



Create Table TBL_Telefone(
		cod_cliente int,
		cod_fone int,
		numero_fone Varchar(20),

		Foreign Key(cod_cliente) References TBL_Cliente,
		Foreign Key(cod_fone) References TBL_Tipo_Fone
);
INSERT INTO TBL_Telefone (cod_cliente, cod_fone, numero_fone) VALUES
(1, 2, '99999-1234'),
(2, 1, '3456-7890'),
(3, 2, '98888-4321'),
(4, 3, '98765-6789'),
(5, 4, '1234-5678'),
(6, 2, '99999-8765'),
(7, 5, '8888-1234'),
(8, 1, '3456-1234'),
(9, 3, '8765-4321'),
(10, 4, '5678-1234');

Create Table TBL_Conjuge(
		cod_conjuge int,
		nome_conjuge Varchar(60),
		cod_cliente int

		Foreign Key(cod_cliente) References TBL_Cliente,
		Primary Key(cod_conjuge)
);
INSERT INTO TBL_Conjuge (cod_conjuge, nome_conjuge, cod_cliente) VALUES
(1, 'Patrícia da Silva', 2),
(2, 'Roberto Souza', 4),
(3, 'Juliana Santos', 6),
(4, 'Felipe Costa', 8),
(5, 'Mariana Lima', 10),
(6, 'Cláudia Oliveira', 1),
(7, 'Bruno Pereira', 3),
(8, 'Daniela Mendes', 5),
(9, 'Luciano Alves', 7),
(10, 'Camila Araújo', 9);


Create Table TBL_Pedido(
		cod_pedido int,
		cod_cliente int,
		cod_fun int,
		data_pedido Date,

		Primary Key(cod_pedido),
		Foreign Key(cod_cliente) References TBL_Cliente,
		Foreign Key(cod_fun) References TBL_Func
);
INSERT INTO TBL_Pedido (cod_pedido, cod_cliente, cod_fun, data_pedido) VALUES
(1, 1, 2, '2023-06-10'),
(2, 3, 4, '2023-07-12'),
(3, 5, 6, '2023-08-15'),
(4, 7, 8, '2023-09-18'),
(5, 9, 10, '2023-10-20'),
(6, 2, 1, '2023-06-11'),
(7, 4, 3, '2023-07-13'),
(8, 6, 5, '2023-08-16'),
(9, 8, 7, '2023-09-19'),
(10, 10, 9, '2023-10-21');

Create Table TBL_Item_Pedido(
		cod_pedido int,
		cod_produto int,
		qtde_produto int,

		Foreign Key(cod_pedido) References TBL_Pedido,
		Foreign Key(cod_produto) References TBL_Produto
);
INSERT INTO TBL_Item_Pedido (cod_pedido, cod_produto, qtde_produto) VALUES
(1, 1, 2),
(2, 3, 1),
(3, 5, 4),
(4, 7, 3),
(5, 9, 5),
(6, 2, 2),
(7, 4, 1),
(8, 6, 3),
(9, 8, 2),
(10, 10, 4);
