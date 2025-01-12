-- Inserção de empresas
INSERT INTO empresa (nome, endereco, telefone, email, cnpj) VALUES 
('Empresa A', 'Avenida Central, 456, Bairro XYZ, Cidade ABC', '(21) 99876-5432', 'contato@empresaA.com', '98765432000123'),
('Empresa B', 'Rua das Flores, 789, Bairro QWE, Cidade PQR', '(31) 91234-5678', 'contato@empresaB.com', '11223344000176'),
('Empresa C', 'Avenida Brasil, 1011, Bairro ZXC, Cidade LMN', '(41) 92345-6789', 'contato@empresaC.com', '22334455000188');

-- Inserção de situação do motorista
INSERT INTO situacao_motorista (descricao) VALUES
('Ativo'),
('Suspenso'),
('Desativado');

-- Inserção de motoristas
INSERT INTO motorista (nome, cnh, empresa_id, situacao_id) VALUES 
('João Silva', '12345678901', 1, 1),
('Maria Oliveira', '98765432109', 2, 1),
('Pedro Santos', '12312312312', 3, 1);

-- Inserção de concessionárias
INSERT INTO concessionaria (nome, endereco, telefone, email, cnpj) VALUES
('Concessionária Alfa', 'Rua A, 123', '1111-1111', 'contato@alfa.com', '12345678000100'),
('Concessionária Beta', 'Avenida B, 456', '2222-2222', 'contato@beta.com', '22345678000111'),
('Concessionária Gama', 'Praça C, 789', '3333-3333', 'contato@gama.com', '32345678000122');

-- Inserção de veículos
INSERT INTO veiculo (placa, modelo, capacidade_passageiros, capacidade_combustivel, concessionaria_id) VALUES 
('ABC1234', 'Mercedes Sprinter', 50, 100.00, 1),
('DEF5678', 'Marcopolo Volare W9 ON', 60, 120.00, 2),
('GHI9012', 'Marcopolo Volare V8 ON', 40, 80.00, 3);

-- Inserção de rotas
INSERT INTO rota (partida, destino, distancia, custo_operacional) VALUES 
('Barbalho', 'Salvador Shopping', 100.00, 500.00),
('Lapa', 'HGE', 200.00, 700.00),
('Parque São Cristóvão', 'Terminal França', 150.00, 600.00);

-- Inserção de linhas
INSERT INTO linha (rota_id, inicio, fim) VALUES 
(1, '05:00:00', '22:00:00'),
(2, '07:00:00', '23:00:00'),
(3, '06:00:00', '21:30:00');

-- Inserção de passageiros
INSERT INTO passageiro (passageiro_id, nome) VALUES 
(gen_random_uuid(), 'Carlos Almeida'),
(gen_random_uuid(), 'Fernanda Lima'),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null),
(gen_random_uuid(), null);

-- Inserção de tarifas
INSERT INTO tarifa (tipo, preco) VALUES 
('dinheiro', 4.90),
('vale_transporte', 4.90),
('estudante', 2.40),
('maior_idade', 0.00);

-- Inserção de status
INSERT INTO status_viagem (status) VALUES 
('Em andamento'),
('Finalizada'),
('Interrompida');

-- Inserção de viagens
INSERT INTO viagem (linha_id, motorista_id, veiculo_id, inicio, fim, status_id) VALUES 
(1, 1, 1, '2024-12-26 08:00:00', '2024-12-26 12:00:00', 1),
(2, 2, 2, '2024-12-26 13:00:00', '2024-12-26 17:00:00', 2),
(3, 3, 3, '2024-12-26 18:00:00', '2024-12-26 22:00:00', 3),
(1, 2, 1, '2024-12-27 08:30:00', '2024-12-27 12:30:00', 1),
(2, 3, 2, '2024-12-27 13:30:00', '2024-12-27 17:30:00', 2),
(3, 1, 3, '2024-12-27 18:30:00', '2024-12-27 22:30:00', 3),
(1, 3, 1, '2024-12-28 09:00:00', '2024-12-28 13:00:00', 1),
(2, 1, 2, '2024-12-28 14:00:00', '2024-12-28 18:00:00', 2),
(3, 2, 3, '2024-12-28 19:00:00', '2024-12-28 23:00:00', 3),
(1, 1, 1, '2024-12-29 08:00:00', '2024-12-29 12:00:00', 1),
(2, 2, 2, '2024-12-29 13:00:00', '2024-12-29 17:00:00', 2),
(3, 3, 3, '2024-12-29 18:00:00', '2024-12-29 22:00:00', 3),
(1, 2, 1, '2024-12-30 08:30:00', '2024-12-30 12:30:00', 1),
(2, 3, 2, '2024-12-30 13:30:00', '2024-12-30 17:30:00', 2),
(3, 1, 3, '2024-12-30 18:30:00', '2024-12-30 22:30:00', 3),
(1, 3, 1, '2024-12-31 09:00:00', '2024-12-31 13:00:00', 1),
(2, 1, 2, '2024-12-31 14:00:00', '2024-12-31 18:00:00', 2),
(3, 2, 3, '2024-12-31 19:00:00', '2024-12-31 23:00:00', 3),
(1, 1, 1, '2025-01-01 08:00:00', '2025-01-01 12:00:00', 1),
(2, 2, 2, '2025-01-01 13:00:00', '2025-01-01 17:00:00', 2),
(3, 3, 3, '2025-01-01 18:00:00', '2025-01-01 22:00:00', 3);

-- Inserção de passagens
INSERT INTO passagem (tarifa_id, viagem_id, passageiro_id, timestamp) VALUES
(1, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-26 08:05:00'),
(2, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-26 08:10:00'),
(3, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-26 08:15:00'),
(1, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-26 08:20:00'),
(2, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-26 08:25:00'),
(3, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-26 08:30:00'),
(1, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-26 08:35:00'),
(2, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-26 08:40:00'),
(3, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-26 08:45:00'),
(1, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-26 08:50:00'),
(2, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-26 08:55:00'),
(1, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-26 09:00:00'),
(3, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-26 09:05:00'),
(1, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-26 09:10:00'),
(2, 1, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-26 09:15:00'),

(1, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-26 13:05:00'),
(2, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-26 13:10:00'),
(3, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-26 13:15:00'),
(1, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-26 13:20:00'),
(2, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-26 13:25:00'),
(3, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-26 13:30:00'),
(1, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-26 13:35:00'),
(2, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-26 13:40:00'),
(3, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-26 13:45:00'),
(1, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-26 13:50:00'),
(2, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-26 13:55:00'),
(3, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-26 14:00:00'),
(2, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-26 14:05:00'),
(1, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-26 14:10:00'),
(2, 2, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-26 14:15:00'),

(1, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-26 18:05:00'),
(2, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-26 18:10:00'),
(3, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-26 18:15:00'),
(1, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-26 18:20:00'),
(2, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-26 18:25:00'),
(3, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-26 18:30:00'),
(1, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-26 18:35:00'),
(2, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-26 18:40:00'),
(3, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-26 18:45:00'),
(1, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-26 18:50:00'),
(2, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-26 18:55:00'),
(3, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-26 19:00:00'),
(1, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-26 19:05:00'),
(2, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-26 19:10:00'),
(3, 3, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-26 19:15:00'),

(1, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-27 08:35:00'),
(2, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-27 08:40:00'),
(3, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-27 08:45:00'),
(1, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-27 08:50:00'),
(2, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-27 08:55:00'),
(3, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-27 09:00:00'),
(1, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-27 09:05:00'),
(2, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-27 09:10:00'),
(3, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-27 09:15:00'),
(1, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-27 09:20:00'),
(2, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-27 09:25:00'),
(3, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-27 09:30:00'),
(1, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-27 09:35:00'),
(2, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-27 09:40:00'),
(3, 4, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-27 09:45:00'),

(1, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-30 13:05:00'),
(2, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-30 13:10:00'),
(3, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-30 13:15:00'),
(1, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-30 13:20:00'),
(2, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-30 13:25:00'),
(3, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-30 13:30:00'),
(1, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-30 13:35:00'),
(2, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-30 13:40:00'),
(3, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-30 13:45:00'),
(1, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-30 13:50:00'),
(2, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-30 13:55:00'),
(3, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-30 14:00:00'),
(2, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-30 14:05:00'),
(1, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-30 14:10:00'),
(2, 5, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-30 14:15:00'),

(1, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-30 18:05:00'),
(2, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-30 18:10:00'),
(3, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-30 18:15:00'),
(1, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-30 18:20:00'),
(2, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-30 18:25:00'),
(3, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-30 18:30:00'),
(1, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-30 18:35:00'),
(2, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-30 18:40:00'),
(3, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-30 18:45:00'),
(1, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-30 18:50:00'),
(2, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-30 18:55:00'),
(3, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-30 19:00:00'),
(1, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-30 19:05:00'),
(2, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-30 19:10:00'),
(3, 6, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-30 19:15:00'),

(1, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 0), '2024-12-31 09:05:00'),
(2, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 1), '2024-12-31 09:10:00'),
(3, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 2), '2024-12-31 09:15:00'),
(1, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 3), '2024-12-31 09:20:00'),
(2, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 4), '2024-12-31 09:25:00'),
(3, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 5), '2024-12-31 09:30:00'),
(1, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 6), '2024-12-31 09:35:00'),
(2, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 7), '2024-12-31 09:40:00'),
(3, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 8), '2024-12-31 09:45:00'),
(1, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 9), '2024-12-31 09:50:00'),
(2, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 10), '2024-12-31 09:55:00'),
(1, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 11), '2024-12-31 10:00:00'),
(3, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 12), '2024-12-31 10:05:00'),
(1, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 13), '2024-12-31 10:10:00'),
(2, 7, (SELECT passageiro_id FROM passageiro LIMIT 1 OFFSET 14), '2024-12-31 10:15:00');