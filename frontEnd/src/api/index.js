async function createUser(user) {
  return await fetch('/api/v1/users', {
    method: 'POST',
    body: JSON.stringify({id: 123, name: "username"}),
    headers: {"Content-Type": "application/json"}
  }).then(function (response) {
    let user = response.json();

    return user;
  });
}

async function getAllUsers() {
  return await fetch('/api/v1/users', {
    method: 'GET',
    headers: {"Content-Type": "application/json"}
  }).then(function (response) {
    let users = response.json();

    return users;
  });
}

async function getUserById(id) {
  return await fetch('/api/v1/users/'+ '3', {
    method: 'GET',
    headers: {"Content-Type": "application/json"}
  }).then(function (response) {
    let user = response.json();

    return user;
  });
}

export default { createUser, getAllUsers, getUserById };
