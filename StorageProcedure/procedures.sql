CREATE OR REPLACE PROCEDURE
	AddIDXColumn()

	LANGUAGE plpgsql
	AS $$
	BEGIN
		ALTER TABLE indice ADD COLUMN idx numeric(8, 3);
	END;
	$$;


CREATE OR REPLACE PROCEDURE
	CalculateIDX()

	LANGUAGE plpgsql	
	AS $$
	BEGIN
		UPDATE Indice
		SET idx = ((idh_educacao^2 * idh_longevidade) / idh_geral);
	END;
	$$;

CALL AddIDXColumn();
CALL CalculateIDX();
