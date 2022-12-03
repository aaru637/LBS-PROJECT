var ser=require('http');
var file=require('fs');
ser.createServer(function(req,res){
    file.readFile('home.html',function(err,data)
    {
        if (err) throw err;
         res.writeHead(200,{'content-type':'text/html'});
         res.write(data);
         res.end(' thank you');
        console.log('file is read successfully ');
    })
    

}).listen(8080);