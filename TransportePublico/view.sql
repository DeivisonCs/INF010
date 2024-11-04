DROP MATERIALIZED VIEW IF EXISTS view_passagens_resumo;

CREATE MATERIALIZED VIEW view_passagens_resumo AS
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

REFRESH MATERIALIZED VIEW view_passagens_resumo;


----------------- Exemplos de consultas ----------------- 

SELECT * FROM view_passagens_resumo
	WHERE data = '2024-11-01';
 	
SELECT 
    linha_id,
    total_passageiros,
    total_arrecadado
FROM view_passagens_resumo
WHERE data = '2024-11-01';

SELECT 
    total_passageiros,
    total_arrecadado
FROM view_passagens_resumo
WHERE linha_id = 1;
