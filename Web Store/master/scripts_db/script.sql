-- DROP TABLES
DROP TABLE IF EXISTS ordem CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;
DROP TABLE IF EXISTS loja CASCADE;
DROP TABLE IF EXISTS utilizador CASCADE;
DROP TABLE IF EXISTS produto CASCADE;
DROP TABLE IF EXISTS favorito CASCADE;
DROP TABLE IF EXISTS genero CASCADE;
DROP TABLE IF EXISTS produtoLoja CASCADE;

CREATE TABLE utilizador (
  idUtilizador SERIAL PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  nome TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  dataRegisto DATE NOT NULL,
  morada TEXT NOT NULL,
  cPostal TEXT NOT NULL,
  localidade TEXT NOT NULL,
  nif INT UNIQUE NOT NULL,
  dataNascimento DATE NOT NULL,
  admin BOOLEAN NOT NULL DEFAULT FALSE,
  CHECK (date_part('year', AGE(dataNascimento)) >= 18)
);

CREATE TABLE categoria (
  idCategoria TEXT PRIMARY KEY,
  nome TEXT NOT NULL
);

CREATE TABLE genero (
    idGenero TEXT PRIMARY KEY
);

CREATE TABLE produto (
  idProduto TEXT,
  nome TEXT NOT NULL,
  preco REAL NOT NULL,
  desconto REAL NOT NULL,
  imagem TEXT DEFAULT 'resources/img/products/default/default_image.jpg',
  imagemDestaque TEXT DEFAULT NULL,
  dataLancamento DATE,
  video TEXT,
  descricao TEXT DEFAULT 'No description available yet.',
  requisitos TEXT DEFAULT 'No requirements available yet.',
  categoria TEXT NOT NULL REFERENCES categoria(idCategoria) ON DELETE CASCADE,
  genero TEXT REFERENCES genero(idGenero) DEFAULT NULL,
  PRIMARY KEY(idProduto)
);

CREATE TABLE loja (
  idLoja TEXT,
  localidade TEXT NOT NULL,
  PRIMARY KEY(idLoja)
);

CREATE TABLE produtoLoja (
  unidades INT NOT NULL,
  idProduto TEXT NOT NULL REFERENCES produto(idProduto) ON DELETE CASCADE,
  idLoja TEXT NOT NULL REFERENCES loja(idLoja) ON DELETE CASCADE,
  PRIMARY KEY (idProduto, idLoja)
);

CREATE TABLE ordem (
  idOrdem TEXT PRIMARY KEY,
  comprador INT NOT NULL REFERENCES utilizador(idUtilizador) ON DELETE CASCADE
);

CREATE TABLE review (
  idProduto TEXT NOT NULL REFERENCES produto(idProduto) ON DELETE CASCADE,
  idOrdem TEXT NOT NULL REFERENCES ordem(idOrdem) ON DELETE CASCADE,
  pontuacao REAL NOT NULL,
  PRIMARY KEY (idProduto, idOrdem)
);

CREATE TABLE favorito (
  idProduto TEXT NOT NULL REFERENCES produto(idProduto) ON DELETE CASCADE,
  idUtilizador INT NOT NULL REFERENCES utilizador(idUtilizador) ON DELETE CASCADE,
  PRIMARY KEY (idProduto, idUtilizador)
);

DROP TRIGGER IF EXISTS refresh_mat_view_produto ON produto;
DROP TRIGGER IF EXISTS refresh_mat_view_categoria ON categoria;


DROP MATERIALIZED VIEW IF EXISTS procurar_produto CASCADE;
CREATE MATERIALIZED VIEW procurar_produto AS
  (SELECT
     produtoAux.idProduto,
     setweight(to_tsvector('english', produtoAux.nome), 'A') ||
     setweight(to_tsvector('english', produtoAux.descricao), 'B') ||
     setweight(to_tsvector('english', coalesce(string_agg(DISTINCT produtoAux.categoria, ' '), '')), 'B') as documento
   FROM
     (SELECT
        produto.idProduto, produto.nome, produto.descricao,
        coalesce(string_agg(categoria.nome, ' '), '') AS categoria
      FROM produto
        LEFT JOIN categoria ON categoria.idcategoria = produto.categoria
      GROUP BY produto.idProduto) AS produtoAux
   GROUP BY produtoAux.idProduto, produtoAux.nome, produtoAux.descricao, produtoAux.categoria);


-- SEARCH
DROP INDEX IF EXISTS produtos_indx;
CREATE INDEX produtos_indx ON produto(categoria);

DROP INDEX IF EXISTS procurar_produto_idx CASCADE;
CREATE INDEX procurar_produto_idx ON procurar_produto USING gin(documento);

DROP INDEX IF EXISTS procurar_produto_id_idx CASCADE;
CREATE UNIQUE INDEX procurar_produto_id_idx ON procurar_produto(idProduto);

CREATE OR REPLACE FUNCTION refresh_mat_view()
  RETURNS TRIGGER AS
$BODY$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY procurar_produto;
  RETURN NEW;
END
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER refresh_mat_view_produto
AFTER INSERT OR UPDATE OR DELETE OR TRUNCATE
  ON produto for each statement
EXECUTE PROCEDURE refresh_mat_view();

CREATE TRIGGER refresh_mat_view_categoria
AFTER INSERT OR UPDATE OR DELETE OR TRUNCATE
  ON categoria for each statement
EXECUTE PROCEDURE refresh_mat_view();
