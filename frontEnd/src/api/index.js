function getUser() {
  fetch("/api/register", {
    method: "POST",
    body: JSON.stringify({
      id,
      password,
      passwordCheck,
      name,
      email_username,
      email_provider,
      phone,
      agree_essential: agreeEssential,
      phone_auth,
    }),
    headers: {
      "Content-Type": "application/json",
    },
  })
    .then((res) => res.json())
    .then((res) => {
      if (res.result === "checkFail") {
        checkAllValidation(res.checkList);
      } else if (res.result === "ok") {
        window.location.href = "/complete_register";
      } else if (res.result === "alreadyExist") {
        showErrorMessage("이미 존재하는 아이디입니다.");
      }
    })
    .catch((e) => {
      throw e;
    });
}
