create database VendasDATABASE;
use VendasDATABASE;

CREATE TABLE estado(
id_estado int auto_increment PRIMARY KEY,
estado char(2) not null);

CREATE TABLE cidade(
id_cidade int auto_increment PRIMARY KEY,
cidade varchar(50) not null,
id_estado int,
foreign key(id_estado) references estado(id_estado));

CREATE TABLE clientes(
id_cliente int auto_increment PRIMARY KEY,
nome varchar(75) not null,
email varchar(75) not null,
cpf char(11) unique not null,
id_cidade int,
foreign key(id_cidade) references cidade(id_cidade));

CREATE TABLE produtos(
id_produto int auto_increment PRIMARY KEY,
nome varchar(75) not null,
categoria varchar(50) not null,
marca varchar(50) not null,
fornecedor varchar(50) not null,
preco decimal(10,2) not null check(preco >=0)

);

CREATE TABLE vendedores(
id_vendedor int auto_increment PRIMARY KEY,
nome varchar(50) not null);

CREATE TABLE vendas(
id_venda int auto_increment PRIMARY KEY,
id_cliente int not null,
id_vendedor int not null,
forma_pagamento ENUM('PIX', 'Debito', 'Credito'),
data_venda DATE,

foreign key(id_cliente) references clientes(id_cliente),
foreign key(id_vendedor) references vendedores(id_vendedor)
);

CREATE TABLE itens_vendas(
    id_venda int not null,
    id_produto int not null,
    quantidade int not null CHECK (quantidade > 0),
    preco_unitario decimal(10,2) CHECK (preco_unitario >= 0),

    PRIMARY KEY(id_venda, id_produto),

    FOREIGN KEY(id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY(id_produto) REFERENCES produtos(id_produto)
);