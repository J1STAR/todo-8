function register(user) {
  fetch("/api/register", {
    method: "POST",
    body: JSON.stringify({
      id: 3,
      name: "hello",
    }),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((res) => res.json())
    .then((res) => {
      if (res.result === "ok") {
        console.log("ok");
      } else if (res.result === "fail") {
        console.log("흑흑");
      }
    })
    .catch((e) => {
      throw e;
    });
}

async function getAllUsers() {
  return await fetch("/api/getAllusers")
    .then((res) => res.json())
    .then((res) => {
      if (res.result === "ok") {
        return res.userList;
      } else if (res.result === "fail") {
        return res.message;
      }
    })
    .catch((e) => {
      throw e;
    });
}

export default { register, getAllUsers };
