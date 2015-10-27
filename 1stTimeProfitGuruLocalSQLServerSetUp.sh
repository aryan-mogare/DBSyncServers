#!/bin/bash

mysql --user=root --password=mysql ospostest < ./SQLTriggersEtc4LocalSrvr/setGlobalAutoIncmnt_LocalSrvr.sql
#Creating the Txn log table for databse syncs
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/createTable_profitGuruLocalTxnJson.sql
#Creating the respective triggers to update Txn log table for Master-Master dataBase Sync
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/customers_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/sales_payment_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/receivings_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/suppliers_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/item_kits_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/receivings_items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/app_config_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/sales_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/grants_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/people_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/employee_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/sale_items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/items_taxes_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/inventory_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/stock_locations_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/sales_items_taxes_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/permissions_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/modules_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/giftcards_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/item_kit_items_SyncTrigger.sql
mysql --user=root --password=mysql ospostest <./SQLTriggersEtc4LocalSrvr/item_quantities_SyncTrigger.sql
