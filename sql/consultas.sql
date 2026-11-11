USE hotelNebula;

-- Quais quartos estão disponíveis em determinado período?
SELECT q.* FROM Quarto q WHERE q.idQuarto NOT IN (SELECT r.idQuarto FROM Reserva r WHERE r.situacaoReserva IN ('Confirmada', 'Hospedado'));

-- Quais hóspedes mais realizaram reservas?
SELECT h.nomeHospede, COUNT(r.idReserva) AS totalReservas FROM Hospede h JOIN Reserva r ON h.idHospede = r.idHospede 
GROUP BY h.idHospede, h.nomeHospede ORDER BY totalReservas DESC;

-- Qual foi o faturamento por mês?
SELECT YEAR(p.dtPgto) AS ano, MONTH(p.dtPgto) AS mes, SUM(p.valorPgto) AS faturamento FROM Pagamento p 
WHERE p.situacaoPgto = 'Pago' GROUP BY YEAR(p.dtPgto), MONTH(p.dtPgto) ORDER BY ano, mes;

-- Quais serviços extras são mais consumidos?
SELECT s.nomeServico, SUM(sh.qtd) AS quantidadeUtilizada FROM Servico s JOIN servicoHospedagem sh ON s.idServico = sh.idServico 
GROUP BY s.idServico, s.nomeServico ORDER BY quantidadeUtilizada DESC;

-- Quais quartos receberam melhores avaliações?
SELECT q.numeroQuarto, AVG(f.notaFeedback) AS mediaAvaliacao FROM Quarto q JOIN Reserva r ON q.idQuarto = r.idQuarto JOIN Hospedagem h ON r.idReserva = h.idReserva 
JOIN Feedback f ON h.idHospedagem = f.idHospedagem GROUP BY q.idQuarto, q.numeroQuarto ORDER BY mediaAvaliacao DESC;

-- Quais reservas foram canceladas?
SELECT r.idReserva, h.nomeHospede, q.numeroQuarto, r.dtReserva FROM Reserva r JOIN Hospede h ON r.idHospede = h.idHospede 
JOIN Quarto q ON r.idQuarto = q.idQuarto WHERE r.situacaoReserva = 'Cancelada';

-- Quantas hospedagens cada profissional atendeu?
SELECT f.nomeFuncionario, f.cargo, COUNT(hf.idHospedagem) AS totalHospedagens FROM Funcionario f LEFT JOIN HospedagemFuncionario hf 
ON f.idFuncionario = hf.idFuncionario GROUP BY f.idFuncionario, f.nomeFuncionario, f.cargo ORDER BY totalHospedagens DESC;