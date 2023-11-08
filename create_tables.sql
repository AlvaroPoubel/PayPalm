-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.usuario
(
    id_usuario serial NOT NULL,
    apelido character varying(99) NOT NULL,
    email character varying(155) NOT NULL,
    senha character varying(155) NOT NULL,
    pergunta_seguranca character varying(255) NOT NULL,
    sexo character varying(25) NOT NULL,
    PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS public.transacao
(
    id_transacao serial NOT NULL,
    id_remetente bigint NOT NULL,
    id_destinatario bigint NOT NULL,
    valor numeric(10, 4) NOT NULL,
    last_update timestamp with time zone NOT NULL,
    status character varying(25) NOT NULL,
    metodo_pagamento character varying NOT NULL,
    PRIMARY KEY (id_transacao)
);

CREATE TABLE IF NOT EXISTS public.historico_pagamento
(
    id_historico serial NOT NULL,
    id_usuario bigint NOT NULL,
    id_transacao bigint NOT NULL,
    tipo_transacao character varying(55) NOT NULL,
    descricao character varying(255),
    autenticacao character varying(155) NOT NULL,
    PRIMARY KEY (id_historico)
);

CREATE TABLE IF NOT EXISTS public.cadastro
(
    id_cadastro serial NOT NULL,
    id_usuario bigint NOT NULL,
    nome_completo character varying(255) NOT NULL,
    data_nascimento date NOT NULL,
    telefone bigint,
    cpf bigint NOT NULL,
    PRIMARY KEY (id_cadastro)
);

CREATE TABLE IF NOT EXISTS public.saldo
(
    id_saldo serial NOT NULL,
    id_usuario integer NOT NULL,
    saldo numeric(10, 4) NOT NULL,
    last_update timestamp without time zone NOT NULL,
    cheque_especial bigint,
    moeda character varying(55) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.cartao
(
    " id_cartao" serial NOT NULL,
    metodo_pagamento character varying(25) NOT NULL,
    endereco_cobranca character varying(155) NOT NULL,
    numero bigint NOT NULL,
    validade date NOT NULL,
    cvc integer NOT NULL,
    PRIMARY KEY (" id_cartao")
);

CREATE TABLE IF NOT EXISTS public.usuario_carteira
(
    id serial NOT NULL,
    id_cartao bigint NOT NULL,
    id_conta bigint NOT NULL,
    id_usuario bigint NOT NULL,
    descricao character varying(155),
    last_update timestamp without time zone NOT NULL,
    PRIMARY KEY (id_cartao)
);

CREATE TABLE IF NOT EXISTS public.conta_bancaria
(
    id_conta serial NOT NULL,
    id_usuario integer NOT NULL,
    apelido character varying(55),
    nome_banco character varying(55) NOT NULL,
    agencia integer NOT NULL,
    conta integer NOT NULL,
    PRIMARY KEY (id_conta)
);

ALTER TABLE IF EXISTS public.transacao
    ADD CONSTRAINT remetente FOREIGN KEY (id_remetente)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.transacao
    ADD CONSTRAINT destinatario FOREIGN KEY (id_destinatario)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.historico_pagamento
    ADD CONSTRAINT usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.historico_pagamento
    ADD CONSTRAINT transacao FOREIGN KEY (id_transacao)
    REFERENCES public.transacao (id_transacao) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.cadastro
    ADD CONSTRAINT usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.saldo
    ADD CONSTRAINT usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.usuario_carteira
    ADD CONSTRAINT cartao FOREIGN KEY (id_cartao)
    REFERENCES public.cartao (" id_cartao") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.usuario_carteira
    ADD CONSTRAINT conta FOREIGN KEY (id_conta)
    REFERENCES public.conta_bancaria (id_conta) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.usuario_carteira
    ADD CONSTRAINT usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.conta_bancaria
    ADD CONSTRAINT usuario FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id_usuario) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;



-- Função para realizar transação
CREATE OR REPLACE FUNCTION realizar_transacao(
    remetente_id_usuario INT,
    destinatario_id_usuario INT,
    valor_transferencia NUMERIC
) RETURNS VOID AS $$

DECLARE
    saldo_remetente NUMERIC;
    saldo_destinatario NUMERIC;
BEGIN
    -- Iniciar a transação
  
    
    -- Obter os saldos atuais do remetente e destinatário
    SELECT saldo INTO saldo_remetente FROM saldo WHERE id_usuario = remetente_id_usuario FOR UPDATE;
    SELECT saldo INTO saldo_destinatario FROM saldo WHERE id_usuario = destinatario_id_usuario FOR UPDATE;

    -- Verificar se o remetente tem saldo suficiente
    IF saldo_remetente >= valor_transferencia THEN
        -- Atualizar os saldos
        UPDATE saldo SET saldo = saldo - valor_transferencia WHERE id_usuario = remetente_id_usuario;
        UPDATE saldo SET saldo = saldo + valor_transferencia WHERE id_usuario = destinatario_id_usuario;

        -- Registrar a transação na tabela 'transacao'
        INSERT INTO transacao (id_remetente, id_destinatario, valor, last_update, status, metodo_pagamento)
        VALUES (remetente_id_usuario, destinatario_id_usuario, valor_transferencia, NOW(), 'Concluída', 'Transferência');
        
       
  
    END IF;
END;
$$ LANGUAGE plpgsql;
