delimiter $$ 
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_items;

CREATE TRIGGER insert_items BEFORE INSERT ON ospos_items FOR EACH ROW
BEGIN
IF STRCMP(NEW.supplier_id , "") = 0
THEN
SET NEW.supplier_id = NULL ;
END IF;

IF STRCMP(NEW.category , "") = 0
THEN
SET NEW.category = NULL ;
END IF;

IF STRCMP(NEW.description , "") = 0
THEN
SET NEW.description = NULL ;
END IF;

IF STRCMP(NEW.pic_id , "") = 0
THEN
SET NEW.pic_id = NULL ;
END IF;

IF STRCMP(NEW.custom1 , "") = 0
THEN
SET NEW.custom1 = NULL ;
END IF;


IF STRCMP(NEW.custom2 , "") = 0
THEN
SET NEW.custom2 = NULL ;
END IF;

IF STRCMP(NEW.custom3 , "") = 0
THEN
SET NEW.custom3 = NULL ;
END IF;

IF STRCMP(NEW.custom4 , "") = 0
THEN
SET NEW.custom4 = NULL ;
END IF;

IF STRCMP(NEW.custom5 , "") = 0
THEN
SET NEW.custom5 = NULL ;
END IF;

IF STRCMP(NEW.custom6 , "") = 0
THEN
SET NEW.custom6 = NULL ;
END IF;

IF STRCMP(NEW.custom7 , "") = 0
THEN
SET NEW.custom7 = NULL ;
END IF;

IF STRCMP(NEW.custom8 , "") = 0
THEN
SET NEW.custom8 = NULL ;
END IF;

IF STRCMP(NEW.custom9 , "") = 0
THEN
SET NEW.custom9 = NULL ;
END IF;

IF STRCMP(NEW.custom10 , "") = 0
THEN
SET NEW.custom10 = NULL ;
END IF;

END$$
delimiter ;

