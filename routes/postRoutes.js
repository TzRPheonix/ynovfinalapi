const express = require('express');
const router = express.Router();
const postService = require('../services/postService');

router.get('/user/:userId/posts', async (req, res, next) => {
  try {
    const userId = req.params.userId;
    const posts = await postService.getPostsByUserId(userId);
    res.json(posts);
  } catch (err) {
    next(err);
  }
});

module.exports = router;
