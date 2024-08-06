CREATE DATABASE Comércio
USE Comércio

Create Table TBL_Estado_Civil(
		cod_est_civ int,
		desc_est_civ Varchar(30),

		Primary Key(cod_est_civ)
);

Create Table TBL_Tipo_Fone(
		cod_fone int,
		desc_fone Varchar(30),

		Primary Key(cod_fone)
);

Create Table TBL_Produto(
		cod_produto int,
		nome_produto Varchar(30),
		tipo_produto Varchar(50),

		Primary Key(cod_produto)
);

Create Table TBL_Func(
		cod_func int,
		nome_func Varchar(60),

		Primary Key(cod_func)
);

Create Table TBL_Premio(
		cod_func int,
		valor_premio Varchar(60),

		Foreign Key(cod_func) References TBL_Func
);

Create Table TBL_Dependente(
		cod_dep int,
		nome_dep Varchar(50),
		data_nasc Date,
		cod_func int,

		Primary Key(cod_dep),
		Foreign Key(cod_func) References TBL_Func
);

Create Table TBL_Cliente(
		cod_cliente int,
		nome_cliente Varchar(50),
		data_nasc Date,
		cod_est_civ int,
		salario Float,

		Primary Key(cod_cliente),
		Foreign Key(cod_est_civ) References TBL_Estado_Civil
);

Create Table TBL_Telefone(
		cod_cliente int,
		cod_fone int,
		numero_fone Varchar(20),

		Foreign Key(cod_cliente) References TBL_Cliente,
		Foreign Key(cod_fone) References TBL_Tipo_Fone
);

Create Table TBL_Conjuge(
		cod_conjuge int,
		nome_conjuge Varchar(60),
		cod_cliente int

		Foreign Key(cod_cliente) References TBL_Cliente,
		Primary Key(cod_conjuge)
);

Create Table TBL_Pedido(
		cod_pedido int,
		cod_cliente int,
		cod_fun int,
		data_pedido Date,

		Primary Key(cod_pedido),
		Foreign Key(cod_cliente) References TBL_Cliente,
		Foreign Key(cod_fun) References TBL_Func
);


Create Table TBL_Item_Pedido(
		cod_pedido int,
		cod_produto int,
		qtde_produto int,

		Foreign Key(cod_pedido) References TBL_Pedido,
		Foreign Key(cod_produto) References TBL_Produto
);
