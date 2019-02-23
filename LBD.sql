CREATE TABLE tb_cliente(
  id_cliente       INTEGER,
  titulo           CHAR(4),
  nome             VARCHAR(32)CONSTRAINT nn_cliente_nome NOT NULL ,
  sobrenome        VARCHAR(32)CONSTRAINT nn_cliente_sobrenome NOT NULL,
  endereco         VARCHAR(62)CONSTRAINT  nn_cliente_endereco NOT NULL,
  numero           VARCHAR(5)CONSTRAINT  nn_cliente_numero NOT NULL,
  complemento      VARCHAR(62),
  cep              VARCHAR(10),
  cidade           VARCHAR(62)CONSTRAINT nn_cliente_cidade NOT NULL ,
  estado              CHAR(2)CONSTRAINT nn_cliente_estado NOT NULL,
  fone_fixo        VARCHAR(15)CONSTRAINT nn_cliente_fone_fixo NOT NULL ,
  fone_movel       VARCHAR(15)CONSTRAINT nn_cliente_fone_movel NOT NULL ,
  fg_ativo         INTEGER,
  CONSTRAINT pk_cliente_id_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE tb_item(
  id_item INTEGER,
  ds_item VARCHAR(64)CONSTRAINT nn_item_ds_item NOT NULL ,
  preco_custo  NUMERIC(7,2),
  preco_venda  NUMERIC(7,2),
  fg_ativo     INTEGER,
  CONSTRAINT pk_item_id_item PRIMARY KEY (id_item)
);

CREATE TABLE tb_pedido(
  id_pedido INTEGER,
  id_cliente INTEGER CONSTRAINT nn_pedido_id_cliente NOT NULL ,
  dt_compra  TIMESTAMP,
  dt_entrega TIMESTAMP,
  valor      NUMERIC(7,2),
  fg_ativo    INTEGER,
  CONSTRAINT pk_tb_pedido_id_pedido PRIMARY KEY (id_pedido),
  CONSTRAINT fk_tb_pedido_id_cliente FOREIGN KEY (id_cliente)
                      REFERENCES tb_cliente(id_cliente)
);

create table tb_item_pedido(
  id_item integer,
  id_pedido integer constraint nn_item_id_pedido not null,
  quantidade integer ,
  constraint  pk_item_pedido primary key (id_item,id_pedido),
  constraint  fk_item_pedido_id_item foreign key (id_item)
                           references tb_item(id_item),
  constraint fk_item_pedido_id_pedido foreign key (id_pedido)
                           references tb_pedido(id_pedido)
);

create table tb_codigo_barras(
  codigo_barras integer constraint nn_cod_barras_codigo_barras not null ,
  id_item integer constraint nn_cod_barras_id_item not null ,
  constraint fk_cod_barras_id_item foreign key (id_item)
                             references tb_item(id_item)
);

create table  tb_estoque(
  id_item integer,
  quabtidade integer,
  constraint pk_estoque_id_item primary key (id_item),
  constraint  fk_estoque_id_item foreign key (id_item)
                        references tb_item(id_item)
);

INSERT INTO tb_cliente(id_cliente, titulo, nome,
sobrenome, endereco, numero, complemento, cep, cidade,
estado, fone_fixo, fone_movel, fg_ativo)


VALUES

(1, 'Sra', 'Jessica', 'Mendes', 'Avenida Acelino de Leao', '89', NULL,
 '68900 300', 'Macapá', 'AP', '3565 1243', '8765 8999' ,1),


(2, 'Sr', 'Andrei', 'Junqueira', 'Rua Tabaiares', '1024', NULL,
'30150 040', 'Belo Horizonte', 'MG', '3676 1209', '8876 4543',1),


(3, 'Sr', 'Alex', 'Matheus', 'Rua Eva Terpins', 's/n', NULL,
'05327 030', 'São Pualo', 'SP', '6576 0099', '9358 7676', 1);



INSERT INTO tb_cliente(id_cliente, titulo, nome,
sobrenome, endereco, numero, complemento, cep, cidade,
estado, fone_fixo, fone_movel, fg_ativo)

VALUES

(4,'Sr','Andre','Lopes','Rua Fortaleza','552',NULL,
'114356 360','Guaruja', 'SP', '5654 4343', '9821 4321',1),


(5, 'Sr', 'Vitor', 'Silva', 'Estrada Aguá Chata', 's/n','Rodovia 356',
'07251 000', 'Guarulhos', 'SP', '4343 6712', '831 3411', 1),


(6, 'Sr', 'Claudinei', 'Safra', 'Avenida José Osvaldo Marques', '1562', NULL,
'14173 010', 'Sertãozinho', 'SP', '3698 8100', '8131 6409',1),


(7, 'Sr', 'Ricardo', 'Ferreira', 'Alameda Assunta Barizani tienghi', '88', NULL,
'18046 705', 'Sorocaba', 'SP', '6534 7099', '9988 1251',1);




INSERT INTO tb_cliente(id_cliente,titulo,nome,
sobrenome, endereco,numero,complemento,cep,cidade,
estado,fone_fixo,fone_movel,fg_ativo)

VALUES

(8,'Sra','Anna','Kelly','Rua das Acacias','1089',NULL,
'13187 042','Hortolândia', 'SP', '6432 440043', '9465 0023',1),


(9,'Sra','Cristiane','Hickman','Rua Agenir Martinhon Scachetti','300',NULL,
'13341 633','Indaiatuba', 'SP', '35121243', '9987 0001',1),


(10,'Sr', 'Marcos', 'Augusto', 'Avenida Australia', 's/n', NULL,
'06852 100', 'Itapecerica da Serra', 'SP', '3623 8821', '8891 2333', 1),


(11,'Sr','David','Silva','Rua Arcy Prestes Ruggeri','24','Esquina do Mercado',
'4565 9240','Itapetininga', 'SP', '465 9240', '7765 4029',1);





INSERT INTO tb_cliente(id_cliente,titulo,nome,
sobrenome, endereco,numero,complemento,cep,cidade,
estado,fone_fixo,fone_movel,fg_ativo)

VALUES

(12,'Sr','Ricardo','Cunha','Rua Jose Fortunato de Godoy','889',NULL,
'13976 121','Itapira','SP','5467 1959','9244 9584',1),


(13,'Sra','Laura','Batista','Rua Vila Lobos','76',NULL,
'13976 018','Ribeirão Preto','SP', '2111 8710', '9991 2324',1),


(14,'Sr', 'Valmil', 'Feliciano', 'Rua Professor Emilton Amaral',
'961', 'Loteamento Novo Horizonte','58053 223','Joao Pessoa','PB',
 '4431 8740', '9766 0033', 1),


(15,'Sr','Agnaldo','Aparecido','Rua Soldado Celio Toneli','778',NULL,
'114356 360','Santo','Sp', '2386 8092', '99625 3683',1);



select *
from tb_cliente;



INSERT INTO tb_item(id_item,ds_item,preco_custo,
preco_venda,fg_ativo)

VALUES

(1,'Quebra-cabeça de madeira',15.23,21.95,1),

(2,'cubo x',7.45,11.49,1),
(3,'CD linux',1.99,2.49,1),

(4,'Tecidos',2.11,3.99,1),
(5,'moldura',7.54,9.95,1),

(6,'Ventilador pequeno',9.23,15.75,1);




select *
from tb_item;



INSERT INTO tb_item(id_item,ds_item,preco_custo,
preco_venda,fg_ativo)

VALUES

(7,'Ventilador Grande',13.36,19.95,1),

(8,'Escova de Dentes',0.75,1.45,1),

(9,'Papel A4',2.34,2.45,1),

(10,'Saco de Transporte',0.01,0.0,1),

(11,'Alto-Falantes',19.73,25.32,1);




INSERT INTO tb_pedido(id_pedido,id_cliente,dt_compra,dt_entrega,
valor,fg_ativo)

VALUES

(1,3,'13-03-2013','17-03-2013',2.99,1),


(2,8,'23-06-2013','24-06-2013',0.00,1),


(3,15,'02-09-2013','12-09-2013',3.99,1),


(4,13,'03-09-2013','10-09-2013',2.79,1),


(5,8,'21-07-2013','24-07-2013',1.00,1);



select *
from tb_pedido;



INSERT INTO tb_codigo_barras(codigo_barras,id_item)

VALUES

(624152783,1),


(624157463,2),


(626453783,3),


(624152774,4),


(345345867,5),


(643456456,6);



INSERT INTO tb_cliente

VALUES

(16,'Sra','Sidnei','Magal','Rua teste','71',null,'13400 500','Creavinhos','SP',
'4939 2386','8092 6832',1);




INSERT INTO tb_cliente

VALUES

(17,'Sra','Joana','D''arc','Rua Aurora','10',null,'40013 890','Ourinhos','SP',
'4939 2386','8092 6832',1);



INSERT INTO tb_cliente(id_cliente, titulo, nome,
sobrenome, endereco, numero, complemento, cep, cidade,
estado, fone_fixo, fone_movel, fg_ativo)


VALUES

(18,'Sra','Sarah','Martins','Rua Piracicaba','s/n',null,'40013 890','Mococa','SP',
'39227622','9876 2132',1);




INSERT INTO tb_cliente(id_cliente, titulo,sobrenome, nome,
 endereco, numero, cep, cidade,
estado, fone_fixo, fone_movel, fg_ativo)


VALUES

(19,'Sra','Nome_19','Sobrenome_19','Endereco 19','19','1919 191','Cidade 19','SP',
'1919 1919','91919 1919',1),


(20,'Sra','Nome_20','Sobrenome_20','Endereco 20','20','20202 202','Cidade 20','SP',
'2020 2020','20202 2020',1);



select *
from tb_cliente;

insert into tb_item_pedido
values
(4,1,1),
(7,1,1),
(9,1,1),
(1,2,1),
(10,2,1),
(7,2,2);


insert into tb_item_pedido
values
(4,2,2),
(4,3,1),
(1,3,1),
(5,4,2),
(1,5,1),
(3,5,2);

insert into tb_estoque
values
(1,12),
(2,2),
(4,8),
(5,3),
(7,8),
(8,18),
(10,1);

select *
from tb_item;

select cidade,sobrenome
from tb_cliente;

select cidade as "Cidade do Cliente",sobrenome as "Sobrenome do cliente"
from tb_cliente;

select cidade "Cidade do Cliente",sobrenome "Sobrenome do Cliente"
from tb_cliente
order by cidade;

select cidade "cidade do cliente",
       sobrenome "Sorenome do cliente"
from tb_cliente
order by cidade desc ,sobrenome asc ;

