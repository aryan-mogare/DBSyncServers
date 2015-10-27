delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_permissions;

CREATE TRIGGER insert_permissions BEFORE INSERT ON ospos_permissions FOR EACH ROW
BEGIN

IF STRCMP(NEW.location_id, "") = 0 
THEN
SET NEW.location_id = NULL;
END IF;

END$$

