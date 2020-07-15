"user strict";

import sql from "../config/database.js";

var User = function (user) {
  this.id = user.id;
  this.name = user.name;
};

User.createUser = function (newUser, result) {
  sql.query("insert into user set ?", newUser, function (err, res) {
    if (err) {
      console.log("error: ", err);
      result(err, null);
    } else {
      console.log(res.insertId);
      result(null, res.insertId);
    }
  });
};

export default User;
