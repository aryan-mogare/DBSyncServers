delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_stock_location;

CREATE TRIGGER insert_stock_location AFTER INSERT ON ospos_stock_locations FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"location_id"', ":",'"', NEW.location_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"',',');

SET @location_name = "";

IF NEW.location_name IS NOT NULL 
THEN 
SET @location_name = NEW.location_name;
END IF;

SET @json = CONCAT(@json, ',"location_name"', ":",'"',@location_name, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_stock_locations","insert");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_stock_location;

CREATE TRIGGER update_stock_location AFTER UPDATE ON ospos_stock_locations FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"location_id"', ":",'"', NEW.location_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"',',');

SET @location_name = "";

IF NEW.location_name IS NOT NULL
THEN
SET @location_name = NEW.location_name;
END IF;

SET @json = CONCAT(@json, ',"location_name"', ":",'"',@location_name, '"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_stock_locations","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_stock_location;

CREATE TRIGGER delete_stock_location AFTER DELETE ON ospos_stock_locations FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"location_id"', ":",'"', OLD.location_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', OLD.deleted,'"',',');

SET @location_name = "";
IF OLD.location_name IS NOT NULL
THEN
SET @location_name = OLD.location_name;
END IF;

SET @json = CONCAT(@json, ',"location_name"', ":",'"',@location_name, '"');


SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_stock_locations","delete");
END$$
delimiter ;
