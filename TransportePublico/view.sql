DROP MATERIALIZED VIEW IF EXISTS view_passagens_resumo;

CREATE MATERIALIZED VIEW view_passagens_resumo AS
    SELECT
        p.viagem_id,
        COUNT(p.passageiro_id) AS total_passageiros,
        SUM(tf.preco) AS total_arrecadado,
        DATE(p.timestamp) AS data
    FROM
        passagem p
    JOIN
        tarifa tf ON p.tarifa_id = tf.tarifa_id
    GROUP BY
        p.viagem_id, DATE(p.timestamp);

REFRESH MATERIALIZED VIEW view_passagens_resumo;

----------------- Exemplos de consultas ----------------- 

SELECT * FROM view_passagens_resumo
	WHERE data = '2024-12-30';
 	
SELECT 
    viagem_id,
    total_passageiros,
    total_arrecadado
FROM view_passagens_resumo
WHERE data = '2024-12-30';

SELECT 
    total_passageiros,
    total_arrecadado
FROM view_passagens_resumo
WHERE viagem_id = 6;