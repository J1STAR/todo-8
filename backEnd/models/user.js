class User {
  constructor(userData) {
    let userId;
    let password;

    this.setId(userData.id);
    this.setPassword(userData.password);

    this.setUserId = function(newUserId) {
      userId = newUserId;
    }

    this.getPassword = function() {
      return password;
    }

    this.setPassword = function(newPassword) {
      name = newPassword;
    }
  }
}

module.exports = { User };
