delimiter $$ 
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_sales;

CREATE TRIGGER insert_sales BEFORE INSERT ON ospos_sales FOR EACH ROW
BEGIN

IF STRCMP(NEW.customer_id, "") = 0 THEN
SET NEW.customer_id = NULL ;
END IF;

IF STRCMP(NEW.comment, "") = 0 THEN
SET NEW.comment = NULL ;
END IF;

IF STRCMP(NEW.invoice_number, "") = 0 THEN
SET NEW.invoice_number = NULL ;
END IF;

END$$
delimiter ;

