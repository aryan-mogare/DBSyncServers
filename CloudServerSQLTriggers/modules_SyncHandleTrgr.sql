delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_modules;

CREATE TRIGGER insert_modules BEFORE INSERT ON ospos_modules FOR EACH ROW
BEGIN
IF STRCMP(NEW.name_lang_key , "") = 0
THEN
SET NEW.name_lang_key = NULL;
END IF;

IF STRCMP(NEW.desc_lang_key , "") = 0
THEN
SET NEW.desc_lang_key = NULL;
END IF;

END$$
delimiter ;

