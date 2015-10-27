delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_customer;

CREATE TRIGGER insert_customer AFTER INSERT ON ospos_customers FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"',',');
SET @json = CONCAT(@json, '"taxable"', ":",'"', NEW.taxable,'"',',');
SET @accnt_num = "";
SET @comp_name = "";
IF NEW.account_number IS NOT NULL 
THEN 
SET @accnt_num = NEW.account_number ;
END IF;

SET @json = CONCAT(@json, ',"account_number"', ":",'"',@accnt_num, '"',',');

IF NEW.company_name IS NOT NULL 
THEN 
SET @comp_name = NEW.company_name;
END IF;

SET @json = CONCAT(@json, ',"company_name"', ":",'"',@comp_name,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_customers","insert");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_customer;

CREATE TRIGGER update_customer AFTER UPDATE ON ospos_customers FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"person_id"', ":",'"', NEW.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"',',');
SET @json = CONCAT(@json, '"taxable"', ":",'"', NEW.taxable,'"',',');
SET @accnt_num = "";
SET @comp_name = "";
IF NEW.account_number IS NOT NULL 
THEN 
SET @accnt_num = NEW.account_number ;
END IF;

SET @json = CONCAT(@json, ',"account_number"', ":",'"',@accnt_num, '"',',');

IF NEW.account_number IS NOT NULL 
THEN 
SET @comp_name = NEW.company_name;
END IF;

SET @json = CONCAT(@json, ',"company_name"', ":",'"',@comp_name,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_customers","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_customer;

CREATE TRIGGER delete_customer AFTER DELETE ON ospos_customers FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"person_id"', ":",'"', OLD.person_id,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', OLD.deleted,'"',',');
SET @json = CONCAT(@json, '"taxable"', ":",'"', OLD.taxable,'"',',');
SET @accnt_num = "";
SET @comp_name = "";
IF OLD.account_number IS NOT NULL
THEN
SET @accnt_num = OLD.account_number ;
END IF;

SET @json = CONCAT(@json, ',"account_number"', ":",'"',@accnt_num, '"',',');

IF OLD.account_number IS NOT NULL
THEN
SET @comp_name = OLD.company_name;
END IF;

SET @json = CONCAT(@json, ',"company_name"', ":",'"',@comp_name,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_customers","delete");
END$$
delimiter ;
