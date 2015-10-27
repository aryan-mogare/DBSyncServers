delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_sales;

CREATE TRIGGER insert_sales AFTER INSERT ON ospos_sales FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"employee_id"', ":",'"', NEW.employee_id,'"',',');
SET @json = CONCAT(@json, '"sale_time"', ":",'"', NEW.sale_time,'"');
SET @customer_id = "";
SET @comment = "";
SET @invoice_number = "";
IF NEW.customer_id IS NOT NULL 
THEN 
SET @customer_id = NEW.customer_id;
END IF;

SET @json = CONCAT(@json, ',"customer_id"', ":",'"',@customer_id, '"');

IF NEW.comment IS NOT NULL 
THEN 
SET @comment = NEW.comment;
END IF;

SET @json = CONCAT(@json, ',"comment"', ":",'"',@comment,'"');

IF NEW.invoice_number IS NOT NULL 
THEN 
SET @invoice_number = NEW.invoice_number;
END IF;

SET @json = CONCAT(@json, ',"invoice_number"', ":",'"',@invoice_number,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json) VALUES (@json );
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_sales;

CREATE TRIGGER update_sales AFTER UPDATE ON ospos_sales FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"employee_id"', ":",'"', NEW.employee_id,'"',',');
SET @json = CONCAT(@json, '"sale_time"', ":",'"', NEW.sale_time,'"');
SET @customer_id = "";
SET @comment = "";
SET @invoice_number = "";
IF NEW.customer_id IS NOT NULL
THEN
SET @customer_id = NEW.customer_id;
END IF;

SET @json = CONCAT(@json, ',"customer_id"', ":",'"',@customer_id, '"');

IF NEW.comment IS NOT NULL
THEN
SET @comment = NEW.comment;
END IF;

SET @json = CONCAT(@json, ',"comment"', ":",'"',@comment,'"');

IF NEW.invoice_number IS NOT NULL
THEN
SET @invoice_number = NEW.invoice_number;
END IF;

SET @json = CONCAT(@json, ',"invoice_number"', ":",'"',@invoice_number,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json) VALUES (@json );
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_sales;

CREATE TRIGGER delete_sales AFTER DELETE ON ospos_sales FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', OLD.sale_id,'"',',');
SET @json = CONCAT(@json, '"employee_id"', ":",'"', OLD.employee_id,'"',',');
SET @json = CONCAT(@json, '"sale_time"', ":",'"', OLD.sale_time,'"');
SET @customer_id = "";
SET @comment = "";
SET @invoice_number = "";

IF OLD.customer_id IS NOT NULL
THEN
SET @customer_id = OLD.customer_id;
END IF;

SET @json = CONCAT(@json, ',"customer_id"', ":",'"',@customer_id, '"');

IF OLD.comment IS NOT NULL
THEN
SET @comment = OLD.comment;
END IF;

SET @json = CONCAT(@json, ',"comment"', ":",'"',@comment,'"');

IF OLD.invoice_number IS NOT NULL
THEN
SET @invoice_number = OLD.invoice_number;
END IF;

SET @json = CONCAT(@json, ',"invoice_number"', ":",'"',@invoice_number,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json) VALUES (@json );
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales","delete");
END$$
delimiter ;

