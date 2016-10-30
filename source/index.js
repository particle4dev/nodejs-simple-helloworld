var express = require('express');
var app = express();

var appId = Math.floor((Math.random() * 1000) + 1);

app.get('/', function (req, res) {
  res.send('Hello World! appId=' + appId);
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});
