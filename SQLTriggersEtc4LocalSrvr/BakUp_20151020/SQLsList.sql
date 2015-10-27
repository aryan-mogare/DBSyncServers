#!/bin/bash
mysql --user=root --password=mysql ospostest <./setGlobalAutoIncmnt_LocalSrvr.sql

#Creating the Txn log table for databse syncs
mysql --user=root --password=mysql ospostest <./createTable_profitGuruLocalTxnJson.sql

#Creating the respective triggers to update Txn log table for Master-Master dataBase Sync
mysql --user=root --password=mysql ospostest <./customers_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./sales_payment_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./receivings_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./suppliers_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./item_kits_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./receivings_items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./app_config_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./sales_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./grants_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./people_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./employee_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./sale_items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./items_taxes_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./inventory_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./stock_locations_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLsList.sql
mysql --user=root --password=mysql ospostest <./sales_items_taxes_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./permissions_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./modules_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./giftcards_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./item_kit_items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./item_quantities_SyncTrigger.sql
