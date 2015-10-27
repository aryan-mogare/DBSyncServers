
delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_item_kits;

CREATE TRIGGER insert_item_kits AFTER INSERT ON ospos_item_kits FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_kit_id"', ":",'"', NEW.item_kit_id,'"',',');

SET @name= "";
IF NEW.name IS NOT NULL 
THEN 
SET @name = NEW.name;
END IF;
SET @json = CONCAT(@json, '"name"', ":",'"', @name,'"',',');

SET @description= "";
IF NEW.description IS NOT NULL 
THEN 
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, '"description"', ":",'"', @description,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_kits","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_item_kits;

CREATE TRIGGER update_item_kits AFTER UPDATE ON ospos_item_kits FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_kit_id"', ":",'"', NEW.item_kit_id,'"',',');

SET @name= "";
IF NEW.name IS NOT NULL
THEN
SET @name = NEW.name;
END IF;
SET @json = CONCAT(@json, '"name"', ":",'"', @name,'"',',');

SET @description= "";
IF NEW.description IS NOT NULL
THEN
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, '"description"', ":",'"', @description,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_kits","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_item_kits;

CREATE TRIGGER delete_item_kits AFTER DELETE ON ospos_item_kits FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_kit_id"', ":",'"', OLD.item_kit_id,'"',',');

SET @name= "";
IF OLD.name IS NOT NULL
THEN
SET @name = OLD.name;
END IF;
SET @json = CONCAT(@json, '"name"', ":",'"', @name,'"',',');

SET @description= "";
IF OLD.description IS NOT NULL
THEN
SET @description = OLD.description;
END IF;

SET @json = CONCAT(@json, '"description"', ":",'"', @description,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_item_kits","delete");
END$$
delimiter ;

