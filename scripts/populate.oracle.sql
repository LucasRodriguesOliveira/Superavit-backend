---------------- TipoPessoa
INSERT INTO TipoPessoa(descricao)
            SELECT 'Física'   FROM DUAL
  UNION ALL SELECT 'Jurídica' FROM DUAL;

---------------- TipoLogradouro
INSERT INTO TipoLogradouro(descricao)
            SELECT 'Rua'     FROM DUAL
  UNION ALL SELECT 'Avenida' FROM DUAL
  UNION ALL SELECT 'Rodovia' FROM DUAL
  UNION ALL SELECT 'Outro'   FROM DUAL;

---------------- Logradouro
INSERT INTO Logradouro(nome, codigoTipoLogradouro)
            SELECT 'Avenida Brasil',         2 FROM DUAL
  UNION ALL SELECT 'São João',               2 FROM DUAL
  UNION ALL SELECT 'Santos Dumont',          2 FROM DUAL
  UNION ALL SELECT 'D. Pedro II',            1 FROM DUAL
  UNION ALL SELECT 'Haroldo Hamilton',       1 FROM DUAL
  UNION ALL SELECT 'Parigot de Souza',       2 FROM DUAL
  UNION ALL SELECT 'Carlos Sbaraini',        1 FROM DUAL
  UNION ALL SELECT 'Senador Atílio Fontana', 2 FROM DUAL
  UNION ALL SELECT 'Rua dos Palmares',       1 FROM DUAL
  UNION ALL SELECT 'BR 277',                 3 FROM DUAL
  UNION ALL SELECT 'PR 476',                 3 FROM DUAL
  UNION ALL SELECT '4 Pontes',               1 FROM DUAL;

---------------- Moeda
INSERT INTO Moeda(nome, simbolo)
            SELECT 'Real',     'R$' FROM DUAL
  UNION ALL SELECT 'Dólar',    'U$' FROM DUAL
  UNION ALL SELECT 'Euro',     '€'  FROM DUAL
  UNION ALL SELECT 'iene/Yen', '¥'  FROM DUAL;

---------------- Nacao
INSERT INTO Nacao(nome, nome_completo, lingua, codigoISO, codigoMoeda)
            SELECT 'Brasil',         'República Federativa do Brasil', 'Português',      'BRA', 1 FROM DUAL
  UNION ALL SELECT 'Portugal',       'República Portuguesa',           'Português',      'PRT', 3 FROM DUAL
  UNION ALL SELECT 'Estados Unidos', 'Estados Unidos da América',      'Inglês',         'EUA', 2 FROM DUAL
  UNION ALL SELECT 'Canadá',         'Canadá',                         'Inglês/Francês', 'CA',  2 FROM DUAL
  UNION ALL SELECT 'Japão',          'Estado do Japão',                'Japonês',        'JPN', 4 FROM DUAL;

---------------- Estado
-- Estados Brasileiros
INSERT INTO Estado(nome, sigla, codigoNacao)
            SELECT 'Acre',                'AC', 1 FROM DUAL
  UNION ALL SELECT 'Alagoas',             'AL', 1 FROM DUAL
  UNION ALL SELECT 'Amapá',               'AP', 1 FROM DUAL
  UNION ALL SELECT 'Amazonas',            'AM', 1 FROM DUAL
  UNION ALL SELECT 'Bahia',               'BA', 1 FROM DUAL
  UNION ALL SELECT 'Ceará',               'CE', 1 FROM DUAL
  UNION ALL SELECT 'Distrito Federal',    'DF', 1 FROM DUAL
  UNION ALL SELECT 'Espírito Santo',      'ES', 1 FROM DUAL
  UNION ALL SELECT 'Goiás',               'GO', 1 FROM DUAL
  UNION ALL SELECT 'Maranhão',            'MA', 1 FROM DUAL
  UNION ALL SELECT 'Mato Grosso',         'MT', 1 FROM DUAL
  UNION ALL SELECT 'Mato Grosso do Sul',  'MS', 1 FROM DUAL
  UNION ALL SELECT 'Minas Gerais',        'MG', 1 FROM DUAL
  UNION ALL SELECT 'Pará',                'PA', 1 FROM DUAL
  UNION ALL SELECT 'Paraíba',             'PB', 1 FROM DUAL
  UNION ALL SELECT 'Paraná',              'PR', 1 FROM DUAL
  UNION ALL SELECT 'Pernambuco',          'PE', 1 FROM DUAL
  UNION ALL SELECT 'Piauí',               'PI', 1 FROM DUAL
  UNION ALL SELECT 'Rio de Janeiro',      'RJ', 1 FROM DUAL
  UNION ALL SELECT 'Rio Grande do Norte', 'RN', 1 FROM DUAL
  UNION ALL SELECT 'Rio Grande do Sul',   'RS', 1 FROM DUAL
  UNION ALL SELECT 'Rondônia',            'RO', 1 FROM DUAL
  UNION ALL SELECT 'Roraima',             'RR', 1 FROM DUAL
  UNION ALL SELECT 'Santa Catarina',      'SC', 1 FROM DUAL
  UNION ALL SELECT 'São Paulo',           'SP', 1 FROM DUAL
  UNION ALL SELECT 'Sergipe',             'SE', 1 FROM DUAL
  UNION ALL SELECT 'Tocantins',           'TO', 1 FROM DUAL;

-- Estados Estadunidenses
INSERT INTO Estado(nome, sigla, codigoNacao)
            SELECT 'Alabama',            'AL', 2 FROM DUAL
  UNION ALL SELECT 'Alasca',             'AK', 2 FROM DUAL
  UNION ALL SELECT 'Arkansas',           'AR', 2 FROM DUAL
  UNION ALL SELECT 'Arizona',            'AZ', 2 FROM DUAL
  UNION ALL SELECT 'Califórnia',         'CA', 2 FROM DUAL
  UNION ALL SELECT 'Carolina do Norte',  'NC', 2 FROM DUAL
  UNION ALL SELECT 'Carolina do Sul',    'SC', 2 FROM DUAL
  UNION ALL SELECT 'Colorado',           'CO', 2 FROM DUAL
  UNION ALL SELECT 'Conecticute',        'CT', 2 FROM DUAL
  UNION ALL SELECT 'Dacota do Norte',    'ND', 2 FROM DUAL
  UNION ALL SELECT 'Dacota do Sul',      'SD', 2 FROM DUAL
  UNION ALL SELECT 'Delaware',           'DE', 2 FROM DUAL
  UNION ALL SELECT 'Flórida',            'FL', 2 FROM DUAL
  UNION ALL SELECT 'Geórgia',            'GA', 2 FROM DUAL
  UNION ALL SELECT 'Havaí',              'HI', 2 FROM DUAL
  UNION ALL SELECT 'Idaho',              'ID', 2 FROM DUAL
  UNION ALL SELECT 'Ilha de Rodes',      'RI', 2 FROM DUAL
  UNION ALL SELECT 'Ilinóis',            'IL', 2 FROM DUAL
  UNION ALL SELECT 'Indiana',            'IN', 2 FROM DUAL
  UNION ALL SELECT 'Iowa',               'IA', 2 FROM DUAL
  UNION ALL SELECT 'Kentucky',           'KY', 2 FROM DUAL
  UNION ALL SELECT 'Kansas',             'KS', 2 FROM DUAL
  UNION ALL SELECT 'Luisiana',           'LA', 2 FROM DUAL
  UNION ALL SELECT 'Maine',              'ME', 2 FROM DUAL
  UNION ALL SELECT 'Marilândia',         'MD', 2 FROM DUAL
  UNION ALL SELECT 'Massachussets',      'MA', 2 FROM DUAL
  UNION ALL SELECT 'Michigan',           'MI', 2 FROM DUAL
  UNION ALL SELECT 'Mississípi',         'MS', 2 FROM DUAL
  UNION ALL SELECT 'Missúri',            'MO', 2 FROM DUAL
  UNION ALL SELECT 'Montana',            'MT', 2 FROM DUAL
  UNION ALL SELECT 'Nebrasca',           'NE', 2 FROM DUAL
  UNION ALL SELECT 'Nevada',             'NV', 2 FROM DUAL
  UNION ALL SELECT 'Nova Hampshire',     'NH', 2 FROM DUAL
  UNION ALL SELECT 'Nova Jérsei',        'NJ', 2 FROM DUAL
  UNION ALL SELECT 'Nova Iorque',        'NY', 2 FROM DUAL
  UNION ALL SELECT 'Novo México',        'NM', 2 FROM DUAL
  UNION ALL SELECT 'Oklahoma',           'OK', 2 FROM DUAL
  UNION ALL SELECT 'Ohio',               'OH', 2 FROM DUAL
  UNION ALL SELECT 'Óregon',             'OR', 2 FROM DUAL
  UNION ALL SELECT 'Pensilvânia',        'PA', 2 FROM DUAL
  UNION ALL SELECT 'Tenessi',            'TN', 2 FROM DUAL
  UNION ALL SELECT 'Texas',              'TX', 2 FROM DUAL
  UNION ALL SELECT 'Utah',               'UT', 2 FROM DUAL
  UNION ALL SELECT 'Vermonte',           'VT', 2 FROM DUAL
  UNION ALL SELECT 'Virgínia',           'VA', 2 FROM DUAL
  UNION ALL SELECT 'Virgínia Ocidental', 'WV', 2 FROM DUAL
  UNION ALL SELECT 'Washington',         'WA', 2 FROM DUAL
  UNION ALL SELECT 'Wisconsin',          'WI', 2 FROM DUAL
  UNION ALL SELECT 'Wyoming',            'WY', 2 FROM DUAL;

-- Estados Canadenses
INSERT INTO Estado(nome, sigla, codigoNacao)
            SELECT 'Alberta',                  'AB', 3 FROM DUAL
  UNION ALL SELECT 'Colúmbia Britânica',       'BC', 3 FROM DUAL
  UNION ALL SELECT 'Ilha do Príncipe Eduardo', 'PE', 3 FROM DUAL
  UNION ALL SELECT 'Manitoba',                 'MB', 3 FROM DUAL
  UNION ALL SELECT 'Nova Brunswick',           'NB', 3 FROM DUAL
  UNION ALL SELECT 'Nova Escócia',             'NS', 3 FROM DUAL
  UNION ALL SELECT 'Nunavut',                  'NU', 3 FROM DUAL
  UNION ALL SELECT 'Ontário',                  'ON', 3 FROM DUAL
  UNION ALL SELECT 'Quebec',                   'QC', 3 FROM DUAL
  UNION ALL SELECT 'Saskatchewan',             'SK', 3 FROM DUAL
  UNION ALL SELECT 'Terra Nova e Labrador',    'NL', 3 FROM DUAL
  UNION ALL SELECT 'Territórios do Noroeste',  'NT', 3 FROM DUAL
  UNION ALL SELECT 'Yukon',                    'YT', 3 FROM DUAL;

-- Estados Japoneses (Ps: O Japão na verdade é dividido em Regiões, e não estados)
INSERT INTO Estado(nome, sigla, codigoNacao)
            SELECT 'Chubu',    'Chubu',    5 FROM DUAL
  UNION ALL SELECT 'Chugoku',  'Chugoku',  5 FROM DUAL
  UNION ALL SELECT 'Hokkaido', 'Hokkaido', 5 FROM DUAL
  UNION ALL SELECT 'Kansai',   'Kansai',   5 FROM DUAL
  UNION ALL SELECT 'Kanto',    'Kanto',    5 FROM DUAL
  UNION ALL SELECT 'Kyushu',   'Kyushu',   5 FROM DUAL
  UNION ALL SELECT 'Okinawa',  'Okinawa',  5 FROM DUAL
  UNION ALL SELECT 'Shikoku',  'Shikoku',  5 FROM DUAL
  UNION ALL SELECT 'Tohoku',   'Tohoku',   5 FROM DUAL;

INSERT INTO Cidade (nome, idEstado)
            SELECT 'Toledo',                  16 FROM DUAL -- 16 - Paraná
  UNION ALL SELECT 'Cascavel',                16 FROM DUAL
  UNION ALL SELECT 'Foz do Iguaçu',           16 FROM DUAL
  UNION ALL SELECT 'Maringá',                 16 FROM DUAL
  UNION ALL SELECT 'Palotina',                16 FROM DUAL
  UNION ALL SELECT 'Umuarama',                16 FROM DUAL
  UNION ALL SELECT 'Curitiba',                16 FROM DUAL
  UNION ALL SELECT 'Guarutaba',               16 FROM DUAL
  UNION ALL SELECT 'Pato Branco',             16 FROM DUAL
  UNION ALL SELECT 'Terra Roxa',              16 FROM DUAL
  UNION ALL SELECT 'Ouro Verde',              16 FROM DUAL
  UNION ALL SELECT 'Marechal Cândido Rondon', 16 FROM DUAL
  UNION ALL SELECT 'São Paulo',               25 FROM DUAL -- 25 - São Paulo
  UNION ALL SELECT 'Campinas',                25 FROM DUAL
  UNION ALL SELECT 'Itaquaquecetuba',         25 FROM DUAL
  UNION ALL SELECT 'Rio de Janeiro',          19 FROM DUAL -- 19 - Rio de Janeiro
  UNION ALL SELECT 'Cuiabá',                  11 FROM DUAL; -- 11 - Mato Grosso

INSERT INTO NivelAcesso (descricao, prioridade)
            SELECT 'Superior',      1 FROM DUAL
  UNION ALL SELECT 'Administrador', 2 FROM DUAL
  UNION ALL SELECT 'Padrão',        3 FROM DUAL;

INSERT INTO Usuario (nome, documento, telefone, email, senha, idTipoPessoa, idNivelAcesso)
            SELECT 'Lucas Oliveira', '11122233344', '', 'lucas@email.com','admin',   1, 1 FROM DUAL
  UNION ALL SELECT 'João da Silva',  '12345678900', '', 'joao@email.com', 'j.silva', 1, 2 FROM DUAL
  UNION ALL SELECT 'Ana Flávia',     '12121234344', '', 'ana@email.com',  'ana',     1, 3 FROM DUAL
  UNION ALL SELECT 'Maria Clara',    '77777788899', '', 'maria@email.com','maria',   1, 3 FROM DUAL;

INSERT INTO TipoCaixa (descricao)
            SELECT 'Carteira' FROM DUAL
  UNION ALL SELECT 'Banco'    FROM DUAL
  UNION ALL SELECT 'Poupança' FROM DUAL;

INSERT INTO OperacaoCaixa (descricao)
            SELECT 'Débito'   FROM DUAL
  UNION ALL SELECT 'Crédito'  FROM DUAL
  UNION ALL SELECT 'Reajuste' FROM DUAL;