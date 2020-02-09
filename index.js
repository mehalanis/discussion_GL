
/* database*/
var mysql = require('mysql'); 
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database:"gl"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected mysql!");
});

/* fin database */

/* socket io*/
var express = require("express");
var socket =require("socket.io");
var application=express();
var server=application.listen(3000,function() {
  console.log("connceted socket io")
});
application.use(express.static("GL"));
var io=socket(server);
var i=0;
var tab_user_online=[];


io.on("connection", function(v) {
  i++;

  v.on("nouveau_user", function(va) {
	i++;
	 console.log("connedted "+va.nom+" id "+v.id)
   tab_user_online[va.nom]=v.id;

});
  v.on('envoyer_message', function(va){
    console.log("user "+va.idR+" id="+tab_user_online[va.idR]+" message "+va.message);
    var sql = "insert into  message (id_joueur,id_discussion,message , time_send) values ("+va.idj+" , "+va.id_discussion+" , '"+va.message+"' ,now())";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("1 record inserted");
   });

    if(tab_user_online[va.idR]!=null){
      v.to(tab_user_online[va.idR]).emit("reception_message",{message :va.message,idj:va.idj});
    }
    
   });
  v.on('disconnecte', function(va){
     i--;

     console.log("fin "+va.test)
   });


})

