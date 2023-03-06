const express = require('express');
const router = express.Router();
const users = require('../services/userService');

router.post('/', async function(req, res, next) {
  try {
    console.log(req.body)
    await users.signup(req.body);
    res.json({ message: 'User created successfully' });
  } catch (err) {
    console.error(`Error while creating user`, err.message);
    next(err);
  }
});


module.exports = router;