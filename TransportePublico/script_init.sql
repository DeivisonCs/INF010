DROP TABLE IF EXISTS PASSAGEM;
DROP TABLE IF EXISTS PAGAMENTO;
DROP TYPE IF EXISTS TIPO_PAGAMENTO;
DROP TABLE IF EXISTS PASSAGEIRO;
DROP TABLE IF EXISTS LINHA;
DROP TABLE IF EXISTS ROTA;
DROP TABLE IF EXISTS MOTORISTA;
DROP TABLE IF EXISTS VEICULO;

CREATE TABLE motorista(motorista_id SERIAL NOT NULL,
						nome varchar(50) NOT NULL,
						CONSTRAINT pk_motorista PRIMARY KEY (motorista_id));

CREATE TABLE veiculo (veiculo_id SERIAL NOT NULL,
					   placa varchar(7) NOT NULL,
					   CONSTRAINT pk_veiculo PRIMARY KEY (veiculo_id));


CREATE TABLE rota (rota_id SERIAL NOT NULL,
					partida varchar(30) NOT NULL,
					destino varchar(30) NOT NULL,
					CONSTRAINT pk_rota PRIMARY KEY (rota_id));


CREATE TABLE linha (linha_id SERIAL NOT NULL,
					 motorista_id int NOT NULL,
					 veiculo_id int NOT NULL,
					 rota_id int NOT NULL,
					 CONSTRAINT pk_linha PRIMARY KEY (linha_id),
					 CONSTRAINT fk_linha_motorista 
					 	FOREIGN KEY (motorista_id) REFERENCES motorista (motorista_id),
					 CONSTRAINT fk_linha_veiculo
					 	FOREIGN KEY (veiculo_id) REFERENCES veiculo (veiculo_id),
					 CONSTRAINT fk_linha_rota
					 	FOREIGN KEY (rota_id) REFERENCES rota (rota_id));


CREATE TABLE passageiro (passageiro_id SERIAL NOT NULL,
						 nome varchar(30),
						 CONSTRAINT pk_passageiro PRIMARY KEY (passageiro_id));

CREATE TYPE tipo_pagamento AS ENUM ('dinheiro', 'vale_transporte', 'estudante', 'maior_idade');

CREATE TABLE pagamento (pagamento_id SERIAL NOT NULL,
						tipo tipo_pagamento NOT NULL,
						preco numeric(10, 2),
						CONSTRAINT pk_pagamento PRIMARY KEY (pagamento_id));


CREATE TABLE passagem(passagem_id SERIAL NOT NULL,
					  pagamento_id int NOT NULL,
					  passageiro_id int NOT NULL,
					  linha_id int NOT NULL,
					  data_hora timestamp,
					  CONSTRAINT pk_passagem PRIMARY KEY (passagem_id),
					  CONSTRAINT fk_passagem_passageiro 
					  	 FOREIGN KEY (passageiro_id) REFERENCES passageiro (passageiro_id),
					  CONSTRAINT fk_passagem_linha
					  	 FOREIGN KEY (linha_id) REFERENCES linha (linha_id),
					  CONSTRAINT fk_passagem_pagamento
					  	 FOREIGN KEY (pagamento_id) REFERENCES pagamento (pagamento_id));
