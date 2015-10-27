delimiter $$
DROP TRIGGER IF EXISTS cloudProfitGuruMasterDB.insert_people;

CREATE TRIGGER insert_people BEFORE INSERT ON ospos_people FOR EACH ROW
BEGIN
IF STRCMP(NEW.last_name, "") = 0
THEN
SET NEW.last_name = NULL;
END IF;

IF STRCMP(NEW.phone_number, "") = 0
THEN
SET NEW.phone_number = NULL;
END IF;


IF STRCMP(NEW.email, "") = 0
THEN
SET NEW.email = NULL;
END IF;

IF STRCMP(NEW.address_1, "") = 0
THEN
SET NEW.address_1 = NULL;
END IF;

IF STRCMP(NEW.address_2, "") = 0
THEN
SET NEW.address_2 = NULL;
END IF;


IF STRCMP(NEW.city, "") = 0
THEN
SET NEW.city = NULL;
END IF;


IF STRCMP(NEW.state, "") = 0
THEN
SET NEW.state = NULL;
END IF;


IF STRCMP(NEW.zip, "") = 0
THEN
SET NEW.zip = NULL;
END IF;

IF STRCMP(NEW.country, "") = 0
THEN
SET NEW.country = NULL;
END IF;

IF STRCMP(NEW.comments, "") = 0
THEN
SET NEW.comments = NULL;
END IF;

END$$
delimiter ;

