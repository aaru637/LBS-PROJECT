


var express = require('express');
var ht = require('express')
var app = ht()
var mysql = require('mysql');
var co = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Dhinesh@638',
    database:'library'
})
app.get('/',function(req,res)
{
    res.sendFile(__dirname+'/'+'mainpage.html')
    

}).listen(4000)

app.get('/pro',function(req,res)
{
   console.log('');
    co.connect(function (err) {
        console.log('connected')
           
          if (err) throw err;
                  console.log('database connected');

         
             co.query("select username from student where username='dk123' and password='Dhinesh@638",function(err,result){
             if (err) throw err;
             else{
                console.log('values is inserted');
                res.send('<ol><li>'+result+'</li></ol>');
                
             }
            


         })
        
        

        
})
})
        
        

        

    
    