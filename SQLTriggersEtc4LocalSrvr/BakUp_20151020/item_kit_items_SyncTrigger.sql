delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_item_kit_items;

CREATE TRIGGER insert_item_kit_items AFTER INSERT ON ospos_item_kit_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_kit_id"', ":",'"', NEW.item_kit_id,'"',',');

SET @item_id= "";
IF NEW.item_id IS NOT NULL 
THEN 
SET @item_id = NEW.item_id;
END IF;
SET @json = CONCAT(@json, '"item_id"', ":",'"', @item_id,'"',',');

SET @quantity= "";
IF NEW.quantity IS NOT NULL 
THEN 
SET @quantity = NEW.quantity;
END IF;

SET @json = CONCAT(@json, '"quantity"', ":",'"', @quantity,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_kit_items","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_item_kit_items;

CREATE TRIGGER update_item_kit_items AFTER UPDATE ON ospos_item_kit_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_kit_id"', ":",'"', NEW.item_kit_id,'"',',');

SET @item_id= "";
IF NEW.item_id IS NOT NULL
THEN
SET @item_id = NEW.item_id;
END IF;
SET @json = CONCAT(@json, '"item_id"', ":",'"', @item_id,'"',',');

SET @quantity= "";
IF NEW.quantity IS NOT NULL
THEN
SET @quantity = NEW.quantity;
END IF;

SET @json = CONCAT(@json, '"quantity"', ":",'"', @quantity,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_kit_items","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_item_kit_items;

CREATE TRIGGER delete_item_kit_items AFTER DELETE ON ospos_item_kit_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_kit_id"', ":",'"', OLD.item_kit_id,'"',',');

SET @item_id= "";
IF OLD.item_id IS NOT NULL
THEN
SET @item_id = OLD.item_id;
END IF;
SET @json = CONCAT(@json, '"item_id"', ":",'"', @item_id,'"',',');

SET @quantity= "";
IF OLD.quantity IS NOT NULL
THEN
SET @quantity = OLD.quantity;
END IF;

SET @json = CONCAT(@json, '"quantity"', ":",'"', @quantity,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_kit_items","delete");
END$$
delimiter ;

