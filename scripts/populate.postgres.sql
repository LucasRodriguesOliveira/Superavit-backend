INSERT INTO TipoPessoa(descricao)
  VALUES ('Física'), ('Jurídica');

INSERT INTO TipoLogradouro(descricao)
  VALUES ('Rua'), ('Avenida'), ('Rodovia'), ('Outro');

INSERT INTO Logradouro(nome, codigoTipoLogradouro)
  VALUES ('Avenida Brasil', 2),
         ('São João', 2),
         ('Santos Dumont', 2),
         ('D. Pedro II', 1),
         ('Haroldo Hamilton', 1),
         ('Parigot de Souza', 2),
         ('Carlos Sbaraini', 1),
         ('Senador Atílio Fontana', 2),
         ('Rua dos Palmares', 1),
         ('BR 277', 3),
         ('PR 476', 3),
         ('4 Pontes', 1);

INSERT INTO Moeda(nome, simbolo)
  VALUES ('Real', 'R$'), ('Dólar', 'U$'), ('Euro', '€'), ('iene/Yen', '¥');

INSERT INTO Nacao(nome, nome_completo, lingua, codigoISO, codigoMoeda)
  VALUES ('Brasil', 'República Federativa do Brasil', 'Português', 'BRA', 1),
         ('Estados Unidos', 'Estados Unidos da América', 'Inglês', 'EUA', 2),
         ('Canadá', 'Canadá', 'Inglês/Francês', 'CA', 2),
         ('Portugal', 'República Portuguesa', 'Português', 'PRT', 3),
         ('Japão', 'Estado do Japão', 'Japonês', 'JPN', 4);

-- Estados Brasileiros
INSERT INTO Estado(nome, sigla, codigoNacao)
  VALUES ('Acre', 'AC', 1),
         ('Alagoas', 'AL', 1),
         ('Amapá', 'AP', 1),
         ('Amazonas', 'AM', 1),
         ('Bahia', 'BA', 1),
         ('Ceará', 'CE', 1),
         ('Distrito Federal', 'DF', 1),
         ('Espírito Santo', 'ES', 1),
         ('Goiás', 'GO', 1),
         ('Maranhão', 'MA', 1),
         ('Mato Grosso', 'MT', 1),
         ('Mato Grosso do Sul', 'MS', 1),
         ('Minas Gerais', 'MG', 1),
         ('Pará', 'PA', 1),
         ('Paraíba', 'PB', 1),
         ('Paraná', 'PR', 1),
         ('Pernambuco', 'PE', 1),
         ('Piauí', 'PI', 1),
         ('Rio de Janeiro', 'RJ', 1),
         ('Rio Grande do Norte', 'RN', 1),
         ('Rio Grande do Sul', 'RS', 1),
         ('Rondônia', 'RO', 1),
         ('Roraima', 'RR', 1),
         ('Santa Catarina', 'SC', 1),
         ('São Paulo', 'SP', 1),
         ('Sergipe', 'SE', 1),
         ('Tocantins', 'TO', 1);

-- Estados Estadunidenses
INSERT INTO Estado(nome, sigla, codigoNacao)
  VALUES ('Alabama', 'AL', 2),
         ('Alasca', 'AK', 2),
         ('Arkansas', 'AR', 2),
         ('Arizona', 'AZ', 2),
         ('Califórnia', 'CA', 2),
         ('Carolina do Norte', 'NC', 2),
         ('Carolina do Sul', 'SC', 2),
         ('Colorado', 'CO', 2),
         ('Conecticute', 'CT', 2),
         ('Dacota do Norte', 'ND', 2),
         ('Dacota do Sul', 'SD', 2),
         ('Delaware', 'DE', 2),
         ('Flórida', 'FL', 2),
         ('Geórgia', 'GA', 2),
         ('Havaí', 'HI', 2),
         ('Idaho', 'ID', 2),
         ('Ilha de Rodes', 'RI', 2),
         ('Ilinóis', 'IL', 2),
         ('Indiana', 'IN', 2),
         ('Iowa', 'IA', 2),
         ('Kentucky', 'KY', 2),
         ('Kansas', 'KS', 2),
         ('Luisiana', 'LA', 2),
         ('Maine', 'ME', 2),
         ('Marilândia', 'MD', 2),
         ('Massachussets', 'MA', 2),
         ('Michigan', 'MI', 2),
         ('Mississípi', 'MS', 2),
         ('Missúri', 'MO', 2),
         ('Montana', 'MT', 2),
         ('Nebrasca', 'NE', 2),
         ('Nevada', 'NV', 2),
         ('Nova Hampshire', 'NH', 2),
         ('Nova Jérsei', 'NJ', 2),
         ('Nova Iorque', 'NY', 2),
         ('Novo México', 'NM', 2),
         ('Oklahoma', 'OK', 2),
         ('Ohio', 'OH', 2),
         ('Óregon', 'OR', 2),
         ('Pensilvânia', 'PA', 2),
         ('Tenessi', 'TN', 2),
         ('Texas', 'TX', 2),
         ('Utah', 'UT', 2),
         ('Vermonte', 'VT', 2),
         ('Virgínia', 'VA', 2),
         ('Virgínia Ocidental', 'WV', 2),
         ('Washington', 'WA', 2),
         ('Wisconsin', 'WI', 2),
         ('Wyoming', 'WY', 2);

-- Estados Canadenses
INSERT INTO Estado(nome, sigla, codigoNacao)
  VALUES ('Alberta', 'AB', 3),
         ('Colúmbia Britânica', 'BC', 3),
         ('Ilha do Príncipe Eduardo', 'PE', 3),
         ('Manitoba', 'MB', 3),
         ('Nova Brunswick', 'NB', 3),
         ('Nova Escócia', 'NS', 3),
         ('Nunavut', 'NU', 3),
         ('Ontário', 'ON', 3),
         ('Quebec', 'QC', 3),
         ('Saskatchewan', 'SK', 3),
         ('Terra Nova e Labrador', 'NL', 3),
         ('Territórios do Noroeste', 'NT', 3),
         ('Yukon', 'YT', 3);

-- Estados Japoneses (Ps: O Japão na verdade é dividido em Regiões, e não estados)
INSERT INTO Estado(nome, sigla, codigoNacao)
  VALUES ('Chubu', 'Chubu', 5),
         ('Chugoku', 'Chugoku', 5),
         ('Hokkaido', 'Hokkaido', 5),
         ('Kansai', 'Kansai', 5),
         ('Kanto', 'Kanto', 5),
         ('Kyushu', 'Kyushu', 5),
         ('Okinawa', 'Okinawa', 5),
         ('Shikoku', 'Shikoku', 5),
         ('Tohoku', 'Tohoku', 5);

INSERT INTO Cidade (nome, idEstado)
  VALUES ('Toledo', 16), -- 16 - Paraná
         ('Cascavel', 16),
         ('Foz do Iguaçu', 16),
         ('Maringá', 16),
         ('Palotina', 16),
         ('Umuarama', 16),
         ('Curitiba', 16),
         ('Guarutaba', 16),
         ('Pato Branco', 16),
         ('Terra Roxa', 16),
         ('Ouro Verde', 16),
         ('Marechal Cândido Rondon', 16),
         ('São Paulo', 25), -- 25 - São Paulo
         ('Campinas', 25),
         ('Itaquaquecetuba', 25),
         ('Rio de Janeiro', 19), -- 19 - Rio de Janeiro
         ('Cuiabá', 11); -- 11 - Mato Grosso

INSERT INTO NivelAcesso (descricao, prioridade)
  VALUES ('Superior', 1),
         ('Administrador', 2),
         ('Padrão', 3);

INSERT INTO Usuario (nome, documento, telefone, email, senha, idTipoPessoa, idNivelAcesso)
  VALUES ('Lucas Oliveira', '11122233344', '', 'lucas@email.com','admin', 1, 1),
         ('Superavit', '', '', 'superavit@email.com','admin', 2, 1),
         ('João da Silva', '12345678900', '', 'joao@email.com','j.silva', 1, 2),
         ('Ana Flávia', '12121234344', '', 'ana@email.com','ana', 1, 3),
         ('Maria Clara', '77777788899', '', 'maria@email.com','maria', 1, 3);

INSERT INTO TipoCaixa(descricao)
  VALUES ('Carteira'), ('Banco'), ('Poupança');

INSERT INTO OperacaoCaixa(descricao)
  VALUES ('Débito'), ('Crédito'), ('Reajuste');