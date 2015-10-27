
delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_people;

CREATE TRIGGER insert_people AFTER INSERT ON ospos_people FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"first_name"', ":",'"', NEW.first_name,'"');
SET @json = CONCAT(@json, ',"gender"', ":",'"', NEW.gender,'"');

SET @last_name = "";
IF NEW.last_name IS NOT NULL 
THEN 
SET @last_name= NEW.last_name;
END IF;

SET @json = CONCAT(@json, ',"last_name"', ":",'"',@last_name, '"');

SET @phone_number = "";
IF NEW.phone_number IS NOT NULL 
THEN 
SET @phone_number = NEW.phone_number;
END IF;
SET @json = CONCAT(@json, ',"phone_number"', ":",'"',@phone_number,'"');


SET @email = "";
IF NEW.email IS NOT NULL 
THEN 
SET @email = NEW.email;
END IF;
SET @json = CONCAT(@json, ',"email"', ":",'"',@email,'"');

SET @address_1 = "";
IF NEW.address_1 IS NOT NULL 
THEN 
SET @address_1 = NEW.address_1 ;
END IF;
SET @json = CONCAT(@json, ',"address_1"', ":",'"',@address_1,'"');

SET @address_2 = "";
IF NEW.address_2 IS NOT NULL 
THEN 
SET @address_2 = NEW.address_2;
END IF;
SET @json = CONCAT(@json, ',"address_2"', ":",'"',@address_2,'"');


SET @city = "";
IF NEW.city IS NOT NULL 
THEN 
SET @city = NEW.city;
END IF;
SET @json = CONCAT(@json, ',"city"', ":",'"',@city,'"');


SET @state = "";
IF NEW.state IS NOT NULL 
THEN 
SET @state = NEW.state;
END IF;
SET @json = CONCAT(@json, ',"state"', ":",'"',@state,'"');


SET @zip = "";
IF NEW.zip IS NOT NULL 
THEN 
SET @zip = NEW.zip;
END IF;
SET @json = CONCAT(@json, ',"zip"', ":",'"',@zip,'"');


SET @country = "";
IF NEW.country IS NOT NULL 
THEN 
SET @country = NEW.country;
END IF;
SET @json = CONCAT(@json, ',"country"', ":",'"',@country,'"');

SET @comments = "";
IF NEW.comments IS NOT NULL 
THEN 
SET @comments = NEW.comments;
END IF;
SET @json = CONCAT(@json, ',"comments"', ":",'"',@comments,'"');



SET @json = CONCAT(@json, ',"person_id"', ":",'"', NEW.person_id,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_people","insert");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_people;

CREATE TRIGGER update_people AFTER UPDATE ON ospos_people FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"first_name"', ":",'"', NEW.first_name,'"');
SET @json = CONCAT(@json, ',"gender"', ":",'"', NEW.gender,'"');

SET @last_name = "";
IF NEW.last_name IS NOT NULL 
THEN 
SET @last_name= NEW.last_name;
END IF;

SET @json = CONCAT(@json, ',"last_name"', ":",'"',@last_name, '"');

SET @phone_number = "";
IF NEW.phone_number IS NOT NULL 
THEN 
SET @phone_number = NEW.phone_number;
END IF;
SET @json = CONCAT(@json, ',"phone_number"', ":",'"',@phone_number,'"');


SET @email = "";
IF NEW.email IS NOT NULL 
THEN 
SET @email = NEW.email;
END IF;
SET @json = CONCAT(@json, ',"email"', ":",'"',@email,'"');

SET @address_1 = "";
IF NEW.address_1 IS NOT NULL 
THEN 
SET @address_1 = NEW.address_1 ;
END IF;
SET @json = CONCAT(@json, ',"address_1"', ":",'"',@address_1,'"');

SET @address_2 = "";
IF NEW.address_2 IS NOT NULL 
THEN 
SET @address_2 = NEW.address_2;
END IF;
SET @json = CONCAT(@json, ',"address_2"', ":",'"',@address_2,'"');


SET @city = "";
IF NEW.city IS NOT NULL 
THEN 
SET @city = NEW.city;
END IF;
SET @json = CONCAT(@json, ',"city"', ":",'"',@city,'"');


SET @state = "";
IF NEW.state IS NOT NULL 
THEN 
SET @state = NEW.state;
END IF;
SET @json = CONCAT(@json, ',"state"', ":",'"',@state,'"');


SET @zip = "";
IF NEW.zip IS NOT NULL 
THEN 
SET @zip = NEW.zip;
END IF;
SET @json = CONCAT(@json, ',"zip"', ":",'"',@zip,'"');


SET @country = "";
IF NEW.country IS NOT NULL 
THEN 
SET @country = NEW.country;
END IF;
SET @json = CONCAT(@json, ',"country"', ":",'"',@country,'"');

SET @comments = "";
IF NEW.comments IS NOT NULL 
THEN 
SET @comments = NEW.comments;
END IF;
SET @json = CONCAT(@json, ',"comments"', ":",'"',@comments,'"');



SET @json = CONCAT(@json, ',"person_id"', ":",'"', NEW.person_id,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_people","update");
END$$
delimiter ;


delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_people;

CREATE TRIGGER delete_people AFTER DELETE ON ospos_people FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"first_name"', ":",'"', OLD.first_name,'"');
SET @json = CONCAT(@json, ',"gender"', ":",'"', OLD.gender,'"');

SET @last_name = "";
IF OLD.last_name IS NOT NULL 
THEN 
SET @last_name= OLD.last_name;
END IF;

SET @json = CONCAT(@json, ',"last_name"', ":",'"',@last_name, '"');

SET @phone_number = "";
IF OLD.phone_number IS NOT NULL 
THEN 
SET @phone_number = OLD.phone_number;
END IF;
SET @json = CONCAT(@json, ',"phone_number"', ":",'"',@phone_number,'"');


SET @email = "";
IF OLD.email IS NOT NULL 
THEN 
SET @email = OLD.email;
END IF;
SET @json = CONCAT(@json, ',"email"', ":",'"',@email,'"');

SET @address_1 = "";
IF OLD.address_1 IS NOT NULL 
THEN 
SET @address_1 = OLD.address_1 ;
END IF;
SET @json = CONCAT(@json, ',"address_1"', ":",'"',@address_1,'"');

SET @address_2 = "";
IF OLD.address_2 IS NOT NULL 
THEN 
SET @address_2 = OLD.address_2;
END IF;
SET @json = CONCAT(@json, ',"address_2"', ":",'"',@address_2,'"');


SET @city = "";
IF OLD.city IS NOT NULL 
THEN 
SET @city = OLD.city;
END IF;
SET @json = CONCAT(@json, ',"city"', ":",'"',@city,'"');


SET @state = "";
IF OLD.state IS NOT NULL 
THEN 
SET @state = OLD.state;
END IF;
SET @json = CONCAT(@json, ',"state"', ":",'"',@state,'"');


SET @zip = "";
IF OLD.zip IS NOT NULL 
THEN 
SET @zip = OLD.zip;
END IF;
SET @json = CONCAT(@json, ',"zip"', ":",'"',@zip,'"');


SET @country = "";
IF OLD.country IS NOT NULL 
THEN 
SET @country = OLD.country;
END IF;
SET @json = CONCAT(@json, ',"country"', ":",'"',@country,'"');

SET @comments = "";
IF OLD.comments IS NOT NULL 
THEN 
SET @comments = OLD.comments;
END IF;
SET @json = CONCAT(@json, ',"comments"', ":",'"',@comments,'"');



SET @json = CONCAT(@json, ',"person_id"', ":",'"', OLD.person_id,'"');

SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_people","delete");
END$$
delimiter ;

