const express = require('express');
const router = express.Router();
const passport = require('passport');
const config = require('../config/config');

const addDataControllers = require('../controllers/addData');

router.post('/add-data', passport.authenticate('jwt', config.jwtSession), addDataControllers.postAddData);

module.exports = router;