var userModel = require("../models/user.js");

async function register(user) {
  const res = await userModel.User.register(user);
  return res;
}
async function getAllUsers() {
  const res = await userModel.User.getAllUsers();
  return res;
}
module.exports = { register, getAllUsers };
