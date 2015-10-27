delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_items_taxes;

CREATE TRIGGER insert_items_taxes BEFORE INSERT ON ospos_items_taxes FOR EACH ROW
BEGIN
IF STRCMP(NEW.name, "") = 0
THEN
SET NEW.name = NULL;
END IF;

IF STRCMP(NEW.percent, "") = 0
THEN
SET NEW.percent = NULL;
END IF;

END$$
delimiter ;
