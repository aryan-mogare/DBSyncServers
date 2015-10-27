delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_app_config;

CREATE TRIGGER insert_app_config AFTER INSERT ON ospos_app_config FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"key"', ":",'"', NEW.key,'"',',');
SET @value= "";
IF NEW.value IS NOT NULL 
THEN 
SET @value = NEW.value;
END IF;

SET @json = CONCAT(@json, '"value"', ":",'"', @value,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_app_config","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_app_config;

CREATE TRIGGER update_app_config AFTER UPDATE ON ospos_app_config FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"key"', ":",'"', NEW.key,'"',',');
SET @value= "";
IF NEW.value IS NOT NULL
THEN
SET @value = NEW.value;
END IF;
SET @json = CONCAT(@json, '"value"', ":",'"', @value,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_app_config","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_app_config;

CREATE TRIGGER delete_app_config AFTER DELETE ON ospos_app_config FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"key"', ":",'"', OLD.key,'"',',');
SET @value= "";
IF OLD.value IS NOT NULL
THEN
SET @value = OLD.value;
END IF;

SET @json = CONCAT(@json, '"value"', ":",'"', @value,'"');
SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_app_config","delete");
END$$
delimiter ;
