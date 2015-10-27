var Multimap = require('multimap');
var TablePrimKeyMap = new Multimap();
TablePrimKeyMap.set('ospos_items','item_id');
TablePrimKeyMap.set('ospos_item_quantities','item_id');
TablePrimKeyMap.set('ospos_item_quantities','location_id');
TablePrimKeyMap.set('ospos_app_config' ,"key");

//Following 3 tables doesn't have Primary key , as of now using person_id for updates, to check this for future conflicts
TablePrimKeyMap.set('ospos_customers',"person_id");
TablePrimKeyMap.set('ospos_employees',"person_id");
TablePrimKeyMap.set('ospos_suppliers',"person_id");

TablePrimKeyMap.set('ospos_giftcards',"giftcard_id");
TablePrimKeyMap.set('ospos_inventory',"trans_id");
TablePrimKeyMap.set('ospos_items_taxes', "item_id");
TablePrimKeyMap.set('ospos_items_taxes',"name"); 
TablePrimKeyMap.set('ospos_items_taxes',"percent"); 
TablePrimKeyMap.set('ospos_item_kits',"item_kit_id");
TablePrimKeyMap.set('ospos_item_kit_items',"item_kit_id");
TablePrimKeyMap.set('ospos_item_kit_items',"item_id");
TablePrimKeyMap.set('ospos_item_kit_items',"quantity");
TablePrimKeyMap.set('ospos_modules',"module_id");
TablePrimKeyMap.set('ospos_people',"person_id");
TablePrimKeyMap.set('ospos_permissions',"permission_id");
TablePrimKeyMap.set('ospos_grants',"permission_id");
TablePrimKeyMap.set('ospos_grants',"person_id");
TablePrimKeyMap.set('ospos_receivings',"receiving_id");
TablePrimKeyMap.set('ospos_eceivings_items',"receiving_id");
TablePrimKeyMap.set('ospos_eceivings_items',"item_id");
TablePrimKeyMap.set('ospos_eceivings_items',"line");
TablePrimKeyMap.set('ospos_sales',"sale_id");
TablePrimKeyMap.set('ospos_sales_items',"sale_id");
TablePrimKeyMap.set('ospos_sales_items',"item_id");
TablePrimKeyMap.set('ospos_sales_items',"line");
TablePrimKeyMap.set('ospos_sales_items_taxes',"sale_id");
TablePrimKeyMap.set('ospos_sales_items_taxes',"item_id");
TablePrimKeyMap.set('ospos_sales_items_taxes',"line");
TablePrimKeyMap.set('ospos_sales_items_taxes',"name");
TablePrimKeyMap.set('ospos_sales_items_taxes',"percent");
TablePrimKeyMap.set('ospos_sales_payments',"sale_id");
TablePrimKeyMap.set('ospos_sales_payments',"payment_type");
TablePrimKeyMap.set('ospos_sales_suspended',"sale_id");
TablePrimKeyMap.set('ospos_sales_suspended_items',"sale_id");
TablePrimKeyMap.set('ospos_sales_suspended_items',"item_id");
TablePrimKeyMap.set('ospos_sales_suspended_items',"line");
TablePrimKeyMap.set('ospos_sales_suspended_items_taxes',"sale_id");
TablePrimKeyMap.set('ospos_sales_suspended_items_taxes',"item_id");
TablePrimKeyMap.set('ospos_sales_suspended_items_taxes',"line");
TablePrimKeyMap.set('ospos_sales_suspended_items_taxes',"name");
TablePrimKeyMap.set('ospos_sales_suspended_items_taxes',"percent");
TablePrimKeyMap.set('ospos_sales_suspended_payments',"sale_id");
TablePrimKeyMap.set('ospos_sales_suspended_payments',"payment_type");
TablePrimKeyMap.set('ospos_stock_locations',"location_id");

var ioClient = require('socket.io-client');
var sleep = require('sleep');

var mysql     =    require('mysql');

var pool      =    mysql.createPool({
    connectionLimit : 100, //important
    host     : 'localhost',
    user     : 'cloud',
    password : 'cloud',
    database : 'cloudProfitGuruMasterDB',
    debug    :  false
});

var i = 0;
var client = ioClient.connect('http://localhost:8081');
var msg2 = "Give me you local Txns to sync with the Cloud";
client.emit('getLocalTxns', msg2);

client.on('getLocalTxnsResult', function (data) {
  pool.getConnection(function(err,connection){
    if (err) {
          connection.release();
          return;
     }
    
    var recordCount = 0;
    var succsFulTxnIds = [];  
    
    var succsSyncCnt = 0;
    var failSyncCnt = 0;

    while(recordCount < data.length  ){

      console.log("InwhileLoop\n"+data[recordCount].local_txn_json+"\n");
      var action = data[recordCount].local_txn_action; 
      var actionTable = data[recordCount].local_txn_table;
      var actionJsonData = JSON.parse(data[recordCount].local_txn_json) ;
      var actionID = data[recordCount].local_txn_id;

      switch(action){

        case 'insert' :
          console.log("Case insert for table="+data[recordCount].local_txn_table); 
          var queryStatement = "INSERT INTO " + data[recordCount].local_txn_table +" SET ?"; 
          connection.query('SET foreign_key_checks = 0');
          connection.query(queryStatement,actionJsonData,createQueryCallback(actionID,actionTable,connection,action));

        break;

      case 'update' :
          console.log("Case Update");
          var primaryKeys4thisTabl = TablePrimKeyMap.get(data[recordCount].local_txn_table) ;
          console.log("Prim keys"+primaryKeys4thisTabl);
          var preQuery = "UPDATE "+actionTable + " SET ? ";
          var whereCluase = " WHERE ";
          var pKeyCount =  primaryKeys4thisTabl.length;
//        console.log(actionJsonData);
          var i=0;
          var whereCluaseData = "";

          for (var key in actionJsonData) {
            if (actionJsonData.hasOwnProperty(key)) {

              if (primaryKeys4thisTabl.indexOf(key) !== -1 ){
                ++i;
                whereCluaseData =  whereCluaseData + '"'+ actionJsonData[key] + '"';
                whereCluase = whereCluase + key  + " = ?";
                if ( i < pKeyCount ){
                  whereCluaseData =  whereCluaseData + ",";
                  whereCluase = whereCluase + " AND ";
                }
                console.log("Primary key="+key);

                delete actionJsonData[key];
              }
              else
                console.log("Normal column="+key);
              }

            }
//      console.log("whereCluase="+whereCluase);
//    console.log("whereCluaseData="+whereCluaseData);

          var query = preQuery + whereCluase;
          var qData = "[" + JSON.stringify(actionJsonData) + "," + whereCluaseData + "]";

//      console.log("query="+query+"\n"+"qData="+qData);

          connection.query(query,JSON.parse(qData),createQueryCallback(actionID,actionTable,connection,action));

       break;  

      case 'delete' :
//Currently there  no operations that does delete on the table, but just in case of need.
          console.log("Case delete, Needed to be handled"); 
          var primaryKeys4thisTabl = TablePrimKeyMap.get(data[recordCount].local_txn_table) ;
          var preQuery = "DELETE "+actionTable;
          var whereCluase = " WHERE ";
          var pKeyCount =  primaryKeys4thisTabl.length;
          console.log(actionJsonData);
          var i=0;
          var whereCluaseData = "";

          for (var key in actionJsonData) {
            if (actionJsonData.hasOwnProperty(key)) {

              if (primaryKeys4thisTabl.indexOf(key) !== -1 ){
                ++i;
                whereCluaseData =  whereCluaseData + '"'+ actionJsonData[key] + '"';
                whereCluase = whereCluase + key  + " = ?";
                if ( i < pKeyCount ){
                  whereCluaseData =  whereCluaseData + ",";
                  whereCluase = whereCluase + " AND ";
                }
                console.log("Primary key="+key);

                delete actionJsonData[key];
              }
           }

         }
      console.log("whereCluase="+whereCluase);
      console.log("whereCluaseData="+whereCluaseData);

        var query = preQuery + whereCluase;
        var qData = "[" + whereCluaseData + "]";

//      console.log("query="+query+"\n"+"qData="+qData);

          connection.query(query,JSON.parse(qData),createQueryCallback(actionID,actionTable,connection,action));

       break;  

    default:
          console.log("Error this table sync would be missed");
      }
    ++recordCount;

    } //while loop

/*    while( (succsSyncCnt + failSyncCnt) < data.length ){
    console.log("succsSyncCnt="+succsSyncCnt+"failSyncCnt="+failSyncCnt);
      sleep.sleep(1);      
    }
*/
  
  });
});

function createQueryCallback(curTxnId,curTable,connection,action){
    return function(err,res) {
          connection.query('SET foreign_key_checks = 1');
          console.log("Started "+ action+"ing in Table="+curTable);
          if(!err) {
           client.emit('DeleteLocalTxnsList', curTxnId);

          }
          else{
            console.log(err);
            console.log("Finish "+action+ "ing Table="+curTable+":ERROR");
          if(err.code == "ER_DUP_ENTRY" ){
            console.log("Record Already Exists, So lets delete it from Client DB"); 
            //TODO BK need to handle this case
            //client.emit('DeleteLocalTxnsList', curTxnId);
            
          }
  
         }

    }
};
