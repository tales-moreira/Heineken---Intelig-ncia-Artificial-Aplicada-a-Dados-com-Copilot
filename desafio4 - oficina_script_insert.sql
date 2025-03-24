use Oficina;

-- Inserir dados na tabela Clientes
INSERT INTO Clientes (Nome, CPF, Endereco, Telefone, Email)
VALUES
('João Silva', '12345678901', 'Rua A, 123, Centro', '11987654321', 'joao@exemplo.com'),
('Maria Oliveira', '98765432100', 'Avenida B, 456, Bairro Novo', '11987654322', 'maria@exemplo.com'),
('Carlos Souza', '11223344556', 'Rua C, 789, Vila Verde', '11987654323', 'carlos@exemplo.com');

-- Inserir dados na tabela Mecanicos
INSERT INTO Mecanicos (Nome, Endereço, Especialidade)
VALUES
('Pedro Santos', 'Rua X, 101, Centro', 'Manutenção de veículos leves'),
('Ana Costa', 'Rua Y, 202, Bairro Novo', 'Funilaria e pintura'),
('Roberto Pereira', 'Avenida Z, 303, Vila Verde', 'Mecatrônica automotiva');

-- Inserir dados na tabela Veiculos
INSERT INTO Veiculos (idVCliente, idVMecanico, Modelo, Marca, Placa)
VALUES
(1, 1, 'Fusca', 'Volkswagen', 'ABC1234'),
(2, 2, 'Civic', 'Honda', 'XYZ5678'),
(3, 3, 'Mustang', 'Ford', 'LMN9012');

-- Inserir dados na tabela Mao_de_obra
INSERT INTO Mao_de_obra (Nome, Valor)
VALUES
('Troca de óleo', '200.00'),
('Troca de amortecedor', '300.00'),
('Reparo de motor', '500.00');

-- Inserir dados na tabela Pecas
INSERT INTO Pecas (Nome, valor_total_pecas, Quantidade)
VALUES
('Óleo sintético', '50.00', '10'),
('Amortecedor', '150.00', '5'),
('Kit de reparo de motor', '400.00', '3');

-- Inserir dados na tabela Servico
INSERT INTO Servico (IdSMao_de_obra,IdSPecas,IdSVeiculo,Status_Servico, Data_emissao, Data_entrega, Valor_servico)
VALUES
(1,2,1,'Em execução', '2025-03-20', '2025-03-25', '250.00'),
(2,3,2,'Aguardando equipe', '2025-03-22', '2025-03-30', '500.00'),
(3,1,3,'Finalizado', '2025-03-18', '2025-03-23', '800.00');

-- Inserir dados na tabela Equipe
INSERT INTO Equipe (IdEMecanico,
IdEMao_de_obra,Nome)
VALUES
(1,2,'Equipe de Manutenção Leve'),
(2,1,'Equipe de Funilaria'),
(3,2,'Equipe de Mecatrônica');

-- Inserir dados na tabela Estoque
INSERT INTO Estoque (IdEPecas,Data_aquisicao, CustoAquisicao)
VALUES
(2,'2025-03-15', '40.00'),
(1,'2025-03-10', '120.00'),
(3,'2025-03-12', '350.00');
