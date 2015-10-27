delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_permissions;

CREATE TRIGGER insert_permissions AFTER INSERT ON ospos_permissions FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"permission_id"', ":",'"', NEW.permission_id,'"',',');
SET @json = CONCAT(@json, '"module_id"', ":",'"', NEW.module_id,'"',',');

SET @location_id = "";
IF NEW.location_id IS NOT NULL 
THEN 
SET @location_id = NEW.location_id;
END IF;

SET @json = CONCAT(@json, ',"location_id"', ":",'"',@location_id, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_permissions","insert");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_permissions;

CREATE TRIGGER update_permissions AFTER UPDATE ON ospos_permissions FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"permission_id"', ":",'"', NEW.permission_id,'"',',');
SET @json = CONCAT(@json, '"module_id"', ":",'"', NEW.module_id,'"',',');

SET @location_id = "";
IF NEW.location_id IS NOT NULL 
THEN 
SET @location_id = NEW.location_id;
END IF;

SET @json = CONCAT(@json, ',"location_id"', ":",'"',@location_id, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_permissions","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_permissions;

CREATE TRIGGER delete_permissions AFTER DELETE ON ospos_permissions FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"permission_id"', ":",'"', OLD.permission_id,'"',',');
SET @json = CONCAT(@json, '"module_id"', ":",'"', OLD.module_id,'"',',');

SET @location_id = "";
IF OLD.location_id IS NOT NULL 
THEN 
SET @location_id = OLD.location_id;
END IF;

SET @json = CONCAT(@json, ',"location_id"', ":",'"',@location_id, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_permissions","delete");
END$$
delimiter ;

