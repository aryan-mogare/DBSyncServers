delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_modules;

CREATE TRIGGER insert_modules AFTER INSERT ON ospos_modules FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"module_id"', ":",'"', NEW.module_id,'"',',');
SET @json = CONCAT(@json, '"sort"', ":",'"', NEW.sort,'"',',');

SET @name_lang_key= "";
IF NEW.name_lang_key IS NOT NULL 
THEN 
SET @name_lang_key = NEW.name_lang_key;
END IF;
SET @json = CONCAT(@json, '"name_lang_key"', ":",'"', @name_lang_key,'"',',');

SET @desc_lang_key= "";
IF NEW.desc_lang_key IS NOT NULL 
THEN 
SET @desc_lang_key = NEW.desc_lang_key;
END IF;

SET @json = CONCAT(@json, '"desc_lang_key"', ":",'"', @desc_lang_key,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_modules","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_modules;

CREATE TRIGGER update_modules AFTER UPDATE ON ospos_modules FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"module_id"', ":",'"', NEW.module_id,'"',',');
SET @json = CONCAT(@json, '"sort"', ":",'"', NEW.sort,'"',',');

SET @name_lang_key= "";
IF NEW.name_lang_key IS NOT NULL
THEN
SET @name_lang_key = NEW.name_lang_key;
END IF;
SET @json = CONCAT(@json, '"name_lang_key"', ":",'"', @name_lang_key,'"',',');

SET @desc_lang_key= "";
IF NEW.desc_lang_key IS NOT NULL
THEN
SET @desc_lang_key = NEW.desc_lang_key;
END IF;

SET @json = CONCAT(@json, '"desc_lang_key"', ":",'"', @desc_lang_key,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_modules","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_modules;

CREATE TRIGGER delete_modules AFTER DELETE ON ospos_modules FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"module_id"', ":",'"', OLD.module_id,'"',',');
SET @json = CONCAT(@json, '"sort"', ":",'"', OLD.sort,'"',',');

SET @name_lang_key= "";
IF OLD.name_lang_key IS NOT NULL
THEN
SET @name_lang_key = OLD.name_lang_key;
END IF;
SET @json = CONCAT(@json, '"name_lang_key"', ":",'"', @name_lang_key,'"',',');

SET @desc_lang_key= "";
IF OLD.desc_lang_key IS NOT NULL
THEN
SET @desc_lang_key = OLD.desc_lang_key;
END IF;

SET @json = CONCAT(@json, '"desc_lang_key"', ":",'"', @desc_lang_key,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_modules","delete");
END$$
delimiter ;

