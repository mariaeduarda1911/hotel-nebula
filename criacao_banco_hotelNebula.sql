CREATE DATABASE hotelNebula;
USE hotelNebula;

CREATE TABLE IF NOT EXISTS `Quarto` (
	`idQuarto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`numeroQuarto` varchar(5) NOT NULL UNIQUE,
	`tipoQuarto` varchar(80) NOT NULL,
	`capacidadeQuarto` int NOT NULL,
	`valorDiaria` decimal(10,0) NOT NULL,
	`situacao` varchar(255) NOT NULL,
	PRIMARY KEY (`idQuarto`)
);

CREATE TABLE IF NOT EXISTS `Hospede` (
	`idHospede` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeHospede` varchar(150) NOT NULL,
	`cpf` varchar(11) NOT NULL UNIQUE,
	`telefoneHospede` varchar(11) NOT NULL,
	`dtNasc` date NOT NULL,
	`email` varchar(180) NOT NULL UNIQUE,
	`enderecoHospede` varchar(255) NOT NULL,
	PRIMARY KEY (`idHospede`)
);

CREATE TABLE IF NOT EXISTS `Reserva` (
	`idReserva` int AUTO_INCREMENT NOT NULL UNIQUE,
	`idHospede` int NOT NULL,
	`idQuarto` int NOT NULL,
	`situacaoReserva` varchar(255) NOT NULL,
	`dtReserva` datetime NOT NULL,
	PRIMARY KEY (`idReserva`)
);

CREATE TABLE IF NOT EXISTS `Hospedagem` (
	`idHospedagem` int AUTO_INCREMENT NOT NULL UNIQUE,
	`idReserva` int NOT NULL,
	`checkin` datetime NOT NULL,
	`checkout` datetime NOT NULL,
	`obs` varchar(300) NOT NULL,
	PRIMARY KEY (`idHospedagem`)
);

CREATE TABLE IF NOT EXISTS `Servico` (
	`idServico` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeServico` varchar(50) NOT NULL,
	`descricaoServico` varchar(500) NOT NULL,
	`valorServico` decimal(10,0) NOT NULL,
	`situacaoServico` varchar(255) NOT NULL,
	PRIMARY KEY (`idServico`)
);

CREATE TABLE IF NOT EXISTS `servicoHospedagem` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`idHospedagem` int NOT NULL,
	`idServico` int NOT NULL,
	`qtd` int NOT NULL,
	`valor` decimal(10,0) NOT NULL,
	`dtServicoHospedagem` datetime NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `Pagamento` (
	`idPgto` int AUTO_INCREMENT NOT NULL UNIQUE,
	`idHospedagem` int NOT NULL,
	`valorPgto` decimal(10,0) NOT NULL,
	`metodoPgto` varchar(255) NOT NULL,
	`situacaoPgto` varchar(255) NOT NULL,
	`dtPgto` datetime NOT NULL,
	PRIMARY KEY (`idPgto`)
);

CREATE TABLE IF NOT EXISTS `Feedback` (
	`idFeedback` int AUTO_INCREMENT NOT NULL UNIQUE,
	`idHospedagem` int NOT NULL,
	`notaFeedback` int NOT NULL,
	`descricaoFeedback` varchar(500) NOT NULL,
	`dtFeedback` datetime NOT NULL,
	PRIMARY KEY (`idFeedback`)
);

CREATE TABLE IF NOT EXISTS `HospedagemFuncionario` (
	`idHospedagemFuncionario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`idHospedagem` int NOT NULL,
	`idFuncionario` int NOT NULL,
	`funcaoFuncionario` int NOT NULL,
	`dtFuncao` datetime NOT NULL,
	PRIMARY KEY (`idHospedagemFuncionario`)
);

CREATE TABLE IF NOT EXISTS `Funcionario` (
	`idFuncionario` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nomeFuncionario` varchar(150) NOT NULL,
	`cargo` varchar(80) NOT NULL,
	`emailFuncionario` varchar(200) NOT NULL,
	`telefoneFuncionario` varchar(11) NOT NULL,
	PRIMARY KEY (`idFuncionario`)
);

ALTER TABLE `Reserva` ADD CONSTRAINT `Reserva_fk1` FOREIGN KEY (`idHospede`) REFERENCES `Hospede`(`idHospede`);
ALTER TABLE `Reserva` ADD CONSTRAINT `Reserva_fk2` FOREIGN KEY (`idQuarto`) REFERENCES `Quarto`(`idQuarto`);
ALTER TABLE `Hospedagem` ADD CONSTRAINT `Hospedagem_fk1` FOREIGN KEY (`idReserva`) REFERENCES `Reserva`(`idReserva`);
ALTER TABLE `servicoHospedagem` ADD CONSTRAINT `servicoHospedagem_fk1` FOREIGN KEY (`idHospedagem`) REFERENCES `Hospedagem`(`idHospedagem`);
ALTER TABLE `servicoHospedagem` ADD CONSTRAINT `servicoHospedagem_fk2` FOREIGN KEY (`idServico`) REFERENCES `Servico`(`idServico`);
ALTER TABLE `Pagamento` ADD CONSTRAINT `Pagamento_fk1` FOREIGN KEY (`idHospedagem`) REFERENCES `Hospedagem`(`idHospedagem`);
ALTER TABLE `Feedback` ADD CONSTRAINT `Feedback_fk1` FOREIGN KEY (`idHospedagem`) REFERENCES `Hospedagem`(`idHospedagem`);
ALTER TABLE `HospedagemFuncionario` ADD CONSTRAINT `HospedagemFuncionario_fk1` FOREIGN KEY (`idHospedagem`) REFERENCES `Hospedagem`(`idHospedagem`);
ALTER TABLE `HospedagemFuncionario` ADD CONSTRAINT `HospedagemFuncionario_fk2` FOREIGN KEY (`idFuncionario`) REFERENCES `Funcionario`(`idFuncionario`);