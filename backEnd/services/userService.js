import userModel from "../models/user.js";

async function register(user) {
  const res = await userModel.register(user);
  console.log(res);
}

export default { register };
