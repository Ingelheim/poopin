//var app = require('express')();
//var server = require('http').Server(app);
//var io = require('socket.io')(server);
//
//server.listen(80);
//
//app.get('/', function (req, res) {
//    res.sendfile(__dirname + '/index.html');
//});
//
//io.on('connection', function (socket) {
//    socket.emit('news', { hello: 'world' });
//    socket.on('my other event', function (data) {
//        console.log(data);
//    });
//});
var express = require('express')
var app     = express();
var server  = require('http').createServer(app);
var io      = require('socket.io').listen(server);

var sockets = [];

app.get('/', function(req, res){
    res.sendfile(__dirname + '/index.html');
});
//
io.on('connection', function (socket) {
    sockets.push(socket)
    console.log("connection");
    socket.emit('sendData', { test: 'WORKS' });
    socket.emit('sendData2', { test: 'WORKS2' });


    socket.on('neededTestEvent', function (data) {
        console.log("needed test event");
    });

    socket.on('disconnect', function(){
        console.log('user disconnected');
    });

    socket.on('xxx', function (data) {
        console.log(io.sockets.length);
        io.emit('sendData3', { test: 'XXX' });
    });
});

//io.on('xxx', function (socket) {
//    console.log("SSS");
//    socket.emit('sendData3', { test: 'XXX' });
//});


//io.on('connection', function (socket) {
//    console.log("connection");
//    socket.emit('news', { hello: 'world' });
//    //socket.on('my other event', function (data, error) {
//    //    console.log(data);
//    //});
//});

server.listen(8080);