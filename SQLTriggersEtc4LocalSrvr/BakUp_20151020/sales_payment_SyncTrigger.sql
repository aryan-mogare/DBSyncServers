delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_sales_payments;

CREATE TRIGGER insert_sales_payments AFTER INSERT ON ospos_sales_payments FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"payment_type"', ":",'"', NEW.payment_type,'"',',');
SET @json = CONCAT(@json, '"payment_amount"', ":",'"', NEW.payment_amount,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_payments","insert");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.update_sales_payments;

CREATE TRIGGER update_sales_payments AFTER UPDATE ON ospos_sales_payments FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', NEW.sale_id,'"',',');
SET @json = CONCAT(@json, '"payment_type"', ":",'"', NEW.payment_type,'"',',');
SET @json = CONCAT(@json, '"payment_amount"', ":",'"', NEW.payment_amount,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_payments","update");
END$$
delimiter ;

delimiter $$
DROP TRIGGER IF EXISTS ospostest.delete_sales_payments;

CREATE TRIGGER delete_sales_payments AFTER DELETE ON ospos_sales_payments FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"sale_id"', ":",'"', OLD.sale_id,'"',',');
SET @json = CONCAT(@json, '"payment_type"', ":",'"', ODL.payment_type,'"',',');
SET @json = CONCAT(@json, '"payment_amount"', ":",'"', OLD.payment_amount,'"');
SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_sales_payments","delete");
END$$
delimiter ;
