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
    });/node

    socket.on('xxx', function (data) {
        console.log(io.sockets.length);
        io.emit('sendData3', { test: 'XXX' });
    });
});

server.listen(8080);