CREATE MATERIALIZED VIEW vw_passagens_resumo AS
    SELECT
        p.linha_id,
        COUNT(p.passageiro_id) AS total_passageiros,
        SUM(pg.preco) AS total_arrecadado,
        DATE(p.data_hora) AS data
    FROM
        passagem p
    JOIN
        pagamento pg ON p.pagamento_id = pg.pagamento_id
    GROUP BY
        p.linha_id, DATE(p.data_hora);