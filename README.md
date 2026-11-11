# hotel-nebula

## Breve documentação

O banco de dados **Hotel Nebula** foi desenvolvido para organizar e gerenciar as informações de um hotel, como hóspedes, quartos, reservas, hospedagens, serviços, pagamentos, funcionários e avaliações.

### Estrutura do banco

O banco é composto pelas seguintes tabelas:

- **Hospede:** armazena os dados dos hóspedes, como nome, CPF, telefone, data de nascimento, e-mail e endereço.
- **Quarto:** armazena as informações dos quartos, como número, tipo, capacidade, valor da diária e situação.
- **Reserva:** registra as reservas realizadas, relacionando o hóspede ao quarto.
- **Hospedagem:** registra a hospedagem vinculada a uma reserva, incluindo as datas de check-in e check-out.
- **Servico:** armazena os serviços extras oferecidos pelo hotel.
- **servicoHospedagem:** relaciona os serviços utilizados com cada hospedagem, registrando a quantidade e o valor.
- **Pagamento:** registra os pagamentos realizados para cada hospedagem.
- **Feedback:** armazena as avaliações realizadas pelos hóspedes após a hospedagem.
- **Funcionario:** armazena os dados dos funcionários do hotel.
- **HospedagemFuncionario:** relaciona os funcionários às hospedagens em que atuaram.

### Relacionamentos

As tabelas são relacionadas por meio de chaves estrangeiras. Um hóspede pode realizar várias reservas, e cada reserva está relacionada a um quarto. Uma reserva pode gerar uma hospedagem, que pode possuir pagamentos, serviços utilizados, funcionários envolvidos e feedbacks.

A tabela **servicoHospedagem** é utilizada para relacionar hospedagens e serviços, enquanto **HospedagemFuncionario** relaciona hospedagens e funcionários.

A estrutura foi criada para manter os dados organizados e permitir consultas sobre reservas, hospedagens, pagamentos, serviços, avaliações e funcionários.