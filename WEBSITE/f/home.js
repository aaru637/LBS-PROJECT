console.log('hi ')
var ht = require('express')
var app = ht()

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/' + 'home.html');

}).listen(8080);
