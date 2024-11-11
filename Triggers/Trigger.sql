---------------------- TRIGGERS ------------------------------

DROP FUNCTION IF EXISTS RecalculateIDX CASCADE;
DROP TRIGGER IF EXISTS updateIDX ON CASCADE;

CREATE OR REPLACE FUNCTION RecalculateIDX()
RETURNS TRIGGER AS $RecalculateIDX$
BEGIN
	UPDATE indice
	SET idx = (NEW.idh_educacao^2 * NEW.idh_longevidade) / NEW.idh_geral
	WHERE codmunicipio = NEW.codmunicipio AND ano = NEW.ano;

    RETURN NEW;
END;
$RecalculateIDX$ LANGUAGE plpgsql;

CREATE TRIGGER updateIDX
AFTER UPDATE
ON indice
FOR EACH ROW
WHEN (OLD.idx = NEW.idx)
EXECUTE PROCEDURE RecalculateIDX();


---------------------- TESTES ------------------------------

SELECT * FROM indice WHERE codmunicipio = 350060;

UPDATE indice SET idh_geral = 0.880 WHERE codmunicipio = 350060;
