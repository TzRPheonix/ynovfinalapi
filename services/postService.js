const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function displayPost(utilisateur) {
    console.log(utilisateur);
    const rows = await db.query(
      `SELECT titre,contenuPost from utilisateur JOIN utilisateur_post USING(idPost) JOIN post USING(idPost) WHERE idUser="${utilisateur.id}"`
    );
    const data = helper.emptyOrRows(rows);
  
    if (data.length > 0) {
      return { message: 'post present' };
    } else {
      return { message: 'no post' };
    }
  }

async function createPost(post) {
    const result = await db.query(
      `INSERT INTO post (titre, contenuPost) VALUES('${post.titre}', '${post.contenuPost}')`,
    );
    console.log(result);
    const message = "Post created successfully";
    return { message };
  }

module.exports = {
  createPost,
  displayPost,
};