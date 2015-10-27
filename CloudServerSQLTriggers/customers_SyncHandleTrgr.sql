delimiter $$ 
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_customer;

CREATE TRIGGER insert_customer BEFORE INSERT ON ospos_customers FOR EACH ROW
BEGIN
IF STRCMP(NEW.account_number, "") = 0 THEN
SET NEW.account_number=NULL ;
END IF;

IF STRCMP(NEW.company_name, "") = 0 THEN
SET NEW.company_name = NULL ;
END IF;

END$$
delimiter ;

