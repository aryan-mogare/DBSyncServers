delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_sales_items_taxes;

CREATE TRIGGER insert_sales_items_taxes AFTER INSERT ON ospos_sales_items_taxes FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', NEW.line,'"',',');
SET @json = CONCAT(@json, '"name"', ":",'"', NEW.name,'"',',');
SET @json = CONCAT(@json, '"percent"', ":",'"', NEW.percent,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_items_taxes","insert");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_sales_items_taxes;

CREATE TRIGGER update_sales_items_taxes AFTER UPDATE ON ospos_sales_items_taxes FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', NEW.line,'"',',');
SET @json = CONCAT(@json, '"name"', ":",'"', NEW.name,'"',',');
SET @json = CONCAT(@json, '"percent"', ":",'"', NEW.percent,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_items_taxes","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_sales_items_taxes;

CREATE TRIGGER delete_sales_items_taxes AFTER DELETE ON ospos_sales_items_taxes FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', OLD.sale_id,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', OLD.item_id,'"',',');
SET @json = CONCAT(@json, '"line"', ":",'"', OLD.line,'"',',');
SET @json = CONCAT(@json, '"name"', ":",'"', OLD.name,'"',',');
SET @json = CONCAT(@json, '"percent"', ":",'"', OLD.percent,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_items_taxes","delete");
END$$
delimiter ;


