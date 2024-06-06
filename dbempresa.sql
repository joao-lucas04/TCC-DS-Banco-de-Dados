create database dbEmpresa;
use dbEmpresa;

create table tbPessoaFisica (
	CPF int not null,
    RG int not null,
    CNH int not null,
    id_Cli int not null
);

create table tbPessoaJuridica (
	CNPJ int not null,
    id_cli int not null
);

create table tbCadastro (
	senha varchar(50) not null,
    usuario varchar(50) not null,
    num_cad int primary key,
    id_cli bigint not null,
    id_func bigint not null
);

create table tbCliente (
	email varchar(50) not null,
    nomePessoal varchar(50) not null,
    id_cli bigint primary key,
    telefone1 int not null,
    telefone2 int not null
);

create table tbPagamento (
	status_ varchar(50),
    forma_pagamento varchar(50),
    id_pagamento bigint primary key
);

create table tbPedido (
	data_ date not null,
    hora varchar(50) not null,
    cod_compra varchar(50) primary key,
    id_cli bigint not null,
    cod_endereco varchar(50) not null,
    id_pagamento bigint not null
);

create table tbFuncionario (
	salario int not null,
    id_func bigint primary key,
    nomePessoal varchar(50) not null,
    turno varchar(50) not null,
    funcao varchar(50) not null
);

create table tbForma (
	cod_barras varchar(50) not null,
    cod_compra varchar(50) not null
);

create table tbCadastra (
	id_fun bigint not null,
    cod_barras varchar(50) not null
);

create table tbProdutoEletro (
	qtdEstoque int not null,
    cod_barras varchar(50) primary key,
    nome varchar(50) not null,
    marca varchar(50) not null,
    voltagem varchar(50) not null,
    largura int not null,
    preco double not null,
    dataGarantia date not null,
    comprimento int not null
);

create table tbPossui (
	cod_endereco varchar(50) not null,
    id_cli bigint not null
);

create table tbEndereco (
	logradouro varchar(50) not null,
    numero int not null,
    complemento varchar(50) not null,
    CEP int not null,
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    cod_endereco varchar(50) primary key
);