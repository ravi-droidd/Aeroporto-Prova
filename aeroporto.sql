CREATE TABLE aeronaves (
id serial PRIMARY KEY,
modelo VARCHAR (100) NOT NULL,
codigo_cauda VARCHAR (10) UNIQUE NOT NULL,
capacidade int CHECK (capacidade > 0)NOT NULL
)

CREATE TABLE pilotos (
id serial PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
codigo_anac VARCHAR (6) UNIQUE NOT NULL,
horas_voo int DEFAULT 0 CHECK (horas_voo >= 0))

CREATE TABLE voos (
id serial PRIMARY KEY,
aeronave_id int REFERENCES aeronaves(id),
piloto_id int REFERENCES pilotos(id),
numero_voo VARCHAR (100) NOT NULL,
origem VARCHAR (100) NOT NULL,
destino VARCHAR (100) NOT NULL,
data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
status VARCHAR(100) DEFAULT 'Agendado' CHECK (status in('Agendado', 'Em voo', 'Concluido', 'Cancelado') ) 


CREATE TABLE passageiros(
id serial PRIMARY KEY,
nome VARCHAR (50) NOT NULL, 
cpf VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR (50) UNIQUE NOT NULL 
)


CREATE TABLE passagens (
id serial PRIMARY KEY,
voo_id int REFERENCES voos(id),
passageiro_id int REFERENCES passageiros(id),
assento VARCHAR (4) NOT NULL,
classe VARCHAR(100) DEFAULT 'Economica' CHECK (classe in('Economica', 'Executiva')),
valor decimal (10 , 2) CHECK (valor > 0) NOT NULL )



insert into aeronaves (modelo, codigo_cauda, capacidade) VALUES
('Boing-712', 'ABC-123', '400'),
('Boing-140', 'ABC-321', '120'),
('Boing-510', 'ABC-234', '50'),
('Boing-720', 'ABC-456', '100'),
('Boing-766', 'ABC-678', '200')


insert into pilotos (nome, codigo_anac, horas_voo) VALUES
('Ravi', '221133' ,'50'),
('Eduardo', '220529', '100'),
('Joaquin', '222067', '20'),
('Bruno', '222100', '10'),
('Arthur', '221020', '60')

insert into passageiros (nome, email, cpf) VALUES
('Willer', 'willer@gmail.com', '124023023046'),
('Henrique','henrique@gmail.com', '25678909082'),
('Jonas', 'jonas@gmail.com', '98767890523'),
('Maria', 'maria@gmail.com', '51672386246'),
('Vitoria', 'vitoria@gmail.com', '62789252487')

insert into voos (aeronave_id, piloto_id, numero_voo, origem, destino, status) VALUES
(1,1, 'Ab-01' , 'São Paulo' , 'Florianopolis', 'Em voo'),
(2,2, 'Ab-02' , 'Rio de Janeiro' , 'São Paulo', 'Agendado'),
(3,3, 'Ab-03' , 'Sao Paulo' , 'Rio de Janeiro', 'Concluido'),
(4,4, 'Ab-04' , 'Sao Paulo' , 'Roraima', 'Cancelado'),
(5,5, 'Ab-05' , 'Florianopolis' , 'São Paulo', 'Agendado')

insert into passagens (voo_id, passageiro_id, assento, classe, valor ) VALUES
(1, 2 , 'J6' , 'Executiva', 850 ),
(2, 3 , 'A1' ,  'Economica', 200 ),
(3, 4, 'B4' ,'Executiva', 850 ),
(5, 6 , 'H1'  ,'Economica', 200 ),
(7, 8 , 'C3' ,'Economica' , 200  )    