INSERT INTO motorista (nome) VALUES
('Carlos Silva'),
('Maria Oliveira'),
('José Santos'),
('Ana Costa');

INSERT INTO veiculo (placa) VALUES
('ABC1D23'),
('XYZ9W87'),
('LMN4O56'),
('QRS3T90');

INSERT INTO rota (partida, destino) VALUES
('Centro', 'Praia'),
('Terminal', 'Shopping'),
('Estação', 'Hospital'),
('Universidade', 'Centro');

INSERT INTO pagamento (tipo, preco) VALUES
('dinheiro', 4.90),
('vale_transporte', 4.90),
('estudante', 2.45),
('maior_idade', 0.00);

INSERT INTO linha (motorista_id, veiculo_id, rota_id) VALUES
(1, 1, 1),  -- Carlos Silva, ABC1D23, Centro-Praia
(2, 2, 2),  -- Maria Oliveira, XYZ9W87, Terminal-Shopping
(3, 3, 3),  -- José Santos, LMN4O56, Estação-Hospital
(4, 4, 4);  -- Ana Costa, QRS3T90, Universidade-Centro

INSERT INTO passageiro (nome) VALUES
('João Silva'),
('Maria Souza'),
('Pedro Almeida'),
('Ana Paula'),
('Lucas Martins'),
('Fernanda Lima'),
('Carlos Dias'),
('Juliana Rocha'),
('Marcos Costa'),
('Tatiane Pereira');

INSERT INTO passagem (pagamento_id, passageiro_id, linha_id, data_hora) VALUES
(1, 1, 1, '2024-10-01 08:00:00'),  -- João Silva, Linha 1
(2, 2, 1, '2024-10-02 09:15:00'),  -- Maria Souza, Linha 1
(3, 3, 2, '2024-10-03 10:30:00'),  -- Pedro Almeida, Linha 2
(4, 4, 2, '2024-10-04 11:45:00'),  -- Ana Paula, Linha 2
(1, 5, 3, '2024-10-05 12:00:00'),  -- Lucas Martins, Linha 3
(2, 6, 3, '2024-10-06 14:30:00'),  -- Fernanda Lima, Linha 3
(3, 7, 4, '2024-10-07 15:00:00'),  -- Carlos Dias, Linha 4
(4, 8, 4, '2024-10-08 16:15:00'),  -- Juliana Rocha, Linha 4
(1, 9, 1, '2024-10-09 17:30:00'),  -- Marcos Costa, Linha 1
(2, 10, 1, '2024-10-10 18:45:00'),  -- Tatiane Pereira, Linha 1
(1, 1, 1, '2024-11-01 08:00:00'),
(2, 2, 1, '2024-11-01 08:30:00'),
(3, 3, 1, '2024-11-01 09:00:00'),
(1, 1, 2, '2024-11-02 07:45:00'),
(4, 2, 2, '2024-11-02 08:15:00'),
(3, 3, 2, '2024-11-02 09:30:00'),
(2, 1, 3, '2024-11-03 08:00:00'),
(1, 2, 3, '2024-11-03 09:00:00'),
(1, 1, 1, '2024-11-01 10:00:00'),
(2, 2, 1, '2024-11-01 10:30:00'),
(3, 3, 1, '2024-11-01 11:00:00'),
(4, 1, 1, '2024-11-01 11:30:00'),
(1, 2, 2, '2024-11-02 10:00:00'),
(2, 3, 2, '2024-11-02 10:30:00'),
(3, 1, 2, '2024-11-02 11:00:00'),
(4, 2, 3, '2024-11-03 10:00:00'),
(1, 3, 3, '2024-11-03 10:30:00'),
(2, 1, 3, '2024-11-03 11:00:00'),
(3, 2, 1, '2024-11-04 08:00:00'),
(4, 3, 1, '2024-11-04 08:30:00'),
(1, 1, 2, '2024-11-04 09:00:00'),
(2, 2, 2, '2024-11-04 09:30:00'),
(3, 3, 3, '2024-11-04 10:00:00');
