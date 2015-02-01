var express = require('express')
var app     = express();
var server  = require('http').createServer(app);
var io      = require('socket.io').listen(server);
var port = process.env.PORT || 8080;

app.get('/', function(req, res){
    res.sendfile(__dirname + '/index.html');
});

function randomNumber() {
    return Math.ceil((Math.random() * 1000 ) + 1)
}

function send() {
    var data = {
        total : "",
        continents: {
            "Europe": randomNumber(),
            "N. America": randomNumber(),
            "S. America": randomNumber(),
            "Asia": randomNumber(),
            "Africa": randomNumber(),
            "Australia": randomNumber()
        }
    };

    io.emit("updatePoopinStats", data)
}

io.on('connection', function (socket) {
    console.log("connection");

    socket.on('initialConnection', function (data) {
        setInterval(function(){ send(); }, 3000);
    });
});

server.listen(8080);