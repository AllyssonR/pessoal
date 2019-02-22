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
