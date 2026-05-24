import mysql from "mysql2/promise";
import config from "../../config/index.js";

export const pool = mysql.createPool({
  host: config.db.host,
  port: config.db.port,
  user: config.db.user,
  database: config.db.database,
  password: config.db.password,
  namedPlaceholders: true,
  connectTimeout: 10000,
  connectionLimit: 10,
  waitForConnections: true,
});

export const query = async (sql, params = {}) => {
  const [rows] = await pool.execute(sql, params);
  return rows;
};
