
/*
TRUNCATE TABLE public.usuario; 
TRUNCATE TABLE public.transacao;
TRUNCATE TABLE public.historico_pagamento;
TRUNCATE TABLE public.cadastro;
TRUNCATE TABLE public.saldo
TRUNCATE TABLE public.cartao ;
TRUNCATE TABLE public.conta_bancaria;
TRUNCATE TABLE public.usuario_carteira;
*/
-- Inserir 15 registros de exemplo na tabela usuario
INSERT INTO public.usuario (apelido, email, senha, pergunta_seguranca, sexo)
VALUES
    ('usuario1', 'usuario1@example.com', 'senha1', 'Pergunta 1', 'Masculino'),
    ('usuario2', 'usuario2@example.com', 'senha2', 'Pergunta 2', 'Feminino'),
    ('usuario3', 'usuario3@example.com', 'senha3', 'Pergunta 3', 'Masculino'),
    ('usuario4', 'usuario4@example.com', 'senha4', 'Pergunta 4', 'Feminino'),
    ('usuario5', 'usuario5@example.com', 'senha5', 'Pergunta 5', 'Outro'),
    ('usuario6', 'usuario6@example.com', 'senha6', 'Pergunta 6', 'Masculino'),
    ('usuario7', 'usuario7@example.com', 'senha7', 'Pergunta 7', 'Feminino'),
    ('usuario8', 'usuario8@example.com', 'senha8', 'Pergunta 8', 'Masculino'),
    ('usuario9', 'usuario9@example.com', 'senha9', 'Pergunta 9', 'Feminino'),
    ('usuario10', 'usuario10@example.com', 'senha10', 'Pergunta 10', 'Outro'),
    ('usuario11', 'usuario11@example.com', 'senha11', 'Pergunta 11', 'Masculino'),
    ('usuario12', 'usuario12@example.com', 'senha12', 'Pergunta 12', 'Feminino'),
    ('usuario13', 'usuario13@example.com', 'senha13', 'Pergunta 13', 'Masculino'),
    ('usuario14', 'usuario14@example.com', 'senha14', 'Pergunta 14', 'Feminino'),
    ('usuario15', 'usuario15@example.com', 'senha15', 'Pergunta 15', 'Outro');

-- Inserir 15 registros de exemplo na tabela transacao
INSERT INTO public.transacao (id_remetente, id_destinatario, valor, last_update, status, metodo_pagamento)
VALUES
    (1, 2, 100.0000, '2023-11-08 10:30:00', 'Concluída', 'Cartão de Crédito'),
    (2, 3, 50.5000, '2023-11-08 11:45:00', 'Pendente', 'Transferência Bancária'),
    (3, 1, 75.2500, '2023-11-08 13:15:00', 'Concluída', 'PayPal'),
    (2, 4, 200.7500, '2023-11-08 14:30:00', 'Concluída', 'Cartão de Débito'),
    (1, 5, 60.0000, '2023-11-08 15:45:00', 'Pendente', 'Transferência Bancária'),
    (4, 3, 30.2500, '2023-11-08 17:00:00', 'Concluída', 'PayPal'),
    (5, 1, 150.5000, '2023-11-08 18:15:00', 'Pendente', 'Cartão de Crédito'),
    (3, 2, 90.7500, '2023-11-08 19:30:00', 'Concluída', 'Transferência Bancária'),
    (2, 5, 40.0000, '2023-11-08 20:45:00', 'Concluída', 'PayPal'),
    (4, 1, 25.2500, '2023-11-08 22:00:00', 'Pendente', 'Cartão de Débito'),
    (5, 3, 110.7500, '2023-11-08 23:15:00', 'Concluída', 'Transferência Bancária'),
    (1, 4, 75.0000, '2023-11-09 09:30:00', 'Concluída', 'PayPal'),
    (4, 2, 55.2500, '2023-11-09 10:45:00', 'Pendente', 'Cartão de Crédito'),
    (3, 5, 120.7500, '2023-11-09 12:00:00', 'Concluída', 'Transferência Bancária'),
    (5, 2, 35.0000, '2023-11-09 13:15:00', 'Concluída', 'PayPal');

-- Inserir 15 registros de exemplo na tabela historico_pagamento
INSERT INTO public.historico_pagamento (id_usuario, id_transacao, tipo_transacao, descricao, autenticacao)
VALUES
    (1, 1, 'Compra', 'Compra de produto A', 'AutenticaçãoA1'),
    (2, 2, 'Depósito', 'Depósito de fundos', 'AutenticaçãoB2'),
    (3, 3, 'Transferência', 'Transferência para usuário 4', 'AutenticaçãoC3'),
    (4, 4, 'Compra', 'Compra de produto B', 'AutenticaçãoD4'),
    (5, 5, 'Depósito', 'Depósito de fundos', 'AutenticaçãoE5'),
    (1, 6, 'Transferência', 'Transferência para usuário 2', 'AutenticaçãoA6'),
    (2, 7, 'Compra', 'Compra de produto C', 'AutenticaçãoB7'),
    (3, 8, 'Depósito', 'Depósito de fundos', 'AutenticaçãoC8'),
    (4, 9, 'Transferência', 'Transferência para usuário 5', 'AutenticaçãoD9'),
    (5, 10, 'Compra', 'Compra de produto D', 'AutenticaçãoE10'),
    (1, 11, 'Depósito', 'Depósito de fundos', 'AutenticaçãoA11'),
    (2, 12, 'Transferência', 'Transferência para usuário 3', 'AutenticaçãoB12'),
    (3, 13, 'Compra', 'Compra de produto E', 'AutenticaçãoC13'),
    (4, 14, 'Depósito', 'Depósito de fundos', 'AutenticaçãoD14'),
    (5, 15, 'Transferência', 'Transferência para usuário 1', 'AutenticaçãoE15');

-- Inserir 15 registros de exemplo na tabela cadastro
INSERT INTO public.cadastro (id_usuario, nome_completo, data_nascimento, telefone, cpf)
VALUES
    (1, 'João Silva', '1990-05-15', 6939952091, 16414230057),
    (2, 'Maria Santos', '1985-03-20', 69994032330, 75646039096),
    (3, 'Pedro Alves', '1992-08-10', 9238374306, 27461217003),
    (4, 'Ana Pereira', '1988-12-25', 92991335315, 21982547006),
    (5, 'Carlos Rodrigues', '1995-07-03', 6935572541, 33960270003),
    (6, 'Mariana Souza', '1991-04-18', 69997629820, 94196698077),
    (7, 'Ricardo Gomes', '1987-09-05', 9628581273, 41216260010),
    (8, 'Isabel Ribeiro', '1993-06-12', 96983010583, 91942957009),
    (9, 'Luís Costa', '1994-02-08', 9628581273, 42009954092),
    (10, 'Sofia Fernandes', '1989-10-30', 96983010583, 72418065065),
    (11, 'Eduardo Oliveira', '1996-01-07', NULL, 43544906090),
    (12, 'Clara Sousa', '1997-03-14', 4729943649, 78524535032),
    (13, 'Gustavo Santos', '1990-07-29', 7939925422, 00108008088),
    (14, 'Julia Ferreira', '1986-11-11', 92993421452, 10057343055),
    (15, 'Miguel Almeida', '1984-04-02', 84993247965, 16645090030);

-- Inserir 15 registros de exemplo na tabela saldo
INSERT INTO public.saldo (id_usuario, saldo, last_update, cheque_especial, moeda)
VALUES
    (1, 1000.0000, '2023-11-08 10:00:00', 500.0000, 'Real'),
    (2, 1500.5000, '2023-11-08 11:00:00', NULL, 'Dólar'),
    (3, 200.7500, '2023-11-08 12:00:00', 100.0000, 'Euro'),
    (4, 750.2500, '2023-11-08 13:00:00', 300.0000, 'Real'),
    (5, 3000.0000, '2023-11-08 14:00:00', 1000.0000, 'Dólar'),
    (6, 450.5000, '2023-11-08 15:00:00', 200.0000, 'Euro'),
    (7, 600.7500, '2023-11-08 16:00:00', 400.0000, 'Real'),
    (8, 800.2500, '2023-11-08 17:00:00', NULL, 'Dólar'),
    (9, 1200.0000, '2023-11-08 18:00:00', 600.0000, 'Euro'),
    (10, 100.5000, '2023-11-08 19:00:00', 50.0000, 'Real'),
    (11, 250.7500, '2023-11-08 20:00:00', 100.0000, 'Dólar'),
    (12, 90.2500, '2023-11-08 21:00:00', NULL, 'Euro'),
    (13, 1800.0000, '2023-11-08 22:00:00', 900.0000, 'Real'),
    (14, 3000.5000, '2023-11-08 23:00:00', 1500.0000, 'Dólar'),
    (15, 240.7500, '2023-11-09 09:00:00', 120.0000, 'Euro');

-- Inserir 15 registros de exemplo na tabela cartao
INSERT INTO public.cartao (metodo_pagamento, endereco_cobranca, numero, validade, cvc)
VALUES
    ('Cartão de Crédito', 'Rua Exemplo, 123', 5299600587506235, '2024-12-31', 123),
    ('Cartão de Débito', 'Avenida Teste, 456', 5460507782356154, '2023-11-30', 456),
    ('Cartão de Crédito', 'Praça Amostra, 789', 5078977537391851, '2025-05-31', 789),
    ('Cartão de Débito', 'Rua Qualquer, 321', 3537959416663576, '2023-09-30', 321),
    ('Cartão de Crédito', 'Avenida Principal, 111', 5347847969087274, '2026-07-31', 111),
    ('Cartão de Débito', 'Rua Secundária, 222', 4233700596891826, '2024-02-28', 222),
    ('Cartão de Crédito', 'Avenida de Teste, 999', 30124359338698, '2025-10-31', 999),
    ('Cartão de Débito', 'Rua do Exemplo, 666', 5359512541847638, '2024-04-30', 666),
    ('Cartão de Crédito', 'Avenida Exemplo, 777', 5509632747440316, '2025-09-30', 777),
    ('Cartão de Débito', 'Rua Amostra, 555', 5211318101301000, '2023-06-30', 555),
    ('Cartão de Crédito', 'Praça de Teste, 111', 30251573724898, '2026-12-31', 111),
    ('Cartão de Débito', 'Rua Qualquer, 789', 6062828426183519, '2023-08-31', 789),
    ('Cartão de Crédito', 'Avenida Amostra, 333', 5062769488176052, '2027-03-31', 333),
    ('Cartão de Débito', 'Rua Principal, 777', 214924931614476, '2024-01-31', 777),
    ('Cartão de Crédito', 'Avenida do Exemplo, 444', 3559632818333196, '2025-11-30', 444);
    
    -- Inserir 15 registros de exemplo na tabela conta_bancaria
INSERT INTO public.conta_bancaria (id_usuario, apelido, nome_banco, agencia, conta)
VALUES
    (1, 'Conta Pessoal', 'Banco A', 3514, 5678901),
    (2, 'Conta Poupança', 'Banco B', 5313, 1234567),
    (3, 'Conta de Salário', 'Banco C', 8432, 9876543),
    (4, 'Conta Corrente', 'Banco D', 5465, 3456789),
    (5, 'Conta Universitária', 'Banco E', 5141, 1586543),
    (1, 'Conta Extra', 'Banco F', 6513, 1234859),
    (2, 'Conta de Emergência', 'Banco G', 5432, 4896219),
    (3, 'Conta de Investimento', 'Banco H', 2135, 7624931),
    (4, 'Conta de Negócios', 'Banco I', 6513, 9768241),
    (5, 'Conta Conjunta', 'Banco J', 3454, 9673824),
    (1, 'Conta de Viagem', 'Banco K', 8463, 7381694),
    (2, 'Conta de Reserva', 'Banco L', 5463, 2869746),
    (3, 'Conta de Aposentadoria', 'Banco M', 8888, 3697582),
    (4, 'Conta de Impostos', 'Banco N', 6846, 3647582),
    (5, 'Conta de Férias', 'Banco O', 4736, 9574158);

    -- Inserir 15 registros de exemplo na tabela usuario_carteira
INSERT INTO public.usuario_carteira (id_cartao, id_conta, id_usuario, descricao, last_update)
VALUES
    (1, 1, 1, 'Descrição 1', NOW()),
    (2, 2, 2, 'Descrição 2', NOW()),
    (3, 3, 3, 'Descrição 3', NOW()),
    (4, 4, 4, 'Descrição 4', NOW()),
    (5, 5, 5, 'Descrição 5', NOW()),
    (6, 6, 6, 'Descrição 6', NOW()),
    (7, 7, 7, 'Descrição 7', NOW()),
    (8, 8, 8, 'Descrição 8', NOW()),
    (9, 9, 9, 'Descrição 9', NOW()),
    (10, 10, 10, 'Descrição 10', NOW()),
    (11, 11, 11, 'Descrição 11', NOW()),
    (12, 12, 12, 'Descrição 12', NOW()),
    (13, 13, 13, 'Descrição 13', NOW()),
    (14, 14, 14, 'Descrição 14', NOW()),
    (15, 15, 15, 'Descrição 15', NOW())
	


