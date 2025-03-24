use oficina;

/*Quais são os serviços realizados, o nome da mão de obra envolvida e o valor do serviço, 
 apenas para os serviços finalizados que possuem valor superior a 500,00?*/

SELECT a.IdServico, b.Nome AS Mao_de_obra, a.Valor_servico
FROM Servico a
INNER JOIN Mao_de_obra b ON a.IdSMao_de_obra = b.IdMao_de_obra
WHERE a.Status_Servico = 'Finalizado' AND CAST(a.Valor_servico AS DECIMAL(10,2)) > 500.00;


-- Qual é o nome do mecânico e a sua especialidade, ordenados pela especialidade em ordem alfabética?
SELECT M.Nome, M.Especialidade
FROM Mecanicos M
ORDER BY M.Especialidade;


-- Quantos veículos de cada cliente estão associados a um mecânico específico?
SELECT a.Nome AS Cliente, c.Nome AS Mecanico, COUNT(b.IdVeiculos) AS Quantidade_de_Veiculos
FROM Clientes a
INNER JOIN Veiculos b ON a.IdCliente = b.idVCliente
INNER JOIN Mecanicos c ON b.idVMecanico = c.IdMecanico
GROUP BY a.IdCliente, c.IdMecanico;


