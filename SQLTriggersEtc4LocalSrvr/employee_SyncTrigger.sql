delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_employees;

CREATE TRIGGER insert_employees AFTER INSERT ON ospos_employees FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"username"', ":",'"', NEW.username,'"',',');
SET @json = CONCAT(@json, '"password"', ":",'"', NEW.password,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_employees","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_employees;

CREATE TRIGGER update_employees AFTER UPDATE ON ospos_employees FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"username"', ":",'"', NEW.username,'"',',');
SET @json = CONCAT(@json, '"password"', ":",'"', NEW.password,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_employees","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_employees;

CREATE TRIGGER delete_employees AFTER DELETE ON ospos_employees FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"username"', ":",'"', OLD.username,'"',',');
SET @json = CONCAT(@json, '"password"', ":",'"', OLD.password,'"',',');
SET @json = CONCAT(@json, '"person_id"', ":",'"', OLD.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', OLD.deleted,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_employees","delete");
END$$
delimiter ;

