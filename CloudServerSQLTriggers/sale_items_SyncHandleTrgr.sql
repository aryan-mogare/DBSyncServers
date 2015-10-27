delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_sales_items;

CREATE TRIGGER insert_sales_items BEFORE INSERT ON ospos_sales_items FOR EACH ROW
BEGIN

IF STRCMP(NEW.description , "") = 0
THEN
SET NEW.description = NULL;
END IF;


IF STRCMP(NEW.serialnumber , "") = 0
THEN
SET NEW.serialnumber = NULL;
END IF;

END$$
delimiter ;
