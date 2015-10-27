delimiter $$ 
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_receivings_items;

CREATE TRIGGER insert_receivings_items BEFORE INSERT ON ospos_receivings_items FOR EACH ROW
BEGIN
IF STRCMP(NEW.description , "") = 0 THEN
SET NEW.description = NULL ;
END IF;

END$$
delimiter ;

