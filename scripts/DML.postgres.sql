/*

  A seguinte estrutura foi criada e testada em ambiente local em banco de dados POSTGRESQL
  Também foram realizados testes utilizando a API HTML: WebSQL*

  Esta é uma versão revisada e estável


  * a API HTML: WebSQL não fornece suporte total para todas as operações, como por exemplo: "CREATE SEQUENCE"
    Ainda não foi verificado a compatibilidade com Triggers

*/

---------------- { Sequences } -------------------
CREATE SEQUENCE seq_tipopessoa_id         START 1;
CREATE SEQUENCE seq_tipologradouro_codigo START 1;
CREATE SEQUENCE seq_logradouro_id         START 1;
CREATE SEQUENCE seq_moeda_codigo          START 1;
CREATE SEQUENCE seq_nacao_codigo          START 1;
CREATE SEQUENCE seq_categoria_id          START 1;
CREATE SEQUENCE seq_tipotitulo_id         START 1;
CREATE SEQUENCE seq_estado_id             START 1;
CREATE SEQUENCE seq_cidade_id             START 1;
CREATE SEQUENCE seq_nivelacesso_id        START 1;
CREATE SEQUENCE seq_usuario_id            START 1;
CREATE SEQUENCE seq_codigoacesso_id       START 1;
CREATE SEQUENCE seq_endereco_id           START 1;
CREATE SEQUENCE seq_titulo_id             START 1;
CREATE SEQUENCE seq_parcela_id            START 1;
CREATE SEQUENCE seq_cambio_codigo         START 1;
CREATE SEQUENCE seq_tipocaixa_id          START 1;
CREATE SEQUENCE seq_caixa_codigo          START 1;
CREATE SEQUENCE seq_operacaocaixa_id      START 1;
CREATE SEQUENCE seq_extrato_codigo        START 1;
CREATE SEQUENCE seq_cobranca_codigo       START 1;
CREATE SEQUENCE seq_notificacao_codigo    START 1;

---------------- { Tables } -----------------------------------------------------
CREATE TABLE TipoPessoa (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_tipopessoa_id'),
  descricao            VARCHAR(50)   NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE TipoLogradouro (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_tipologradouro_codigo'),
  descricao            VARCHAR(30)   NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Logradouro (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_logradouro_id'),
  nome                 VARCHAR(150)  NOT NULL,
  codigoTipoLogradouro INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Moeda (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_moeda_codigo'),
  nome                 VARCHAR(20)   NOT NULL,
  simbolo              VARCHAR(5)    NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Cambio (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_cambio_codigo'),
  moedaOrigem          INTEGER       NOT NULL,
  moedaDestino         INTEGER       NOT NULL,
  valor                NUMERIC(14,2) NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Nacao (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_nacao_codigo'),
  nome                 VARCHAR(50)   NOT NULL,
  nome_completo        VARCHAR(150)  NOT NULL,
  lingua               VARCHAR(50)   NOT NULL,
  codigoISO            VARCHAR(3)    NOT NULL,
  codigoMoeda          INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Categoria (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_categoria_id'),
  nome                 VARCHAR(50)   NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE TipoTitulo (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_tipotitulo_id'),
  nome                 VARCHAR(50)   NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Estado (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_estado_id'),
  nome                 VARCHAR(50)   NOT NULL,
  sigla                VARCHAR(10)   NOT NULL, -- Devido as regiões japonesas, o limite foi aumentado
  codigoNacao          INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Cidade (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_cidade_id'),
  nome                 VARCHAR(50)   NOT NULL,
  idEstado             INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE CEP (
  codigo               VARCHAR(8)    NOT NULL,
  idCidade             INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE NivelAcesso( -- Uso futuro
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_nivelacesso_id'),
  descricao            VARCHAR(50)   NOT NULL DEFAULT 'Padrão',
  prioridade           INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Usuario (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_usuario_id'),
  nome                 VARCHAR(80)   NOT NULL,
  documento            VARCHAR(14)   NOT NULL,
  telefone             VARCHAR(50),
  email                VARCHAR(100)  NOT NULL,
  senha                VARCHAR(50)   NOT NULL,
  idTipoPessoa         INTEGER       NOT NULL,
  idNivelAcesso        INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE CodigoAcesso (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_codigoacesso_id'),
  codigo               VARCHAR(10)   NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Endereco (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_endereco_id'),
  numero               INTEGER       NOT NULL,
  bairro               VARCHAR(100),
  complemento          VARCHAR(50),
  referencia           VARCHAR(200),
  codigoCEP            VARCHAR(8)    NOT NULL,
  idLogradouro         INTEGER       NOT NULL,
  idUsuario            INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Titulo (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_titulo_id'),
  numeroTitulo         INTEGER,
  idTipoTitulo         INTEGER       NOT NULL,
  idUsuario            INTEGER       NOT NULL,
  idCategoria          INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);


CREATE TABLE Parcela (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_parcela_id'),
  idTitulo             INTEGER       NOT NULL,
  valor                NUMERIC(14,2) NOT NULL,
  dataPagamento        TIMESTAMP,
  dataVencimento       DATE          NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE TipoCaixa (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_tipocaixa_id'),
  descricao            VARCHAR(100)  NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Caixa (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_caixa_codigo'),
  nome                 VARCHAR(100)  NOT NULL,
  idUsuario            INTEGER       NOT NULL,
  idTipoCaixa          INTEGER       NOT NULL,
  codigoMoeda          INTEGER       NOT NULL,
  corVermelho          INTEGER       NOT NULL DEFAULT 0,
  corAzul              INTEGER       NOT NULL DEFAULT 0,
  corVerde             INTEGER       NOT NULL DEFAULT 0,
  prioridade           INTEGER       NOT NULL,
  saldo                NUMERIC(14,2) NOT NULL DEFAULT 0.0,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE OperacaoCaixa (
  id                   INTEGER       NOT NULL DEFAULT nextval('seq_operacaocaixa_id'),
  descricao            VARCHAR(100)  NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

-- valorinicial e final é por questão de historicidade
CREATE TABLE Extrato (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_extrato_codigo'),
  codigoCaixa          INTEGER       NOT NULL,
  idOperacaoCaixa      INTEGER       NOT NULL,
  valorInicial         NUMERIC(14,2) NOT NULL,
  valorFinal           NUMERIC(14,2) NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Cobranca (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_cobranca_codigo'),
  idUsuarioSolicitante INTEGER       NOT NULL,
  idUsuarioPagador     INTEGER       NOT NULL,
  idTitulo             INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE, -- Entende-se por pago ou não
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

CREATE TABLE Notificacao (
  codigo               INTEGER       NOT NULL DEFAULT nextval('seq_notificacao_codigo'),
  descricao            VARCHAR(100)  NOT NULL,
  idUsuario            INTEGER       NOT NULL,
  mensagem             VARCHAR(100)  NOT NULL, -- Mensagem que um usuário pode enviar a outro
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ativo                BOOLEAN       NOT NULL DEFAULT TRUE, -- Entende-se por lido ou não lido
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

-- Funciona como uma lista de amigos
-- a coluna 'ativo' não se enquadra em uso nessa tabela
CREATE TABLE Contato (
  idUsuario1           INTEGER       NOT NULL,
  idUsuario2           INTEGER       NOT NULL,
  dataCriacao          TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  dataAlteracao        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  excluido             BOOLEAN       NOT NULL DEFAULT FALSE
);

-------------- { Constraints } ----------------
-------------- { Primary Key } ---------------
ALTER TABLE TipoPessoa     ADD CONSTRAINT tipopessoa_pk     PRIMARY KEY (id);
ALTER TABLE TipoLogradouro ADD CONSTRAINT tipologradouro_pk PRIMARY KEY (codigo);
ALTER TABLE Logradouro     ADD CONSTRAINT logradouro_pk     PRIMARY KEY (id);
ALTER TABLE Moeda          ADD CONSTRAINT moeda_pk          PRIMARY KEY (codigo);
ALTER TABLE Cambio         ADD CONSTRAINT cambio_pk         PRIMARY KEY (codigo);
ALTER TABLE Nacao          ADD CONSTRAINT nacao_pk          PRIMARY KEY (codigo);
ALTER TABLE Categoria      ADD CONSTRAINT categoria_pk      PRIMARY KEY (id);
ALTER TABLE TipoTitulo     ADD CONSTRAINT tipotitulo_pk     PRIMARY KEY (id);
ALTER TABLE Estado         ADD CONSTRAINT estado_pk         PRIMARY KEY (id);
ALTER TABLE Cidade         ADD CONSTRAINT cidade_pk         PRIMARY KEY (id);
ALTER TABLE CEP            ADD CONSTRAINT cep_pk            PRIMARY KEY (codigo);
ALTER TABLE NivelAcesso    ADD CONSTRAINT nivelacesso_pk    PRIMARY KEY (id);
ALTER TABLE Usuario        ADD CONSTRAINT usuario_pk        PRIMARY KEY (id);
ALTER TABLE CodigoAcesso   ADD CONSTRAINT codigoacesso_pk   PRIMARY KEY (id);
ALTER TABLE Endereco       ADD CONSTRAINT endereco_pk       PRIMARY KEY (id);
ALTER TABLE Titulo         ADD CONSTRAINT titulo_pk         PRIMARY KEY (id);
ALTER TABLE Parcela        ADD CONSTRAINT parcela_pk        PRIMARY KEY (id);
ALTER TABLE TipoCaixa      ADD CONSTRAINT tipocaixa_pk      PRIMARY KEY (id);
ALTER TABLE Caixa          ADD CONSTRAINT caixa_pk          PRIMARY KEY (codigo);
ALTER TABLE OperacaoCaixa  ADD CONSTRAINT operacaocaixa_pk  PRIMARY KEY (id);
ALTER TABLE Extrato        ADD CONSTRAINT extrato_pk        PRIMARY KEY (codigo);
ALTER TABLE Cobranca       ADD CONSTRAINT cobranca_pk       PRIMARY KEY (codigo);
ALTER TABLE Notificacao    ADD CONSTRAINT notificacao_pk    PRIMARY KEY (codigo);
ALTER TABLE Contato        ADD CONSTRAINT contato_pk        PRIMARY KEY (idUsuario1, idUsuario2);
-------------- { Foreign Key } --------------
ALTER TABLE Logradouro  ADD CONSTRAINT logradouro_tipoLogradouro_fk   FOREIGN KEY (codigoTipoLogradouro) REFERENCES TipoLogradouro(codigo);
ALTER TABLE Cambio      ADD CONSTRAINT cambio_moedaOrigem_fk          FOREIGN KEY (moedaOrigem)          REFERENCES Moeda(codigo);
ALTER TABLE Cambio      ADD CONSTRAINT cambio_moedaDestino_fk         FOREIGN KEY (moedaDestino)         REFERENCES Moeda(codigo);
ALTER TABLE Nacao       ADD CONSTRAINT nacao_moeda_fk                 FOREIGN KEY (codigoMoeda)          REFERENCES Moeda(codigo);
ALTER TABLE Estado      ADD CONSTRAINT estado_nacao_fk                FOREIGN KEY (codigoNacao)          REFERENCES Nacao(codigo);
ALTER TABLE Cidade      ADD CONSTRAINT cidade_estado_fk               FOREIGN KEY (idEstado)             REFERENCES Estado(id);
ALTER TABLE CEP         ADD CONSTRAINT cep_cidade_fk                  FOREIGN KEY (idCidade)             REFERENCES Cidade(id);
ALTER TABLE Usuario     ADD CONSTRAINT usuario_tipopessoa_fk          FOREIGN KEY (idTipoPessoa)         REFERENCES TipoPessoa(id);
ALTER TABLE Usuario     ADD CONSTRAINT usuario_nivelacesso_fk         FOREIGN KEY (idNivelAcesso)        REFERENCES NivelAcesso(id);
ALTER TABLE Endereco    ADD CONSTRAINT endereco_cep_fk                FOREIGN KEY (codigoCEP)            REFERENCES CEP(codigo);
ALTER TABLE Endereco    ADD CONSTRAINT endereco_logradouro_fk         FOREIGN KEY (idLogradouro)         REFERENCES Logradouro(id);
ALTER TABLE Endereco    ADD CONSTRAINT endereco_usuario_fk            FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Titulo      ADD CONSTRAINT titulo_tipotitulo_fk           FOREIGN KEY (idTipoTitulo)         REFERENCES TipoTitulo(id);
ALTER TABLE Titulo      ADD CONSTRAINT titulo_usuario_fk              FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Titulo      ADD CONSTRAINT titulo_categoria_fk            FOREIGN KEY (idCategoria)          REFERENCES Categoria(id);
ALTER TABLE Parcela     ADD CONSTRAINT parcela_titulo_fk              FOREIGN KEY (idTitulo)             REFERENCES Titulo(id);
ALTER TABLE Caixa       ADD CONSTRAINT caixa_usuario_fk               FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Caixa       ADD CONSTRAINT caixa_tipocaixa_fk             FOREIGN KEY (idTipoCaixa)          REFERENCES TipoCaixa(id);
ALTER TABLE Caixa       ADD CONSTRAINT caixa_moeda_fk                 FOREIGN KEY (codigoMoeda)          REFERENCES Moeda(codigo);
ALTER TABLE Extrato     ADD CONSTRAINT extrato_caixa_fk               FOREIGN KEY (codigoCaixa)          REFERENCES Caixa(codigo);
ALTER TABLE Extrato     ADD CONSTRAINT extrato_operacaocaixa_fk       FOREIGN KEY (idOperacaoCaixa)      REFERENCES OperacaoCaixa(id);
ALTER TABLE Cobranca    ADD CONSTRAINT cobranca_usuariosolicitante_fk FOREIGN KEY (idUsuarioSolicitante) REFERENCES Usuario(id);
ALTER TABLE Cobranca    ADD CONSTRAINT cobranca_usuarioPagador_fk     FOREIGN KEY (idUsuarioPagador)     REFERENCES Usuario(id);
ALTER TABLE Cobranca    ADD CONSTRAINT cobranca_titulo_fk             FOREIGN KEY (idTitulo)             REFERENCES Titulo(id);
ALTER TABLE Notificacao ADD CONSTRAINT notificacao_usuario_fk         FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Contato     ADD CONSTRAINT contato_usuario1_fk            FOREIGN KEY (idUsuario1)           REFERENCES Usuario(id);
ALTER TABLE Contato     ADD CONSTRAINT contato_usuario2_fk            FOREIGN KEY (idUsuario2)           REFERENCES Usuario(id);
------------------ { Stored Procedures } -----------------
------------------ { Stored Functions } -----------------
CREATE OR REPLACE FUNCTION notif_novousuario()
RETURNS TRIGGER AS
$$
DECLARE
  V_DESCRICAO Notificacao.descricao%type;
  V_MENSAGEM  Notificacao.mensagem%type;
BEGIN
  V_DESCRICAO := 'Boas vindas ao Superavit';
  V_MENSAGEM  := 'Esperamos que tenha muitos Superavits';

  INSERT INTO Notificacao(descricao, idUsuario, mensagem)
    VALUES(V_DESCRICAO, NEW.id, V_MENSAGEM);

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
------------------ { Triggers } -----------------
CREATE TRIGGER tgr_novousuario
  AFTER INSERT ON Usuario
  FOR EACH ROW
  EXECUTE PROCEDURE notif_novousuario();
------------------ { Views } -----------------
CREATE VIEW vw_usuarios_ativos AS
  SELECT id, nome, documento, telefone, email, senha, idtipopessoa, idnivelacesso, datacriacao, dataalteracao
    FROM usuario
   WHERE ativo = TRUE;

CREATE VIEW vw_estados_brasileiros AS
  SELECT id, e.nome, sigla, codigonacao, e.datacriacao, e.dataalteracao
    FROM estado e
   INNER JOIN nacao n on (e.codigonacao = n.codigo)
   where n.nome = 'Brasil';

CREATE VIEW vw_estados_estadunidenses AS
  SELECT id, e.nome, sigla, codigonacao, e.datacriacao, e.dataalteracao
    FROM estado e
   INNER JOIN nacao n on (e.codigonacao = n.codigo)
   where n.nome = 'Estados Unidos';

CREATE VIEW vw_estados_canadenses AS
  SELECT id, e.nome, sigla, codigonacao, e.datacriacao, e.dataalteracao
    FROM estado e
   INNER JOIN nacao n on (e.codigonacao = n.codigo)
   where n.nome = 'Canadá';

CREATE VIEW vw_estados_japoneses AS
  SELECT id, e.nome, sigla, codigonacao, e.datacriacao, e.dataalteracao
    FROM estado e
   INNER JOIN nacao n on (e.codigonacao = n.codigo)
   where n.nome = 'Japão';

CREATE VIEW vw_usuarios_superiores AS
  SELECT U.ID, U.nome
    FROM usuario U
   INNER JOIN nivelacesso N ON (N.id = U.idnivelacesso)
   WHERE N.descricao = 'Superior';

CREATE VIEW vw_usuarios_administradores AS
  SELECT U.ID, U.nome
    FROM usuario U
   INNER JOIN nivelacesso N ON (N.id = U.idnivelacesso)
   WHERE N.descricao = 'Administrador';

CREATE VIEW vw_usuarios_padrao AS
  SELECT U.ID, U.nome
    FROM usuario U
   INNER JOIN nivelacesso N ON (N.id = U.idnivelacesso)
   WHERE N.descricao = 'Padrão';

CREATE VIEW vw_extrato_final AS
  SELECT c.nome                             AS "Caixa",
         oc.descricao                       AS "Operação",
         SUM(e.valorFinal - e.valorInicial) AS "Movimentações",
         c.saldo                            AS "Saldo",
         u.id                               AS "Id Usuário",
         u.nome                             AS "Nome Usuário"
    FROM Extrato e
   INNER JOIN Caixa c ON (c.codigo = e.codigoCaixa)
   INNER JOIN OperacaoCaixa oc ON (oc.id = e.idOperacaoCaixa)
   INNER JOIN Usuario u ON (u.id = c.idUsuario)
   WHERE c.ativo
     AND NOT c.excluido
     AND e.ativo
     AND NOT e.excluido
     AND oc.ativo
     AND NOT oc.excluido
   GROUP BY c.nome, oc.descricao, c.saldo, u.id, u.nome
   ORDER BY c.nome ASC, oc.descricao ASC;

CREATE VIEW vw_cobrancas AS
  SELECT us.nome as Solicitante,
       up.nome as Pagador,
       SUM(p.valor),
  CASE
       WHEN p.dataPagamento IS NOT NULL THEN 'Pago'
       ELSE 'Aguardando Pagamento'
   END AS Status
  FROM COBRANCA c
  JOIN Usuario up on (up.id = c.idUsuarioPagador)
  JOIN Usuario us on (us.id = c.idUsuarioSolicitante)
  JOIN Parcela p on (p.idTitulo = c.idTitulo)
 GROUP BY Status, Solicitante, Pagador;

CREATE VIEW vw_notif_nao_lidas AS
  SELECT descricao, idUsuario, mensagem
    FROM Notificacao
   WHERE ativo;

CREATE VIEW vw_notif_lidas AS
  SELECT descricao, idUsuario, mensagem
    FROM Notificacao
   WHERE ativo;