const express =require('express');
const body=require('body-parser');
var fs=require('fs');
const { urlencoded } = require('express');
var ht=require('http');
const e = require('express');
var ht=require('http');
var app=express();
var MongoClient = require('mongodb').MongoClient;
app.use(body.urlencoded(
    {
        extended:true
    }
));
app.get('/',function(req,res)
{
    res.sendFile(__dirname+'/'+'log in.html');
})
app.post('/',function(req,res)
{
  
   
    var url = "mongodb://127.0.0.1:27017";
    
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        var dbo = db.db("siva");
        var userid=req.body.userid;
        var username=req.body.username;
        var password=req.body.password;
        var idcard=req.body.idcard;
        var phone=req.body.phone;
        console.log(username);
        console.log(password);
        var myobj = { name: username, password: password,Userid:userid,Phone:phone,Idcard:idcard};
        dbo.collection("studensign").find(myobj, function(err,res) {
          if (err) throw err;
        
         
        
          db.close();
        });
        res.sendFile(__dirname+'/'+'mainpage.html');
       
      });
      
       
    
    
      
      
    

    

}).listen(7000);
