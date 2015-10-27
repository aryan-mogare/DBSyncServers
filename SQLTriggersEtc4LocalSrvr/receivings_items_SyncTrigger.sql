delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_receivings_items;

CREATE TRIGGER insert_receivings_items AFTER INSERT ON ospos_receivings_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"receiving_id"', ":",'"', NEW.receiving_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');


SET @json = CONCAT(@json, '"serialnumber"', ":",'"', NEW.serialnumber,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', NEW.line,'"',',');
SET @json = CONCAT(@json, '"quantity_purchased"', ":",'"', NEW.quantity_purchased,'"',',');
SET @json = CONCAT(@json, '"item_cost_price"', ":",'"', NEW.item_cost_price,'"',',');
SET @json = CONCAT(@json, '"item_unit_price"', ":",'"', NEW.item_unit_price,'"',',');
SET @json = CONCAT(@json, '"discount_percent"', ":",'"', NEW.discount_percent,'"',',');
SET @json = CONCAT(@json, '"item_location"', ":",'"', NEW.item_location,'"',',');
SET @json = CONCAT(@json, '"receiving_quantity"', ":",'"', NEW.receiving_quantity,'"',',');

SET @description = "";
IF NEW.description IS NOT NULL 
THEN 
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, ',"description"', ":",'"',@description, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_receivings_items","insert");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_receivings_items;

CREATE TRIGGER update_receivings_items AFTER UPDATE ON ospos_receivings_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"receiving_id"', ":",'"', NEW.receiving_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');
SET @json = CONCAT(@json, '"serialnumber"', ":",'"', NEW.serialnumber,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', NEW.line,'"',',');
SET @json = CONCAT(@json, '"quantity_purchased"', ":",'"', NEW.quantity_purchased,'"',',');
SET @json = CONCAT(@json, '"item_cost_price"', ":",'"', NEW.item_cost_price,'"',',');
SET @json = CONCAT(@json, '"item_unit_price"', ":",'"', NEW.item_unit_price,'"',',');
SET @json = CONCAT(@json, '"discount_percent"', ":",'"', NEW.discount_percent,'"',',');
SET @json = CONCAT(@json, '"item_location"', ":",'"', NEW.item_location,'"',',');
SET @json = CONCAT(@json, '"receiving_quantity"', ":",'"', NEW.receiving_quantity,'"',',');

SET @description = "";
IF NEW.description IS NOT NULL 
THEN 
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, ',"description"', ":",'"',@description, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_receivings_items","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_receivings_items;

CREATE TRIGGER delete_receivings_items AFTER DELETE ON ospos_receivings_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"receiving_id"', ":",'"', OLD.receiving_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', OLD.item_id,'"',',');
SET @json = CONCAT(@json, '"serialnumber"', ":",'"', OLD.serialnumber,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', OLD.line,'"',',');
SET @json = CONCAT(@json, '"quantity_purchased"', ":",'"', OLD.quantity_purchased,'"',',');
SET @json = CONCAT(@json, '"item_cost_price"', ":",'"', OLD.item_cost_price,'"',',');
SET @json = CONCAT(@json, '"item_unit_price"', ":",'"', OLD.item_unit_price,'"',',');
SET @json = CONCAT(@json, '"discount_percent"', ":",'"', OLD.discount_percent,'"',',');
SET @json = CONCAT(@json, '"item_location"', ":",'"', OLD.item_location,'"',',');
SET @json = CONCAT(@json, '"receiving_quantity"', ":",'"', OLD.receiving_quantity,'"',',');

SET @description = "";
IF OLD.description IS NOT NULL 
THEN 
SET @description = OLD.description;
END IF;

SET @json = CONCAT(@json, ',"description"', ":",'"',@description, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_receivings_items","delete");
END$$
delimiter ;

