delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_receivings;

CREATE TRIGGER insert_receivings AFTER INSERT ON ospos_receivings FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"receiving_time"', ":",'"', NEW.receiving_time,'"',',');
SET @json = CONCAT(@json, '"employee_id"', ":",'"', NEW.employee_id,'"',',');
SET @json = CONCAT(@json, '"receiving_id"', ":",'"', NEW.receiving_id,'"',',');
SET @json = CONCAT(@json, '"payment_type"', ":",'"', NEW.payment_type,'"',',');

SET @supplier_id= "";
IF NEW.supplier_id IS NOT NULL 
THEN 
SET @supplier_id = NEW.supplier_id;
END IF;
SET @json = CONCAT(@json, '"supplier_id"', ":",'"', @supplier_id,'"',',');

SET @invoice_number = "";
IF NEW.invoice_number IS NOT NULL 
THEN 
SET @invoice_number = NEW.invoice_number;
END IF;
SET @json = CONCAT(@json, '"invoice_number"', ":",'"', @invoice_number,'"',',');

SET @comment= "";
IF NEW.comment IS NOT NULL 
THEN 
SET @comment = NEW.comment;
END IF;

SET @json = CONCAT(@json, '"comment"', ":",'"', @comment,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_receivings","insert");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_receivings;

CREATE TRIGGER update_receivings AFTER UPDATE ON ospos_receivings FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"receiving_time"', ":",'"', NEW.receiving_time,'"',',');
SET @json = CONCAT(@json, '"employee_id"', ":",'"', NEW.employee_id,'"',',');
SET @json = CONCAT(@json, '"receiving_id"', ":",'"', NEW.receiving_id,'"',',');
SET @json = CONCAT(@json, '"payment_type"', ":",'"', NEW.payment_type,'"',',');

SET @supplier_id= "";
IF NEW.supplier_id IS NOT NULL 
THEN 
SET @supplier_id = NEW.supplier_id;
END IF;
SET @json = CONCAT(@json, '"supplier_id"', ":",'"', @supplier_id,'"',',');

SET @invoice_number = "";
IF NEW.invoice_number IS NOT NULL 
THEN 
SET @invoice_number = NEW.invoice_number;
END IF;
SET @json = CONCAT(@json, '"invoice_number"', ":",'"', @invoice_number,'"',',');

SET @comment= "";
IF NEW.comment IS NOT NULL 
THEN 
SET @comment = NEW.comment;
END IF;

SET @json = CONCAT(@json, '"comment"', ":",'"', @comment,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_receivings","update");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_receivings;

CREATE TRIGGER delete_receivings AFTER DELETE ON ospos_receivings FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"receiving_time"', ":",'"', OLD.receiving_time,'"',',');
SET @json = CONCAT(@json, '"employee_id"', ":",'"', OLD.employee_id,'"',',');
SET @json = CONCAT(@json, '"receiving_id"', ":",'"', OLD.receiving_id,'"',',');
SET @json = CONCAT(@json, '"payment_type"', ":",'"', OLD.payment_type,'"',',');

SET @supplier_id= "";
IF OLD.supplier_id IS NOT NULL 
THEN 
SET @supplier_id = OLD.supplier_id;
END IF;
SET @json = CONCAT(@json, '"supplier_id"', ":",'"', @supplier_id,'"',',');

SET @invoice_number = "";
IF OLD.invoice_number IS NOT NULL 
THEN 
SET @invoice_number = OLD.invoice_number;
END IF;
SET @json = CONCAT(@json, '"invoice_number"', ":",'"', @invoice_number,'"',',');

SET @comment= "";
IF OLD.comment IS NOT NULL 
THEN 
SET @comment = OLD.comment;
END IF;

SET @json = CONCAT(@json, '"comment"', ":",'"', @comment,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_receivings","delete");
END$$
delimiter ;

