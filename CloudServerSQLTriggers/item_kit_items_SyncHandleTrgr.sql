delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_item_kit_items;

CREATE TRIGGER insert_item_kit_items BEFORE INSERT ON ospos_item_kit_items FOR EACH ROW
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

