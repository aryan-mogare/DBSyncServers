delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_inventory;

CREATE TRIGGER insert_inventory AFTER INSERT ON ospos_inventory FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"trans_id"', ":",'"', NEW.trans_id,'"',',');
SET @json = CONCAT(@json, '"trans_items"', ":",'"', NEW.trans_items,'"',',');
SET @json = CONCAT(@json, '"trans_user"', ":",'"', NEW.trans_user,'"',',');
SET @json = CONCAT(@json, '"trans_date"', ":",'"', NEW.trans_date,'"',',');
SET @json = CONCAT(@json, '"trans_comment"', ":",'"', NEW.trans_comment,'"',',');
SET @json = CONCAT(@json, '"trans_location"', ":",'"', NEW.trans_location,'"',',');
SET @json = CONCAT(@json, '"trans_inventory"', ":",'"', NEW.trans_inventory,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_inventory","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_inventory;

CREATE TRIGGER update_inventory AFTER UPDATE ON ospos_inventory FOR EACH ROW
BEGIN
SET @json = '{';

SET @json = CONCAT(@json, '"trans_id"', ":",'"', NEW.trans_id,'"',',');
SET @json = CONCAT(@json, '"trans_items"', ":",'"', NEW.trans_items,'"',',');
SET @json = CONCAT(@json, '"trans_user"', ":",'"', NEW.trans_user,'"',',');
SET @json = CONCAT(@json, '"trans_date"', ":",'"', NEW.trans_date,'"',',');
SET @json = CONCAT(@json, '"trans_comment"', ":",'"', NEW.trans_comment,'"',',');
SET @json = CONCAT(@json, '"trans_location"', ":",'"', NEW.trans_location,'"',',');
SET @json = CONCAT(@json, '"trans_inventory"', ":",'"', NEW.trans_inventory,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_inventory","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_inventory;

CREATE TRIGGER delete_inventory AFTER DELETE ON ospos_inventory FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"trans_id"', ":",'"', OLD.trans_id,'"',',');
SET @json = CONCAT(@json, '"trans_items"', ":",'"', OLD.trans_items,'"',',');
SET @json = CONCAT(@json, '"trans_user"', ":",'"', OLD.trans_user,'"',',');
SET @json = CONCAT(@json, '"trans_date"', ":",'"', OLD.trans_date,'"',',');
SET @json = CONCAT(@json, '"trans_comment"', ":",'"', OLD.trans_comment,'"',',');
SET @json = CONCAT(@json, '"trans_location"', ":",'"', OLD.trans_location,'"',',');
SET @json = CONCAT(@json, '"trans_inventory"', ":",'"', OLD.trans_inventory,'"');
SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_inventory","delete");
END$$
delimiter ;
