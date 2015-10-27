#!/bin/bash

#Set the AutoIncrements proper
mysql --user=root --password=mysql cloudProfitGuruMasterDB  < ./CloudServerSQLTriggers/setGlobalAutoIncmnt_CloudSrvr.sql

#Create Triggers for handling NULL values from Local server JSON's before inserting them into the cloud server

mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/receivings_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/suppliers_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/receivings_items_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/people_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/sale_items_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/items_taxes_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/stock_locations_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/items_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/permissions_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/modules_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/customers_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/item_kit_items_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/sales_SyncHandleTrgr.sql
mysql --user=root --password=mysql cloudProfitGuruMasterDB < ./CloudServerSQLTriggers/item_quantities_SyncHandleTrgr.sql
