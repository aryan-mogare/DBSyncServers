delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_items_taxes;

CREATE TRIGGER insert_items_taxes AFTER INSERT ON ospos_items_taxes FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');

SET @name= "";
IF NEW.name IS NOT NULL 
THEN 
SET @name = NEW.name;
END IF;
SET @json = CONCAT(@json, '"name"', ":",'"', @name,'"',',');

SET @percent= "";
IF NEW.percent IS NOT NULL 
THEN 
SET @percent = NEW.percent;
END IF;

SET @json = CONCAT(@json, '"percent"', ":",'"', @percent,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_items_taxes","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_items_taxes;

CREATE TRIGGER update_items_taxes AFTER UPDATE ON ospos_items_taxes FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');

SET @name= "";
IF NEW.name IS NOT NULL
THEN
SET @name = NEW.name;
END IF;
SET @json = CONCAT(@json, '"name"', ":",'"', @name,'"',',');

SET @percent= "";
IF NEW.percent IS NOT NULL
THEN
SET @percent = NEW.percent;
END IF;

SET @json = CONCAT(@json, '"percent"', ":",'"', @percent,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_items_taxes","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_items_taxes;

CREATE TRIGGER delete_items_taxes AFTER DELETE ON ospos_items_taxes FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"item_id"', ":",'"', OLD.item_id,'"',',');

SET @name= "";
IF OLD.name IS NOT NULL
THEN
SET @name = OLD.name;
END IF;
SET @json = CONCAT(@json, '"name"', ":",'"', @name,'"',',');

SET @percent= "";
IF OLD.percent IS NOT NULL
THEN
SET @percent = OLD.percent;
END IF;

SET @json = CONCAT(@json, '"percent"', ":",'"', @percent,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_items_taxes","delete");
END$$
delimiter ;

