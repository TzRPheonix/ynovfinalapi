const db = require('./db');
const helper = require('../helper');

const config = require('../config');

async function getUser(utilisateur) {
  console.log(utilisateur);
  const rows = await db.query(
    `SELECT * from utilisateur WHERE login="${utilisateur.login}" and password="${utilisateur.password}"`
  );
  const data = helper.emptyOrRows(rows);
  if (data.length > 0) {
    const rows = await db.query(
      `SELECT idUser from utilisateur WHERE login="${utilisateur.login}" and password="${utilisateur.password}"`
    );
    const data = helper.emptyOrRows(rows);
    console.log(data[0])
    console.log(data[0].idUser)
    return { message: 'User login successfully', idUser: data[0].idUser};
  } else {
    return { message: 'Invalid login or password' };
  }
}


async function signup(utilisateur) {
  try {
    console.log(utilisateur)
    console.log(utilisateur.pseudo, utilisateur.login, utilisateur.password)
    const result = await db.query(
      `INSERT INTO utilisateur 
        (pseudo, login, password) 
        VALUES 
        ('${utilisateur.pseudo}', '${utilisateur.login}', '${utilisateur.password}')`
    );

    if (result.affectedRows) {
      return { message: 'User created successfully' };
    } else {
      throw new Error('Failed to create user');
    }
  } catch (err) {
    console.error(`Error while creating user`, err.message);
    throw new Error('Failed to create user');
  }
}

async function getPostsByUserId(userId) {
  const sql = `SELECT * FROM post WHERE userId = ?`;
  const params = [userId];
  const [rows] = await db.query(sql, params);
  return rows;
}


module.exports = {
  getUser,
  signup,
  getPostsByUserId,
};
