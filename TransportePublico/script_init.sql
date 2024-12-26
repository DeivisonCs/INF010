DROP MATERIALIZED VIEW IF EXISTS view_passagens_resumo;
DROP TABLE IF EXISTS PASSAGEM;
DROP TABLE IF EXISTS VIAGEM;
DROP TABLE IF EXISTS STATUS_VIAGEM;
DROP TABLE IF EXISTS TARIFA;
DROP TYPE IF EXISTS TIPO_PAGAMENTO;
DROP TABLE IF EXISTS PASSAGEIRO;
DROP TABLE IF EXISTS LINHA;
DROP TABLE IF EXISTS ROTA;
DROP TABLE IF EXISTS MOTORISTA;
DROP TABLE IF EXISTS SITUACAO_MOTORISTA;
DROP TABLE IF EXISTS EMPRESA;
DROP TABLE IF EXISTS VEICULO;
DROP TABLE IF EXISTS CONCESSIONARIA;

CREATE TABLE empresa (empresa_id SERIAL NOT NULL,
					  nome varchar(30) NOT NULL,
					  CONSTRAINT pk_empresa PRIMARY KEY (empresa_id));

CREATE TABLE situacao_motorista(situacao_id SERIAL NOT NULL,
								 descricao varchar(15) NOT NULL,
								 CONSTRAINT pk_situacao_motorista PRIMARY KEY (situacao_id));

CREATE TABLE motorista(motorista_id SERIAL NOT NULL,
						nome varchar(50) NOT NULL,
						cnh varchar(11) NOT NULL,
						situacao_id int NOT NULL,
						empresa_id int NOT NULL,
						CONSTRAINT pk_motorista PRIMARY KEY (motorista_id),
						CONSTRAINT fk_motorista_empresa
					 		FOREIGN KEY (empresa_id) REFERENCES empresa (empresa_id),
						CONSTRAINT fk_motorista_situacao
					 		FOREIGN KEY (situacao_id) REFERENCES situacao_motorista (situacao_id));

CREATE TABLE concessionaria (concessionaria_id SERIAL NOT NULL,
							  nome varchar(100) NOT NULL,
							  endereco varchar(255),
							  telefone varchar(15),
							  email varchar(100) NOT NULL,
							  cnpj varchar(14) NOT NULL,
							  CONSTRAINT pk_concessionaria PRIMARY KEY (concessionaria_id));


CREATE TABLE veiculo (veiculo_id SERIAL NOT NULL,
					   placa varchar(7) NOT NULL,
					   modelo varchar(30) NOT NULL,
					   concessionaria_id int NOT NULL,
					   capacidade_passageiros int NOT NULL,
					   capacidade_combustivel numeric(50,2) NOT NULL,
					   CONSTRAINT pk_veiculo PRIMARY KEY (veiculo_id),
					   CONSTRAINT fk_veiculo_concessionaria
					 		FOREIGN KEY (concessionaria_id) REFERENCES concessionaria (concessionaria_id));


CREATE TABLE rota (rota_id SERIAL NOT NULL,
					partida varchar(30) NOT NULL,
					destino varchar(30) NOT NULL,
					distancia numeric(50, 2) NOT NULL,
					custo_operacional numeric(50,2) NOT NULL,
					CONSTRAINT pk_rota PRIMARY KEY (rota_id));


CREATE TABLE linha (linha_id SERIAL NOT NULL,
					 rota_id int NOT NULL,
					 inicio time NOT NULL,
					 fim time NOT NULL,
					 CONSTRAINT pk_linha PRIMARY KEY (linha_id),
					 CONSTRAINT fk_linha_rota
					 	FOREIGN KEY (rota_id) REFERENCES rota (rota_id));


CREATE TABLE passageiro (passageiro_id UUID NOT NULL,
						 nome varchar(30),
						 CONSTRAINT pk_passageiro PRIMARY KEY (passageiro_id));

CREATE TYPE tipo_pagamento AS ENUM ('dinheiro', 'vale_transporte', 'estudante', 'maior_idade');

CREATE TABLE tarifa (tarifa_id SERIAL NOT NULL,
						tipo tipo_pagamento NOT NULL,
						preco numeric(10, 2) NOT NULL,
						CONSTRAINT pk_tarifa PRIMARY KEY (tarifa_id));

CREATE TABLE status_viagem (status_id SERIAL NOT NULL,
							status varchar(20) NOT NULL,
							CONSTRAINT pk_status_viagem PRIMARY KEY (status_id));

CREATE TABLE viagem (viagem_id SERIAL NOT NULL,
					  linha_id int NOT NULL,
					  motorista_id int NOT NULL,
					  veiculo_id int NOT NULL,
					  inicio timestamp NOT NULL,
					  fim timestamp,
					  status_id int NOT NULL,
					  CONSTRAINT pk_viagem PRIMARY KEY (viagem_id),
					  CONSTRAINT fk_viagem_linha
					  	 FOREIGN KEY (linha_id) REFERENCES linha (linha_id),
					  CONSTRAINT fk_viagem_motorista
					  	 FOREIGN KEY (motorista_id) REFERENCES motorista (motorista_id),
					  CONSTRAINT fk_viagem_veiculo
					  	 FOREIGN KEY (veiculo_id) REFERENCES veiculo (veiculo_id),
					  CONSTRAINT fk_viagem_status
					  	 FOREIGN KEY (status_id) REFERENCES status_viagem (status_id)
					  );

CREATE TABLE passagem(passagem_id SERIAL NOT NULL,
					  tarifa_id int NOT NULL,
					  viagem_id int NOT NULL,
					  passageiro_id UUID NOT NULL,
					  timestamp timestamp NOT NULL,
					  CONSTRAINT pk_passagem PRIMARY KEY (passagem_id),
					  CONSTRAINT fk_passagem_passageiro
					  	 FOREIGN KEY (passageiro_id) REFERENCES passageiro (passageiro_id),
					  CONSTRAINT fk_passagem_tarifa
					  	 FOREIGN KEY (tarifa_id) REFERENCES tarifa (tarifa_id),
					  CONSTRAINT fk_passagem_viagem
					  	 FOREIGN KEY (viagem_id) REFERENCES viagem (viagem_id));