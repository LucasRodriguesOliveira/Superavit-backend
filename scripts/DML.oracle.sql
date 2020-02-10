
---------------- { Sequences } -------------------
CREATE SEQUENCE seq_tipopessoa_id;
CREATE SEQUENCE seq_tipologradouro_codigo;
CREATE SEQUENCE seq_logradouro_id;
CREATE SEQUENCE seq_moeda_codigo;
CREATE SEQUENCE seq_nacao_codigo;
CREATE SEQUENCE seq_categoria_id;
CREATE SEQUENCE seq_tipotitulo_id;
CREATE SEQUENCE seq_estado_id;
CREATE SEQUENCE seq_cidade_id;
CREATE SEQUENCE seq_nivelacesso_id;
CREATE SEQUENCE seq_usuario_id;
CREATE SEQUENCE seq_codigoacesso_id;
CREATE SEQUENCE seq_endereco_id;
CREATE SEQUENCE seq_titulo_id;
CREATE SEQUENCE seq_parcela_id;
CREATE SEQUENCE seq_cambio_codigo;
CREATE SEQUENCE seq_tipocaixa_id;
CREATE SEQUENCE seq_caixa_codigo;
CREATE SEQUENCE seq_operacaocaixa_id;
CREATE SEQUENCE seq_extrato_codigo;
CREATE SEQUENCE seq_cobranca_codigo;

---------------- { Tables } -----------------------------------------------------
CREATE TABLE TipoPessoa (
  id                   NUMBER                             NOT NULL,
  descricao            VARCHAR2(50)                       NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE TipoLogradouro (
  codigo               NUMBER                             NOT NULL,
  descricao            VARCHAR2(30)                       NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Logradouro (
  id                   NUMBER                             NOT NULL,
  nome                 VARCHAR2(150)                      NOT NULL,
  codigoTipoLogradouro NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Moeda (
  codigo               NUMBER                             NOT NULL,
  nome                 VARCHAR2(20)                       NOT NULL,
  simbolo              VARCHAR2(5)                        NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Cambio (
  codigo               NUMBER                             NOT NULL,
  moedaOrigem          NUMBER                             NOT NULL,
  moedaDestino         NUMBER                             NOT NULL,
  valor                NUMERIC(14,2)                      NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Nacao (
  codigo               NUMBER                             NOT NULL,
  nome                 VARCHAR2(50)                       NOT NULL,
  nome_completo        VARCHAR2(150)                      NOT NULL,
  lingua               VARCHAR2(50)                       NOT NULL,
  codigoISO            VARCHAR2(3)                        NOT NULL,
  codigoMoeda          NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Categoria (
  id                   NUMBER                             NOT NULL,
  nome                 VARCHAR2(50)                       NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE TipoTitulo (
  id                   NUMBER                             NOT NULL,
  nome                 VARCHAR2(50)                       NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Estado (
  id                   NUMBER                             NOT NULL,
  nome                 VARCHAR2(50)                       NOT NULL,
  sigla                VARCHAR2(2)                        NOT NULL,
  codigoNacao          NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Cidade (
  id                   NUMBER                             NOT NULL,
  nome                 VARCHAR2(50)                       NOT NULL,
  idEstado             NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE CEP (
  codigo               VARCHAR2(8)                        NOT NULL,
  idCidade             NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE NivelAcesso(
  id                   NUMBER                             NOT NULL,
  descricao            VARCHAR2(50)  DEFAULT 'Padrão'     NOT NULL,
  prioridade           NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Usuario (
  id                   NUMBER                             NOT NULL,
  nome                 VARCHAR2(80)                       NOT NULL,
  documento            VARCHAR2(14)                       NOT NULL,
  telefone             VARCHAR2(50),
  email                VARCHAR2(100)                      NOT NULL,
  senha                VARCHAR2(50)                       NOT NULL,
  idTipoPessoa         NUMBER                             NOT NULL,
  idNivelAcesso        NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE CodigoAcesso (
  id                   NUMBER                             NOT NULL,
  codigo               VARCHAR2(10)                       NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Endereco (
  id                   NUMBER                             NOT NULL,
  numero               NUMBER                             NOT NULL,
  bairro               VARCHAR2(100),
  complemento          VARCHAR2(50),
  referencia           VARCHAR2(200),
  codigoCEP            NUMBER                             NOT NULL,
  idLogradouro         NUMBER                             NOT NULL,
  idUsuario            NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Titulo (
  id                   NUMBER                             NOT NULL,
  numeroTitulo         NUMBER,
  idTipoTitulo         NUMBER                             NOT NULL,
  idUsuario            NUMBER                             NOT NULL,
  idCategoria          NUMBER                             NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Parcela (
  id                   NUMBER                             NOT NULL,
  idTitulo             NUMBER                             NOT NULL,
  valor                NUMBER(14,2)                       NOT NULL,
  dataPagamento        TIMESTAMP,
  dataVencimento       DATE                               NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE TipoCaixa (
  id                   NUMBER                             NOT NULL,
  descricao            VARCHAR2(100)                      NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Caixa (
  codigo               NUMBER                             NOT NULL,
  nome                 VARCHAR2(100)                      NOT NULL,
  idUsuario            NUMBER                             NOT NULL,
  idTipoCaixa          NUMBER                             NOT NULL,
  codigoMoeda          NUMBER                             NOT NULL,
  corVermelho          NUMBER(3)     DEFAULT 0            NOT NULL,
  corAzul              NUMBER(3)     DEFAULT 0            NOT NULL,
  corVerde             NUMBER(3)     DEFAULT 0            NOT NULL,
  prioridade           NUMBER                             NOT NULL,
  saldo                NUMBER(14,2)  DEFAULT 0.0          NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE OperacaoCaixa (
  id                   NUMBER                             NOT NULL,
  descricao            VARCHAR2(100)                      NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

-- valorinicial e final é por questão de historicidade
CREATE TABLE Extrato (
  codigo               NUMBER                             NOT NULL,
  codigoCaixa          NUMBER                             NOT NULL,
  idOperacaoCaixa      NUMBER                             NOT NULL,
  valorInicial         NUMBER(14,2)                       NOT NULL,
  valorFinal           NUMBER(14,2)                       NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excl  uido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
);

CREATE TABLE Cobranca (
  codigo               INTEGER                            NOT NULL,
  idUsuarioSolicitante INTEGER                            NOT NULL,
  idUsuarioPagador     INTEGER                            NOT NULL,
  idTitulo             INTEGER                            NOT NULL,
  dataCriacao          TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  dataAlteracao        TIMESTAMP     DEFAULT SYSTIMESTAMP NOT NULL,
  ativo                VARCHAR2(1)   DEFAULT 'S'          NOT NULL,
  excluido             VARCHAR2(1)   DEFAULT 'N'          NOT NULL
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
ALTER TABLE CodigoAcesso   ADD CONSTRAINT codigoacesso_pk   PRIMARY KEY (id)
ALTER TABLE Endereco       ADD CONSTRAINT endereco_pk       PRIMARY KEY (id);
ALTER TABLE Titulo         ADD CONSTRAINT titulo_pk         PRIMARY KEY (id);
ALTER TABLE Parcela        ADD CONSTRAINT parcela_pk        PRIMARY KEY (id);
ALTER TABLE TipoCaixa      ADD CONSTRAINT tipocaixa_pk      PRIMARY KEY (id);
ALTER TABLE Caixa          ADD CONSTRAINT caixa_pk          PRIMARY KEY (codigo);
ALTER TABLE OperacaoCaixa  ADD CONSTRAINT operacaocaixa_pk  PRIMARY KEY (id);
ALTER TABLE Extrato        ADD CONSTRAINT extrato_pk        PRIMARY KEY (codigo);
ALTER TABLE Cobranca       ADD CONSTRAINT cobranca_pk       PRIMARY KEY (codigo);
-------------- { Foreign Key } --------------
ALTER TABLE Logradouro ADD CONSTRAINT logradouro_tipoLogradouro_fk   FOREIGN KEY (codigoTipoLogradouro) REFERENCES TipoLogradouro(codigo);
ALTER TABLE Cambio     ADD CONSTRAINT cambio_moedaOrigem_fk          FOREIGN KEY (moedaOrigem)          REFERENCES Moeda(codigo);
ALTER TABLE Cambio     ADD CONSTRAINT cambio_moedaDestino_fk         FOREIGN KEY (moedaDestino)         REFERENCES Moeda(codigo);
ALTER TABLE Nacao      ADD CONSTRAINT nacao_moeda_fk                 FOREIGN KEY (codigoMoeda)          REFERENCES Moeda(codigo);
ALTER TABLE Estado     ADD CONSTRAINT estado_nacao_fk                FOREIGN KEY (codigoNacao)          REFERENCES Nacao(codigo);
ALTER TABLE Cidade     ADD CONSTRAINT cidade_estado_fk               FOREIGN KEY (idEstado)             REFERENCES Estado(id);
ALTER TABLE CEP        ADD CONSTRAINT cep_cidade_fk                  FOREIGN KEY (idCidade)             REFERENCES Cidade(id);
ALTER TABLE Usuario    ADD CONSTRAINT usuario_tipopessoa_fk          FOREIGN KEY (idTipoPessoa)         REFERENCES TipoPessoa(id);
ALTER TABLE Usuario    ADD CONSTRAINT usuario_nivelacesso_fk         FOREIGN KEY (idNivelAcesso)        REFERENCES NivelAcesso(id);
ALTER TABLE Endereco   ADD CONSTRAINT endereco_cep_fk                FOREIGN KEY (codigoCEP)            REFERENCES CEP(codigo);
ALTER TABLE Endereco   ADD CONSTRAINT endereco_logradouro_fk         FOREIGN KEY (idLogradouro)         REFERENCES Logradouro(id);
ALTER TABLE Endereco   ADD CONSTRAINT endereco_usuario_fk            FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Titulo     ADD CONSTRAINT titulo_tipotitulo_fk           FOREIGN KEY (idTipoTitulo)         REFERENCES TipoTitulo(id);
ALTER TABLE Titulo     ADD CONSTRAINT titulo_usuario_fk              FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Titulo     ADD CONSTRAINT titulo_categoria_fk            FOREIGN KEY (idCategoria)          REFERENCES Categoria(id);
ALTER TABLE Parcela    ADD CONSTRAINT parcela_titulo_fk              FOREIGN KEY (idTitulo)             REFERENCES Titulo(id);
ALTER TABLE Caixa      ADD CONSTRAINT caixa_usuario_fk               FOREIGN KEY (idUsuario)            REFERENCES Usuario(id);
ALTER TABLE Caixa      ADD CONSTRAINT caixa_tipocaixa_fk             FOREIGN KEY (idTipoCaixa)          REFERENCES TipoCaixa(id);
ALTER TABLE Caixa      ADD CONSTRAINT caixa_moeda_fk                 FOREIGN KEY (codigoMoeda)          REFERENCES Moeda(codigo);
ALTER TABLE Extrato    ADD CONSTRAINT extrato_caixa_fk               FOREIGN KEY (codigoCaixa)          REFERENCES Caixa(codigo);
ALTER TABLE Extrato    ADD CONSTRAINT extrato_operacaocaixa_fk       FOREIGN KEY (idOperacaoCaixa)      REFERENCES OperacaoCaixa(id);
ALTER TABLE Cobranca   ADD CONSTRAINT cobranca_usuariosolicitante_fk FOREIGN KEY (idUsuarioSolicitante) REFERENCES Usuario(id);
ALTER TABLE Cobranca   ADD CONSTRAINT cobranca_usuarioPagador_fk     FOREIGN KEY (idUsuarioPagador)     REFERENCES Usuario(id);
ALTER TABLE Cobranca   ADD CONSTRAINT cobranca_titulo_fk             FOREIGN KEY (idTitulo)             REFERENCES Titulo(id);
----------- { Triggers } -------------------
CREATE OR REPLACE TRIGGER nextseq_tipopessoa
  BEFORE INSERT ON TipoPessoa
  FOR EACH ROW
  BEGIN
    SELECT seq_tipopessoa_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_tipoLogradouro
  BEFORE INSERT ON TipoLogradouro
  FOR EACH ROW
  BEGIN
    SELECT seq_tipoLogradouro_codigo.nextval
      INTO :NEW.codigo
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_logradouro
  BEFORE INSERT ON Logradouro
  FOR EACH ROW
  BEGIN
    SELECT seq_logradouro_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_moeda
  BEFORE INSERT ON Moeda
  FOR EACH ROW
  BEGIN
    SELECT seq_moeda_codigo.nextval
      INTO :NEW.codigo
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_nacao
  BEFORE INSERT ON Nacao
  FOR EACH ROW
  BEGIN
    SELECT seq_nacao_codigo.nextval
      INTO :NEW.codigo
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_categoria
  BEFORE INSERT ON Categoria
  FOR EACH ROW
  BEGIN
    SELECT seq_categoria_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_tipotitulo
  BEFORE INSERT ON TipoTitulo
  FOR EACH ROW
  BEGIN
    SELECT seq_tipotitulo_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_estado
  BEFORE INSERT ON Estado
  FOR EACH ROW
  BEGIN
    SELECT seq_estado_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_cidade
  BEFORE INSERT ON Cidade
  FOR EACH ROW
  BEGIN
    SELECT seq_cidade_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_nivelacesso
  BEFORE INSERT ON NivelAcesso
  FOR EACH ROW
  BEGIN
    SELECT seq_nivelacesso_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_usuario
  BEFORE INSERT ON Usuario
  FOR EACH ROW
  BEGIN
    SELECT seq_usuario_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_codigoacesso
  BEFORE INSERT ON CodigoAcesso
  FOR EACH ROW
  BEGIN
    SELECT seq_codigoacesso_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_endereco
  BEFORE INSERT ON Endereco
  FOR EACH ROW
  BEGIN
    SELECT seq_endereco_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_titulo
  BEFORE INSERT ON Titulo
  FOR EACH ROW
  BEGIN
    SELECT seq_titulo_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_parcela
  BEFORE INSERT ON Parcela
  FOR EACH ROW
  BEGIN
    SELECT seq_parcela_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_tipocaixa
  BEFORE INSERT ON TipoCaixa
  FOR EACH ROW
  BEGIN
    SELECT seq_tipocaixa_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_caixa
  BEFORE INSERT ON Caixa
  FOR EACH ROW
  BEGIN
    SELECT seq_caixa_codigo.nextval
      INTO :NEW.codigo
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_operacaocaixa
  BEFORE INSERT ON OperacaoCaixa
  FOR EACH ROW
  BEGIN
    SELECT seq_operacaocaixa_id.nextval
      INTO :NEW.id
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_extrato
  BEFORE INSERT ON Extrato
  FOR EACH ROW
  BEGIN
    SELECT seq_extrato_codigo.nextval
      INTO :NEW.codigo
      FROM DUAL;
  END;

CREATE OR REPLACE TRIGGER nextseq_cobranca
  BEFORE INSERT ON Cobranca
  FOR EACH ROW
  BEGIN
    SELECT seq_cobranca_codigo.nextval
      INTO :NEW.codigo
      FROM DUAL;
  END;
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
   INNER JOIN Caixa          c ON (c.codigo = e.codigoCaixa)
   INNER JOIN OperacaoCaixa oc ON (oc.id    = e.idOperacaoCaixa)
   INNER JOIN Usuario        u ON (u.id     = c.idUsuario)
   WHERE c.ativo     = 'S'
     AND c.excluido  = 'N'
     AND e.ativo     = 'S'
     AND e.excluido  = 'N'
     AND oc.ativo    = 'S'
     AND oc.excluido = 'N'
   GROUP BY c.nome, oc.descricao
   ORDER BY c.nome ASC, oc.descricao ASC;

CREATE VIEW vw_cobrancas AS
  SELECT us.nome as Solicitante,
       up.nome as Pagador,
       SUM(p.valor),
  CASE
       WHEN p.dataPagamento IS NOT NULL THEN "Pago"
       ELSE "Aguardando Pagamento"
   END AS Status
  FROM COBRANCA c
  JOIN Usuario up on (up.id = c.idUsuarioPagador)
  JOIN Usuario us on (us.id = c.idUsuarioSolicitante)
  JOIN Parcela p on (p.idTitulo = c.idTitulo)
 GROUP BY Status, Solicitante, Pagador