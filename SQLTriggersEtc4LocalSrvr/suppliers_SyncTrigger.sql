delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_supplier;

CREATE TRIGGER insert_supplier AFTER INSERT ON ospos_suppliers FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"');

SET @agency_name = "";

IF NEW.agency_name IS NOT NULL
THEN
SET @agency_name = NEW.agency_name;
END IF;

SET @json = CONCAT(@json, ',"agency_name"', ":",'"',@agency_name, '"');

SET @accnt_num = "";
SET @comp_name = "";
IF NEW.account_number IS NOT NULL 
THEN 
SET @accnt_num = NEW.account_number ;
END IF;

SET @json = CONCAT(@json, ',"account_number"', ":",'"',@accnt_num, '"');

IF NEW.company_name IS NOT NULL 
THEN 
SET @comp_name = NEW.company_name;
END IF;

SET @json = CONCAT(@json, ',"company_name"', ":",'"',@comp_name,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_suppliers","insert");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_supplier;

CREATE TRIGGER update_supplier AFTER UPDATE ON ospos_suppliers FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"');

SET @agency_name = "";
IF NEW.agency_name IS NOT NULL
THEN
SET @agency_name = NEW.agency_name;
END IF;

SET @json = CONCAT(@json, ',"agency_name"', ":",'"',@agency_name, '"');

SET @accnt_num = "";
SET @comp_name = "";
IF NEW.account_number IS NOT NULL 
THEN 
SET @accnt_num = NEW.account_number ;
END IF;

SET @json = CONCAT(@json, ',"account_number"', ":",'"',@accnt_num, '"');

IF NEW.account_number IS NOT NULL 
THEN 
SET @comp_name = NEW.company_name;
END IF;

SET @json = CONCAT(@json, ',"company_name"', ":",'"',@comp_name,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_suppliers","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_supplier;

CREATE TRIGGER delete_supplier AFTER DELETE ON ospos_suppliers FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"person_id"', ":",'"', OLD.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', OLD.deleted,'"');

SET @agency_name = "";
IF OLD.agency_name IS NOT NULL
THEN
SET @agency_name = OLD.agency_name;
END IF;

SET @json = CONCAT(@json, ',"agency_name"', ":",'"',@agency_name, '"');

SET @accnt_num = "";
SET @comp_name = "";
IF OLD.account_number IS NOT NULL
THEN
SET @accnt_num = OLD.account_number ;
END IF;

SET @json = CONCAT(@json, ',"account_number"', ":",'"',@accnt_num, '"');

IF OLD.account_number IS NOT NULL
THEN
SET @comp_name = OLD.company_name;
END IF;

SET @json = CONCAT(@json, ',"company_name"', ":",'"',@comp_name,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_suppliers","delete");
END$$
delimiter ;
