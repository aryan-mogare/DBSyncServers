delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_grants;

CREATE TRIGGER insert_grants AFTER INSERT ON ospos_grants FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"permission_id"', ":",'"', NEW.permission_id,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_grants","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_grants;

CREATE TRIGGER update_grants AFTER UPDATE ON ospos_grants FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"permission_id"', ":",'"', NEW.permission_id,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_grants","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_grants;

CREATE TRIGGER delete_grants AFTER DELETE ON ospos_grants FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"permission_id"', ":",'"', OLD.permission_id,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', OLD.person_id,'"');
SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_grants","delete");
END$$
delimiter ;
