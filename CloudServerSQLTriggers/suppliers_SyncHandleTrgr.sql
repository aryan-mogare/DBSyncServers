delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_supplier;

CREATE TRIGGER insert_supplier BEFORE INSERT ON ospos_suppliers FOR EACH ROW
BEGIN

IF STRCMP(NEW.agency_name, "") = 0
THEN
SET NEW.agency_name = NULL;
END IF;

IF STRCMP(NEW.account_number, "") = 0
THEN
SET NEW.account_number = NULL;
END IF;


IF STRCMP(NEW.company_name, "") = 0
THEN
SET NEW.company_name = NULL;
END IF;

END$$
delimiter ;

