CREATE DATABASE elevateCare;
USE elevateCare;

CREATE TABLE nivel(
nivel INTEGER PRIMARY KEY,
descricao VARCHAR(30) NOT NULL);

CREATE TABLE pessoa_fisica(

cpf CHAR(11) PRIMARY KEY,
rg VARCHAR(10) NOT NULL,
expedidor CHAR(3) NOT NULL,
nome VARCHAR(100) NOT NULL, 
nascimento DATE NOT NULL,
sexo CHAR(1) NOT NULL, 
email VARCHAR(50),
telefone VARCHAR (50) NOT NULL,
pai VARCHAR(100), 
mae VARCHAR(100) NOT NULL,
cep CHAR (8) NOT NULL,
logradouro CHAR(100) NOT NULL,
numero VARCHAR(10) NOT NULL,
complemento VARCHAR (50),
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
--TIRAR DUVIDA SOBRE O POSSUI CPF
possui_cpf VARCHAR(11),
nivel INTEGER FOREIGN KEY REFERENCES nivel);

CREATE TABLE cliente(
cd_cliente INTEGER PRIMARY KEY,
cpf CHAR(11) FOREIGN KEY REFERENCES pessoa_fisica);

CREATE TABLE especialidade(
especialidade INTEGER PRIMARY KEY,
descricao VARCHAR(50) NOT NULL);

CREATE TABLE cargo(
cargo INTEGER PRIMARY KEY,
descricao VARCHAR(50) NOT NULL);

CREATE TABLE funcionario(
matricula INTEGER PRIMARY KEY,
cpf CHAR(11) FOREIGN KEY REFERENCES pessoa_fisica,
cargo INTEGER FOREIGN KEY REFERENCES cargo);

CREATE TABLE medico(
crm VARCHAR(10) PRIMARY KEY,
cpf CHAR(11) FOREIGN KEY REFERENCES pessoa_fisica,
especialidade INTEGER FOREIGN KEY REFERENCES especialidade); 

CREATE TABLE consulta(
prontuario INTEGER PRIMARY KEY,
horario_consulta TIME NOT NULL,
data_consulta DATE NOT NULL,
crm VARCHAR(10) FOREIGN KEY REFERENCES medico,
cd_cliente INTEGER FOREIGN KEY REFERENCES cliente);

CREATE TABLE agenda(
id_agenda INTEGER PRIMARY KEY,
data_agenda DATE NOT NULL,
horario_agenda TIME NOT NULL,
situacao CHAR(1) NOT NULL,
crm VARCHAR(10) FOREIGN KEY REFERENCES medico);

CREATE TABLE disponibilidade(
id_disponibilidade INTEGER PRIMARY KEY,
dia_semana CHAR(3) NOT NULL,
hora_inicial TIME NOT NULL,
hora_final TIME NOT NULL,
encaixe CHAR(1) NOT NULL,
situacao CHAR(1) NOT NULL,
crm VARCHAR(10) FOREIGN KEY REFERENCES medico);


SELECT * FROM nivel;
SELECT * FROM pessoa_fisica;
SELECT * FROM cliente;
SELECT * FROM especialidade;
SELECT * FROM cargo;
SELECT * FROM funcionario;
SELECT * FROM medico;
SELECT * FROM consulta;
SELECT * FROM agenda;
SELECT * FROM disponibilidade;