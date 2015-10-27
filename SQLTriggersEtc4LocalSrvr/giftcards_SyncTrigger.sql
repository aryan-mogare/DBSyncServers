
delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_giftcards;

CREATE TRIGGER insert_giftcards AFTER INSERT ON ospos_giftcards FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"record_time"', ":",'"', NEW.record_time,'"',',');
SET @json = CONCAT(@json, '"giftcard_id"', ":",'"', NEW.giftcard_id,'"',',');
SET @json = CONCAT(@json, '"giftcard_number"', ":",'"', NEW.giftcard_number,'"',',');
SET @json = CONCAT(@json, '"value"', ":",'"', NEW.value,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_giftcards","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_giftcards;

CREATE TRIGGER update_giftcards AFTER UPDATE ON ospos_giftcards FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"record_time"', ":",'"', NEW.record_time,'"',',');
SET @json = CONCAT(@json, '"giftcard_id"', ":",'"', NEW.giftcard_id,'"',',');
SET @json = CONCAT(@json, '"giftcard_number"', ":",'"', NEW.giftcard_number,'"',',');
SET @json = CONCAT(@json, '"value"', ":",'"', NEW.value,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_giftcards","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_giftcards;

CREATE TRIGGER delete_giftcards AFTER DELETE ON ospos_giftcards FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"record_time"', ":",'"', OLD.record_time,'"',',');
SET @json = CONCAT(@json, '"giftcard_id"', ":",'"', OLD.giftcard_id,'"',',');
SET @json = CONCAT(@json, '"giftcard_number"', ":",'"', OLD.giftcard_number,'"',',');
SET @json = CONCAT(@json, '"value"', ":",'"', OLD.value,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', OLD.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', OLD.deleted,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_giftcards","delete");
END$$
delimiter ;

