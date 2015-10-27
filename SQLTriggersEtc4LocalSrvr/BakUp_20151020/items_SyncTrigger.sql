
delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.insert_items;

CREATE TRIGGER insert_items AFTER INSERT ON ospos_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"name"', ":",'"', NEW.name,'"',',');

SET @category= "";
IF NEW.category IS NOT NULL
THEN
SET @category = NEW.category;
END IF;

SET @json = CONCAT(@json, '"category"', ":",'"', @category,'"',',');

SET @supplier_id = "";
IF NEW.supplier_id IS NOT NULL
THEN
SET @supplier_id = NEW.supplier_id;
END IF;

SET @json = CONCAT(@json, '"supplier_id"', ":",'"', @supplier_id,'"',',');
SET @json = CONCAT(@json, '"item_number"', ":",'"', NEW.item_number,'"',',');

SET @description = "";
IF NEW.description IS NOT NULL
THEN
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, '"description"', ":",'"', @description,'"',',');
SET @json = CONCAT(@json, '"cost_price"', ":",'"', NEW.cost_price,'"',',');
SET @json = CONCAT(@json, '"unit_price"', ":",'"', NEW.unit_price,'"',',');

SET @json = CONCAT(@json, '"reorder_level"', ":",'"', NEW.reorder_level,'"',',');
SET @json = CONCAT(@json, '"receiving_quantity"', ":",'"', NEW.receiving_quantity,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');

SET @pic_id = "";
IF NEW.pic_id IS NOT NULL
THEN
SET @pic_id = NEW.pic_id;
END IF;

SET @json = CONCAT(@json, '"pic_id"', ":",'"', @pic_id,'"',',');
SET @json = CONCAT(@json, '"allow_alt_description"', ":",'"', NEW.allow_alt_description,'"',',');
SET @json = CONCAT(@json, '"is_serialized"', ":",'"', NEW.is_serialized,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"',',');

SET @custom1 = "";
IF NEW.custom1 IS NOT NULL
THEN
SET @custom1 = NEW.custom1;
END IF;
SET @json = CONCAT(@json, '"custom1"', ":",'"', @custom1,'"',',');


SET @custom2 = "";
IF NEW.custom2 IS NOT NULL
THEN
SET @custom2 = NEW.custom2;
END IF;
SET @json = CONCAT(@json, '"custom2"', ":",'"', @custom2,'"',',');

SET @custom3 = "";
IF NEW.custom3 IS NOT NULL
THEN
SET @custom3 = NEW.custom3;
END IF;
SET @json = CONCAT(@json, '"custom3"', ":",'"', @custom3,'"',',');

SET @custom4 = "";
IF NEW.custom4 IS NOT NULL
THEN
SET @custom4 = NEW.custom4;
END IF;
SET @json = CONCAT(@json, '"custom4"', ":",'"', @custom4,'"',',');

SET @custom5 = "";
IF NEW.custom5 IS NOT NULL
THEN
SET @custom5 = NEW.custom5;
END IF;
SET @json = CONCAT(@json, '"custom5"', ":",'"', @custom5,'"',',');

SET @custom6 = "";
IF NEW.custom6 IS NOT NULL
THEN
SET @custom6 = NEW.custom6;
END IF;
SET @json = CONCAT(@json, '"custom6"', ":",'"', @custom6,'"',',');

SET @custom7 = "";
IF NEW.custom7 IS NOT NULL
THEN
SET @custom7 = NEW.custom7;
END IF;
SET @json = CONCAT(@json, '"custom7"', ":",'"', @custom7,'"',',');

SET @custom8 = "";
IF NEW.custom8 IS NOT NULL
THEN
SET @custom8 = NEW.custom8;
END IF;
SET @json = CONCAT(@json, '"custom8"', ":",'"', @custom8,'"',',');

SET @custom9 = "";
IF NEW.custom9 IS NOT NULL
THEN
SET @custom9 = NEW.custom9;
END IF;
SET @json = CONCAT(@json, '"custom9"', ":",'"', @custom9,'"',',');

SET @custom10 = "";
IF NEW.custom10 IS NOT NULL
THEN
SET @custom10 = NEW.custom10;
END IF;
SET @json = CONCAT(@json, '"custom10"', ":",'"', @custom10,'"');


SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_items","insert");
END$$
delimiter ;



delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.update_items;

CREATE TRIGGER update_items AFTER UPDATE ON ospos_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"name"', ":",'"', NEW.name,'"',',');

SET @category= "";
IF NEW.category IS NOT NULL
THEN
SET @category = NEW.category;
END IF;

SET @json = CONCAT(@json, '"category"', ":",'"', @category,'"',',');

SET @supplier_id = "";
IF NEW.supplier_id IS NOT NULL
THEN
SET @supplier_id = NEW.supplier_id;
END IF;

SET @json = CONCAT(@json, '"supplier_id"', ":",'"', @supplier_id,'"',',');
SET @json = CONCAT(@json, '"item_number"', ":",'"', NEW.item_number,'"',',');

SET @description = "";
IF NEW.description IS NOT NULL
THEN
SET @description = NEW.description;
END IF;

SET @json = CONCAT(@json, '"description"', ":",'"', @description,'"',',');
SET @json = CONCAT(@json, '"cost_price"', ":",'"', NEW.cost_price,'"',',');
SET @json = CONCAT(@json, '"unit_price"', ":",'"', NEW.unit_price,'"',',');

SET @json = CONCAT(@json, '"reorder_level"', ":",'"', NEW.reorder_level,'"',',');
SET @json = CONCAT(@json, '"receiving_quantity"', ":",'"', NEW.receiving_quantity,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', NEW.item_id,'"',',');

SET @pic_id = "";
IF NEW.pic_id IS NOT NULL
THEN
SET @pic_id = NEW.pic_id;
END IF;

SET @json = CONCAT(@json, '"pic_id"', ":",'"', @pic_id,'"',',');
SET @json = CONCAT(@json, '"allow_alt_description"', ":",'"', NEW.allow_alt_description,'"',',');
SET @json = CONCAT(@json, '"is_serialized"', ":",'"', NEW.is_serialized,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', NEW.deleted,'"',',');

SET @custom1 = "";
IF NEW.custom1 IS NOT NULL
THEN
SET @custom1 = NEW.custom1;
END IF;
SET @json = CONCAT(@json, '"custom1"', ":",'"', @custom1,'"',',');


SET @custom2 = "";
IF NEW.custom2 IS NOT NULL
THEN
SET @custom2 = NEW.custom2;
END IF;
SET @json = CONCAT(@json, '"custom2"', ":",'"', @custom2,'"',',');

SET @custom3 = "";
IF NEW.custom3 IS NOT NULL
THEN
SET @custom3 = NEW.custom3;
END IF;
SET @json = CONCAT(@json, '"custom3"', ":",'"', @custom3,'"',',');

SET @custom4 = "";
IF NEW.custom4 IS NOT NULL
THEN
SET @custom4 = NEW.custom4;
END IF;
SET @json = CONCAT(@json, '"custom4"', ":",'"', @custom4,'"',',');

SET @custom5 = "";
IF NEW.custom5 IS NOT NULL
THEN
SET @custom5 = NEW.custom5;
END IF;
SET @json = CONCAT(@json, '"custom5"', ":",'"', @custom5,'"',',');

SET @custom6 = "";
IF NEW.custom6 IS NOT NULL
THEN
SET @custom6 = NEW.custom6;
END IF;
SET @json = CONCAT(@json, '"custom6"', ":",'"', @custom6,'"',',');

SET @custom7 = "";
IF NEW.custom7 IS NOT NULL
THEN
SET @custom7 = NEW.custom7;
END IF;
SET @json = CONCAT(@json, '"custom7"', ":",'"', @custom7,'"',',');

SET @custom8 = "";
IF NEW.custom8 IS NOT NULL
THEN
SET @custom8 = NEW.custom8;
END IF;
SET @json = CONCAT(@json, '"custom8"', ":",'"', @custom8,'"',',');

SET @custom9 = "";
IF NEW.custom9 IS NOT NULL
THEN
SET @custom9 = NEW.custom9;
END IF;
SET @json = CONCAT(@json, '"custom9"', ":",'"', @custom9,'"',',');

SET @custom10 = "";
IF NEW.custom10 IS NOT NULL
THEN
SET @custom10 = NEW.custom10;
END IF;
SET @json = CONCAT(@json, '"custom10"', ":",'"', @custom10,'"');


SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_items","update");
END$$
delimiter ;

delimiter $$ 
DROP TRIGGER IF EXISTS ospostest.delete_items;

CREATE TRIGGER delete_items AFTER DELETE ON ospos_items FOR EACH ROW
BEGIN
SET @json = '{';
SET @json = CONCAT(@json, '"name"', ":",'"', OLD.name,'"',',');

SET @category= "";
IF OLD.category IS NOT NULL
THEN
SET @category = OLD.category;
END IF;

SET @json = CONCAT(@json, '"category"', ":",'"', @category,'"',',');

SET @supplier_id = "";
IF OLD.supplier_id IS NOT NULL
THEN
SET @supplier_id = OLD.supplier_id;
END IF;

SET @json = CONCAT(@json, '"supplier_id"', ":",'"', @supplier_id,'"',',');
SET @json = CONCAT(@json, '"item_number"', ":",'"', OLD.item_number,'"',',');

SET @description = "";
IF OLD.description IS NOT NULL
THEN
SET @description = OLD.description;
END IF;

SET @json = CONCAT(@json, '"description"', ":",'"', @description,'"',',');
SET @json = CONCAT(@json, '"cost_price"', ":",'"', OLD.cost_price,'"',',');
SET @json = CONCAT(@json, '"unit_price"', ":",'"', OLD.unit_price,'"',',');

SET @json = CONCAT(@json, '"reorder_level"', ":",'"', OLD.reorder_level,'"',',');
SET @json = CONCAT(@json, '"receiving_quantity"', ":",'"', OLD.receiving_quantity,'"',',');
SET @json = CONCAT(@json, '"item_id"', ":",'"', OLD.item_id,'"',',');

SET @pic_id = "";
IF OLD.pic_id IS NOT NULL
THEN
SET @pic_id = OLD.pic_id;
END IF;

SET @json = CONCAT(@json, '"pic_id"', ":",'"', @pic_id,'"',',');
SET @json = CONCAT(@json, '"allow_alt_description"', ":",'"', OLD.allow_alt_description,'"',',');
SET @json = CONCAT(@json, '"is_serialized"', ":",'"', OLD.is_serialized,'"',',');
SET @json = CONCAT(@json, '"deleted"', ":",'"', OLD.deleted,'"',',');

SET @custom1 = "";
IF OLD.custom1 IS NOT NULL
THEN
SET @custom1 = OLD.custom1;
END IF;
SET @json = CONCAT(@json, '"custom1"', ":",'"', @custom1,'"',',');


SET @custom2 = "";
IF OLD.custom2 IS NOT NULL
THEN
SET @custom2 = OLD.custom2;
END IF;
SET @json = CONCAT(@json, '"custom2"', ":",'"', @custom2,'"',',');

SET @custom3 = "";
IF OLD.custom3 IS NOT NULL
THEN
SET @custom3 = OLD.custom3;
END IF;
SET @json = CONCAT(@json, '"custom3"', ":",'"', @custom3,'"',',');

SET @custom4 = "";
IF OLD.custom4 IS NOT NULL
THEN
SET @custom4 = OLD.custom4;
END IF;
SET @json = CONCAT(@json, '"custom4"', ":",'"', @custom4,'"',',');

SET @custom5 = "";
IF OLD.custom5 IS NOT NULL
THEN
SET @custom5 = OLD.custom5;
END IF;
SET @json = CONCAT(@json, '"custom5"', ":",'"', @custom5,'"',',');

SET @custom6 = "";
IF OLD.custom6 IS NOT NULL
THEN
SET @custom6 = OLD.custom6;
END IF;
SET @json = CONCAT(@json, '"custom6"', ":",'"', @custom6,'"',',');

SET @custom7 = "";
IF OLD.custom7 IS NOT NULL
THEN
SET @custom7 = OLD.custom7;
END IF;
SET @json = CONCAT(@json, '"custom7"', ":",'"', @custom7,'"',',');

SET @custom8 = "";
IF OLD.custom8 IS NOT NULL
THEN
SET @custom8 = OLD.custom8;
END IF;
SET @json = CONCAT(@json, '"custom8"', ":",'"', @custom8,'"',',');

SET @custom9 = "";
IF OLD.custom9 IS NOT NULL
THEN
SET @custom9 = OLD.custom9;
END IF;
SET @json = CONCAT(@json, '"custom9"', ":",'"', @custom9,'"',',');

SET @custom10 = "";
IF OLD.custom10 IS NOT NULL
THEN
SET @custom10 = OLD.custom10;
END IF;
SET @json = CONCAT(@json, '"custom10"', ":",'"', @custom10,'"');


SET @json = CONCAT(@json, "}");
INSERT INTO profitGuruLocalTxnJson(local_txn_json,local_txn_table,local_txn_action) VALUES (@json,"ospos_items","delete");
END$$
delimiter ;

