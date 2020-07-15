"user strict";

const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "0407chan",
  password: "Cxr3044!@#",
  database: "mydb",
});
connection.connect(function (err) {
  if (err) throw err;
});

export default connection;
