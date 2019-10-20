const express = require('express');
const router = express.Router();

const passport = require('passport');
const config = require('../config/config');

const getDataControllers = require('../controllers/getData');

router.post('/get-data', passport.authenticate('jwt', config.jwtSession), getDataControllers.postGetData);

module.exports = router;