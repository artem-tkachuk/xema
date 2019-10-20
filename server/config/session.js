const session = require("express-session");
const mongoSessionStorage  = require('connect-mongodb-session')(session);

const { mongoUrl, secret } = require('../keys/credentials');

const sessionStorageConfig = {
    uri: mongoUrl,
    collection: 'sessions'
};

const sessionConfig  = () => {
    const store = new mongoSessionStorage(sessionStorageConfig);
    return {
        secret: secret,
        resave: false,
        saveUninitialized: false,
        store: store
        //cookie: {}
    }
};

module.exports = session(sessionConfig());