const express = require('express');
const app = express();
const mongoose = require('mongoose');
const Redis = require('redis');

let redis = null;
let connectedRedis = false;
const appId = Math.floor((Math.random() * 1000) + 1);
let connectedMongo = false;

function connect(uri, options) {
  // http://mongodb.github.io/node-mongodb-native/2.0/api/Server.html#connections
  options.server = options.server ? options.server : {
    socketOptions: { keepAlive: 1 },
  };
  options.auto_reconnect = true;
  const connect = mongoose.createConnection(uri, options);

  // CONNECTION EVENTS
  // When successfully connected
  connect.on('connected', () => {
    console.log(`Mongoose default connection open to ${uri}`);
    connectedMongo = true;
  });

  // If the connection throws an error
  connect.on('error', (err) => {
    console.error(`Failed to connect to DB ${uri} on startup ${err.message}`);
    connectedMongo = false;
  });

  // When the connection is disconnected
  connect.on('disconnected', () => {
    console.warn(`Mongoose default connection to DB : ${uri} disconnected`);
    connectedMongo = false;
  });

  const gracefulExit = () => {
    connect.close(() => {
      console.log(`Mongoose default connection with DB : ${uri} is disconnected through app termination`);
      connectedMongo = false;
      process.exit(0);
    });
  };
  // If the Node process ends, close the Mongoose connection
  process.on('SIGINT', gracefulExit).on('SIGTERM', gracefulExit);

  return connect;
}

connect(`${process.env.MONGO}`, {});

// try connect to redis
try {
  redis = Redis.createClient(`${process.env.REDIS}`);
  redis.on('connect', () => {
    connectedRedis = true;
    console.log(`redis default connection open to ${process.env.REDIS}`);
  });
} catch (e) {
  connectedRedis = false;
  console.error(e.message);
}

process.on('exit', (code) => {
  if (redis && redis.end) {
    redis.end();
  }
  connectedRedis = false;
  redis = null;
});

app.get('/', (req, res) => {
  res.send(`Hello World! appId=${appId},connectedMongo=${connectedMongo.toString()}connectedRedis=${connectedRedis.toString()}`);
});

app.listen(3000, () => {
  console.log('Example app listening on port 3000!');
});
