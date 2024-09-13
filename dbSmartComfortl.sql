-- base de dados da empresa para o uso no Asp.net
-- feito por João Lucas
create database dbSmartComfort;
use dbSmartComfort;

CREATE TABLE tbPJ (
Cnpj numeric(14) PRIMARY KEY,
RazaoSocial varchar(250) not null,
NomeResponsavel varchar(200) not null,
IdCli int
);

CREATE TABLE tbPF (
Cpf numeric(11) PRIMARY KEY,
NomeCompleto varchar(200) not null,
DataNasc date not null,
IdCli int
);

CREATE TABLE tbEndereco (
IdEnd int PRIMARY KEY,
cepEnd numeric(8) not null,
numeroEnd smallint unsigned not null,
LogradouroEnd varchar(250) not null,
ComplementoEnd varchar(255),
IdBai int,
IdEst int,
IdCid int
);

CREATE TABLE tbUsuario (
IdCli int PRIMARY KEY,
EmailCli varchar(100) not null unique,
SenhaCli varchar(30) not null,
TelefoneCli1 numeric(11) not null,
TelefoneCli2 numeric(11),
DataCadCli date not null,
IdEnd int,
FOREIGN KEY(IdEnd) REFERENCES tbEndereco (IdEnd)
);

CREATE TABLE tbEstado (
IdEst int PRIMARY KEY,
UfEstado char(2) unique not null
);

CREATE TABLE tbBairro (
IdBai int PRIMARY KEY,
Bairro varchar(100) not null
);

CREATE TABLE tbCidade (
IdCid int PRIMARY KEY,
Cidade varchar(100) not null
);

CREATE TABLE tbPedido (
IdPed int PRIMARY KEY,
DataPed date not null,
TotalPed decimal(10,2) not null,
IdCli int,
NumNF int,
IdPag int,
IdEnd int,
FOREIGN KEY(IdCli) REFERENCES tbUsuario (IdCli),
FOREIGN KEY(IdEnd) REFERENCES tbEndereco (IdEnd)
);

CREATE TABLE tbPagamento (
IdPag int PRIMARY KEY,
StatusPag varchar(50) not null,
MetodoPag varchar(50) not null
);

CREATE TABLE tbNotaFiscal (
NumNF int PRIMARY KEY,
ChaveAcessoNF smallint unsigned not null unique,
DataNF date not null,
ValorNF decimal(10,2) not null
);

CREATE TABLE tbItemPedido (
IdIte int PRIMARY KEY,
QtdIte smallint unsigned not null,
PrecoIte decimal(10,2) not null,
IdPed int,
CodBar numeric(13) ,
FOREIGN KEY(IdPed) REFERENCES tbPedido (IdPed)
);

CREATE TABLE tbFavoritos (
IdFav int PRIMARY KEY,
CodBar numeric(13) ,
IdCli int,
FOREIGN KEY(IdCli) REFERENCES tbUsuario (IdCli)
);

CREATE TABLE tbProdutoAutomacao (
CodBar numeric(13)  PRIMARY KEY,
NomePro varchar(250) not null,
PrecoPro decimal(10,2) not null,
QtdEstoquePro int unsigned not null,
GarantiaPro date not null,
MarcaPro varchar(200) not null,
ModeloPro varchar(200) not null,
PesoPro decimal(10,3) not null,
AlturaPro decimal(10,2) not null,
LarguraPro decimal(10,2) not null,
ComprimentoPro decimal(10,2) not null,
ImgUrlPro varchar(255) not null,
IdFunc int,
IdCategoria int,
IdVoltagem int
);

CREATE TABLE tbVoltagem (
IdVoltagem int PRIMARY KEY,
NumVoltagem int not null,
descVol varchar(200)
);

CREATE TABLE tbCategoria (
IdCategoria int PRIMARY KEY,
NomeCategoria varchar(50) not null,
descCat varchar(200)
);

CREATE TABLE tbFuncionario (
IdFunc int PRIMARY KEY,
DataEntradaFunc date not null,
EmailFunc varchar(250) not null unique,
NomeFunc varchar(200) not null,
SenhaFunc varchar(50) not null,
CargoFunc varchar(50) not null
);

ALTER TABLE tbPJ ADD FOREIGN KEY(IdCli) REFERENCES tbUsuario (IdCli);
ALTER TABLE tbPF ADD FOREIGN KEY(IdCli) REFERENCES tbUsuario (IdCli);
ALTER TABLE tbEndereco ADD FOREIGN KEY(IdBai) REFERENCES tbBairro (IdBai);
ALTER TABLE tbEndereco ADD FOREIGN KEY(IdEst) REFERENCES tbEstado (IdEst);
ALTER TABLE tbEndereco ADD FOREIGN KEY(IdCid) REFERENCES tbCidade (IdCid);
ALTER TABLE tbPedido ADD FOREIGN KEY(NumNF) REFERENCES tbNotaFiscal (NumNF);
ALTER TABLE tbPedido ADD FOREIGN KEY(IdPag) REFERENCES tbPagamento (IdPag);
ALTER TABLE tbItemPedido ADD FOREIGN KEY(CodBar) REFERENCES tbProdutoAutomacao (CodBar);
ALTER TABLE tbFavoritos ADD FOREIGN KEY(CodBar) REFERENCES tbProdutoAutomacao (CodBar);
ALTER TABLE tbProdutoAutomacao ADD FOREIGN KEY(IdFunc) REFERENCES tbFuncionario (IdFunc);
ALTER TABLE tbProdutoAutomacao ADD FOREIGN KEY(IdCategoria) REFERENCES tbCategoria (IdCategoria);
ALTER TABLE tbProdutoAutomacao ADD FOREIGN KEY(IdVoltagem) REFERENCES tbVoltagem (IdVoltagem);


