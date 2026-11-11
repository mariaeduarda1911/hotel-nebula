USE hotelNebula;

INSERT INTO Hospede
(nomeHospede, cpf, telefoneHospede, dtNasc, email, enderecoHospede)
VALUES
('Maria Eduarda Oliveira', '123.456.789-01', '(11) 98888-1111', '2005-04-15', 'maria@email.com', 'São Paulo - SP'),
('João Pedro Santos', '234.567.890-12', '(11) 97777-2222', '1998-08-20', 'joao@email.com', 'Campinas - SP'),
('Ana Clara Souza', '345.678.901-23', '(11) 96666-3333', '1995-02-10', 'ana@email.com', 'Santos - SP'),
('Lucas Almeida', '456.789.012-34', '(11) 95555-4444', '2000-11-05', 'lucas@email.com', 'Jundiaí - SP');


INSERT INTO Quarto
(numeroQuarto, tipoQuarto, capacidadeQuarto, valorDiaria, situacao)
VALUES
('101', 'Standard', 2, 250.00, 'Disponível'),
('102', 'Standard', 2, 250.00, 'Ocupado'),
('201', 'Luxo', 3, 450.00, 'Disponível'),
('202', 'Luxo', 4, 550.00, 'Ocupado'),
('301', 'Suíte', 2, 700.00, 'Disponível');

INSERT INTO Funcionario
(nomeFuncionario, cargo, emailFuncionario, telefoneFuncionario)
VALUES
('Carlos Mendes', 'Recepcionista', 'carlos@nebula.com', '11944441111'),
('Juliana Costa', 'Gerente', 'juliana@nebula.com', '11933332222'),
('Rafael Lima', 'Camareiro', 'rafael@nebula.com', '11922223333'),
('Beatriz Martins', 'Recepcionista', 'beatriz@nebula.com', '11911114444');

INSERT INTO Reserva
(idHospede, idQuarto, situacaoReserva, dtReserva)
VALUES
(1, 1, 'Confirmada', '2026-11-01 10:30:00'),
(2, 2, 'Confirmada', '2026-11-02 14:20:00'),
(3, 3, 'Cancelada', '2026-11-03 09:15:00'),
(4, 4, 'Confirmada', '2026-11-04 16:40:00'),
(1, 5, 'Confirmada', '2026-11-05 11:00:00');

INSERT INTO Hospedagem
(idReserva, checkin, checkout, obs)
VALUES
(1, '2026-11-10 14:00:00', '2026-11-13 12:00:00',
 'Hospedagem sem observações'),
(2, '2026-11-08 15:00:00', '2026-11-11 11:00:00',
 'Hóspede solicitou quarto silencioso'),
(4, '2026-11-09 14:30:00', '2026-11-12 12:00:00',
 'Check-in realizado normalmente'),
(5, '2026-11-15 14:00:00', '2026-11-18 12:00:00',
 'Solicitou café da manhã');

INSERT INTO Servico
(nomeServico, descricaoServico, valorServico, situacaoServico)
VALUES
('Café da manhã', 'Café da manhã completo', 45, 'Ativo'),
('Lavanderia', 'Serviço de lavagem de roupas', 30, 'Ativo'),
('Estacionamento', 'Vaga de estacionamento por diária', 25, 'Ativo'),
('Spa', 'Acesso ao serviço de spa', 120, 'Ativo');

INSERT INTO servicoHospedagem
(idHospedagem, idServico, qtd, valor, dtServicoHospedagem)
VALUES
(1, 1, 3, 135, '2026-11-10 08:00:00'),
(1, 3, 3, 75, '2026-11-10 14:30:00'),
(2, 1, 3, 135, '2026-11-08 08:00:00'),
(3, 4, 1, 120, '2026-11-10 16:00:00'),
(4, 1, 3, 135, '2026-11-15 08:00:00');

INSERT INTO Pagamento
(idHospedagem, valorPgto, metodoPgto, situacaoPgto, dtPgto)
VALUES
(1, 750, 'Cartão de crédito', 'Pago', '2026-11-10 14:10:00'),
(2, 750, 'Pix', 'Pago', '2026-11-08 15:10:00'),
(3, 1650, 'Cartão de débito', 'Pago', '2026-11-09 14:40:00'),
(4, 2100, 'Cartão de crédito', 'Pendente', '2026-11-15 14:10:00');

INSERT INTO HospedagemFuncionario
(idHospedagem, idFuncionario, funcaoFuncionario, dtFuncao)
VALUES
(1, 1, 1, '2026-11-10 14:00:00'),
(1, 3, 2, '2026-11-11 10:00:00'),
(2, 1, 1, '2026-11-08 15:00:00'),
(3, 2, 3, '2026-11-09 15:00:00'),
(4, 4, 1, '2026-11-15 14:00:00');

INSERT INTO Feedback
(idHospedagem, notaFeedback, descricaoFeedback, dtFeedback)
VALUES
(1, 5, 'Quarto confortável e atendimento excelente.', '2026-11-13 13:00:00'),
(2, 4, 'Boa hospedagem, mas o quarto poderia ser mais silencioso.', '2026-11-11 13:00:00'),
(3, 5, 'Ótimo quarto e excelente atendimento.', '2026-11-12 13:30:00');