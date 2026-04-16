DROP TABLE IF EXISTS colheitas;
DROP TABLE IF EXISTS fazendas;

CREATE TABLE fazendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    localizacao TEXT,
    tamanho_hectares DECIMAL
);

CREATE TABLE colheitas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fazenda_id INTEGER,
    tipo_cultura TEXT,
    data_colheita DATE,
    quantidade_toneladas DECIMAL,
    FOREIGN KEY (fazenda_id) REFERENCES fazendas(id)
);

INSERT INTO fazendas (nome, localizacao, tamanho_hectares) VALUES ('Fazenda Boa Vista', 'Uberlândia', 500);
INSERT INTO fazendas (nome, localizacao, tamanho_hectares) VALUES ('Estância do Sol', 'Araguari', 300);

INSERT INTO colheitas (fazenda_id, tipo_cultura, data_colheita, quantidade_toneladas) VALUES (1, 'Soja', '2026-03-10', 1200);
INSERT INTO colheitas (fazenda_id, tipo_cultura, data_colheita, quantidade_toneladas) VALUES (1, 'Milho', '2026-04-05', 800);
INSERT INTO colheitas (fazenda_id, tipo_cultura, data_colheita, quantidade_toneladas) VALUES (2, 'Soja', '2026-03-15', 750);

SELECT f.nome, f.localizacao, SUM(c.quantidade_toneladas) as total_produzido
FROM fazendas f
JOIN colheitas c ON f.id = c.fazenda_id
GROUP BY f.nome;