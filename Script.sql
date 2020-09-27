create database biblioteca; 

use biblioteca; 

/* Criando as tabelas */ 

create table titulos(

	pk_tit_id int primary key auto_increment,
	tit_nome varchar(150) not null unique,
	tit_status enum('LIDO','NAO LIDO') not null default 'NAO LIDO',
	tit_paginas int(10) not null,
	tit_ultimaatualizacao timestamp default current_timestamp on update current_timestamp,
	fk_edi_id int

	);

create table editoras (

	pk_edi_id int primary key auto_increment,
	edi_nome varchar (100) not null unique
);

create table pais (

	pk_pa_id int primary key auto_increment,
	pa_nome varchar (100) not null unique
	
);

create table autores (

	pk_aut_id int primary key auto_increment,
	aut_nome varchar (100) not null unique,
	aut_sexo enum ('F','M') default ('M'),
	fk_pa_id int

);

create table titaut(

	pkfk_tit_id int,
	pkfk_aut_id int,

	primary key(pkfk_tit_id,pkfk_aut_id)

);

/* Criando as chaves por fora */ 

alter table titulos add constraint fk_titulos_editoras
foreign key (fk_edi_id) references editoras (pk_edi_id);

alter table autores add constraint fk_autores_pais
foreign key (fk_pa_id) references pais (pk_pa_id);

alter table titaut add constraint fk_titulos
foreign key (pkfk_tit_id) references titulos (pk_tit_id);

alter table titaut add constraint fk_autores 
foreign key (pkfk_aut_id) references autores (pk_aut_id);