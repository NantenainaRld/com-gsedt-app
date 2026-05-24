import "dotenv/config";
const envVar = [
  "PORT",
  "DB_NAME",
  "DB_USER",
  "DB_PASSWORD",
  "DB_HOST",
  "DB_PORT",
  "JWT_SECRET",
];

// Verfify if environment variables exist
for (const variable of envVar) {
  if (!process.env[variable] && process.env[variable] !== "") {
    console.log(`Error:: Missing environment variable: ${variable}`);
    process.exit(1);
  }
}

export default {
  port: process.env.PORT,
  db: {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
  },
  jwt: {
    secret: process.env.JWT_SECRET,
  },
};
