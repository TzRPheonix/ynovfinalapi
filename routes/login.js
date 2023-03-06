const express = require('express');
const router = express.Router();
const users = require('../services/userService');

router.post('/', async function(req, res, next) {
  try {
    console.log(req.body)
    res.status(200).json(await users.getUser(req.body));
  } catch (err) {
    console.error(`Error while getting users `, err.message);
    next(err);
  }
});



module.exports = router;