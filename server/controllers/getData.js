const Session = require('../models/session');
const Trigger = require('../models/trigger');

exports.postGetData = async (req, res) => {
    const session = await Session.findOne({token: req.body.token});

    await Trigger
        .find({id: session.id})
        .then(async (triggers) => {
            console.log(`Logged the new trigger`);
            res.json({
                "data" : triggers
            })
        })
        .catch(err => {
            console.log(err);
            res.sendStatus(401);
        });
};