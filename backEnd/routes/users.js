var express = require("express");
var router = express.Router();
import userService from "../services/userService.js";

/* GET users listing. */
router.post("/register", function (req, res, next) {
  var user = req.body;
  var res = userService.register(user);
  console.log("success", res);
  res.send("respond with a resource");
});

module.exports = router;
