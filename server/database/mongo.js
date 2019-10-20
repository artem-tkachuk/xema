const mongoose = require('mongoose');

const dbUser = require('../keys/credentials');

const mongoUrl = `mongodb+srv://${dbUser.username}:${dbUser.password}@${dbUser.host}/test?retryWrites=true&w=majority`;

const mongo = (app, PORT) => {
    mongoose
        .connect(mongoUrl, {useNewUrlParser: true, useUnifiedTopology: true})
        .then((result, err) => {
            if (!err) {
                console.log('Connected to mongo!');
                app.listen(PORT);
                console.log(`Server listening on port ${PORT}...`);
            }
        })
        .catch(err => console.log(err));
}

module.exports = mongo;
