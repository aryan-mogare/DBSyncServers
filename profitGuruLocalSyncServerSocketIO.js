//http://stackoverflow.com/questions/9914816/what-is-an-example-of-the-simplest-possible-socket-io-example
var app =    require("express")();
var server = require('http').Server(app);
var io = require('socket.io')(server);
server.listen(8081);

var mysql     =    require('mysql');

var pool      =    mysql.createPool({
    connectionLimit : 100, //important
    host     : 'localhost',
    user     : 'ospos',
    password : 'ospos',
    database : 'ospostest',
    debug    :  false
});


io.on('connection', function (socket) {
  socket.on('getLocalTxns', function (data) {
  
     pool.getConnection(function(err,connection){
        if (err) {
          connection.release();
          return;
        }

        console.log('connected as id ' + connection.threadId);

        connection.query("select * from  profitGuruLocalTxnJson",function(err,rows){
            connection.release();
            if(!err) {
    		socket.emit('getLocalTxnsResult', rows);
            }
        });

        connection.on('error', function(err) {
              return;
         });
     });
	 
    console.log(data);
  });

  socket.on('DeleteLocalTxnsList', function (txnId2Del) {
    pool.getConnection(function(err,connection){
        if (err) {
          connection.release();
          return;
        }

       console.log('Received DeleteLocalTxnsList= ' + txnId2Del);
       connection.query("delete  from  profitGuruLocalTxnJson where local_txn_id = ?",txnId2Del,function(err,rows){
        connection.release();
        if(!err) {
          console.log("Succesfully deleted the record in profitGuruLocalTxnJson");
            }
        }); 

 
    });

  }); //Endof DeleteLocalTxnsList

});

  


