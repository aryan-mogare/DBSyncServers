delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_sales_items;

CREATE TRIGGER insert_sales_items AFTER INSERT ON ospos_sales_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', NEW.line,'"',',');
SET @json = CONCAT(@json, '"quantity_purchased"', ":",'"', NEW.quantity_purchased,'"',',');
SET @json = CONCAT(@json, '"item_cost_price"', ":",'"', NEW.item_cost_price,'"',',');
SET @json = CONCAT(@json, '"item_unit_price"', ":",'"', NEW.item_unit_price,'"',',');
SET @json = CONCAT(@json, '"discount_percent"', ":",'"', NEW.discount_percent,'"',',');
SET @json = CONCAT(@json, '"item_location"', ":",'"', NEW.item_location,'"');

SET @description = "";
SET @serialnumber = "";

IF NEW.description IS NOT NULL 
THEN 
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, ',"description"', ":",'"',@description, '"');

IF NEW.serialnumber IS NOT NULL 
THEN 
SET @serialnumber = NEW.serialnumber;
END IF;

SET @json = CONCAT(@json, ',"serialnumber"', ":",'"',@serialnumber,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_items","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_sales_items;

CREATE TRIGGER update_sales_items AFTER UPDATE ON ospos_sales_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', NEW.line,'"',',');
SET @json = CONCAT(@json, '"quantity_purchased"', ":",'"', NEW.quantity_purchased,'"',',');
SET @json = CONCAT(@json, '"item_cost_price"', ":",'"', NEW.item_cost_price,'"',',');
SET @json = CONCAT(@json, '"item_unit_price"', ":",'"', NEW.item_unit_price,'"',',');
SET @json = CONCAT(@json, '"discount_percent"', ":",'"', NEW.discount_percent,'"',',');
SET @json = CONCAT(@json, '"item_location"', ":",'"', NEW.item_location,'"');

SET @description = "";
SET @serialnumber = "";

IF NEW.description IS NOT NULL
THEN
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, ',"description"', ":",'"',@description, '"');

IF NEW.serialnumber IS NOT NULL
THEN
SET @serialnumber = NEW.serialnumber;
END IF;

SET @json = CONCAT(@json, ',"serialnumber"', ":",'"',@serialnumber,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_items","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_sales_items;

CREATE TRIGGER delete_sales_items AFTER DELETE ON ospos_sales_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', OLD.sale_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', OLD.item_id,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', OLD.line,'"',',');
SET @json = CONCAT(@json, '"quantity_purchased"', ":",'"', OLD.quantity_purchased,'"',',');
SET @json = CONCAT(@json, '"item_cost_price"', ":",'"', OLD.item_cost_price,'"',',');
SET @json = CONCAT(@json, '"item_unit_price"', ":",'"', OLD.item_unit_price,'"',',');
SET @json = CONCAT(@json, '"discount_percent"', ":",'"', OLD.discount_percent,'"',',');
SET @json = CONCAT(@json, '"item_location"', ":",'"', OLD.item_location,'"');

SET @description = "";
SET @serialnumber = "";

IF OLD.description IS NOT NULL
THEN
SET @description = OLD.description;
END IF;

SET @json = CONCAT(@json, ',"description"', ":",'"',@description, '"');

IF OLD.serialnumber IS NOT NULL
THEN
SET @serialnumber = OLD.serialnumber;
END IF;

SET @json = CONCAT(@json, ',"serialnumber"', ":",'"',@serialnumber,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_items","delete");
END$$
delimiter ;

