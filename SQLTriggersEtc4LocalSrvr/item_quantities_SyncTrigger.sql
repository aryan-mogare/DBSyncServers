delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_item_quantities;

CREATE TRIGGER insert_item_quantities AFTER INSERT ON ospos_item_quantities FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"location_id"', ":",'"', NEW.location_id,'"',',');

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
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_quantities","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_item_quantities;

CREATE TRIGGER update_item_quantities AFTER UPDATE ON ospos_item_quantities FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"location_id"', ":",'"', NEW.location_id,'"',',');

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
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_quantities","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_item_quantities;

CREATE TRIGGER delete_item_quantities AFTER DELETE ON ospos_item_quantities FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"location_id"', ":",'"', OLD.location_id,'"',',');

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
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_quantities","delete");
END$$
delimiter ;

