const criarTabelas = [
  '''
  CREATE TABLE cliente(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,idade integer NOT NULL
    ,numeroTelefone VARCHAR(16) NOT NULL
    ,email VARCHAR(200)
    ,cpf CHAR(14) NOT NULL UNIQUE
    ,senha VARCHAR(200) NOT NULL
  )
  '''
];


const inserirRegistros = [
  'INSERT INTO cliente (id, nome, idade, numeroTelefone, email, cpf, senha) VALUES (1, "Ana Souza", 29, "11987654321", "ana.souza@example.com", "123.456.789-00", "senhaAna123")'
  ,'INSERT INTO cliente (id, nome, idade, numeroTelefone, email, cpf, senha) VALUES (2, "Carlos Oliveira", 35, "21987654321", "carlos.oliveira@example.com", "987.654.321-00", "senhaCarlos456")'
  ,'INSERT INTO cliente (id, nome, idade, numeroTelefone, email, cpf, senha) VALUES (3, "Maria Silva", 42, "31987654321", "maria.silva@example.com", "456.789.123-00", "senhaMaria789")'

  ]; 
