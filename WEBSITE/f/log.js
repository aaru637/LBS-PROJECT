

const { json } = require('express');
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
    res.sendFile(__dirname+'/'+'log in.html')

}).listen(2000)

app.get('/log',function(req,res)
{
    var name=req.query['Userid'];
    var pass=req.query['password']
    co.connect(function (err,req,res) {
        if (err) throw err;
        console.log('database connected');

        // co.query('create table stafflogin(usid varchar(200),password varchar(200))',function()
        // {
        //     if (err) throw err;
        //     console.log(result);})
        // co.query("insert into stafflogin values(name,pass)",function(err){
        //     if (err) throw err;
        //     console.log('values is inserted');
        // })
        
        var query1 = "select * from staff where username = name and password = pass"
        co.query(query1 ,function(err,result,fieled)
        {
            if (err) throw err;
            console.log(result);
            
        h=JSON.stringify(result)

        console.log(h[9]);
        
        res.send(h);

        
})
})})
        
        

        

    
    