delimiter $$ 
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_stock_locations;

CREATE TRIGGER insert_stock_locations BEFORE INSERT ON ospos_stock_locations FOR EACH ROW
BEGIN
IF STRCMP(NEW.location_name, "") = 0 THEN
SET NEW.location_name = NULL ;
END IF;

END$$
delimiter ;

