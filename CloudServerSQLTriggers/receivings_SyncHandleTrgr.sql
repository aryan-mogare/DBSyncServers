delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_receivings;

CREATE TRIGGER insert_receivings BEFORE INSERT ON ospos_receivings FOR EACH ROW
BEGIN

IF STRCMP(NEW.supplier_id , "") = 0
THEN
SET NEW.supplier_id = NULL;
END IF;

IF STRCMP(NEW.invoice_number , "") = 0
THEN
SET NEW.invoice_number = NULL;
END IF;

IF STRCMP(NEW.comment , "") = 0
THEN
SET NEW.comment =NULL;
END IF;

END$$
delimiter ;
