delimiter $$ 
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_item_quantities;

CREATE TRIGGER insert_item_quantities BEFORE INSERT ON ospos_item_quantities FOR EACH ROW
BEGIN

IF STRCMP(NEW.item_id, "") = 0 
THEN 
SET NEW.item_id = NULL;
END IF;

IF STRCMP(NEW.quantity, "") = 0 
THEN 
SET NEW.quantity = NULL;
END IF;

END$$
delimiter ;


