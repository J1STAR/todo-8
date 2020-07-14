import MainService from "./lib/mainService.js";
console.log("what's different? what? hello?");
window.addEventListener("DOMContentLoaded", () => {
  const targetEl = document.querySelector("#app");
  const service = new MainService({ targetEl });
  const datalist = [1, 2, 3, 4, [5, 6, [7]]];
  service.init(datalist.flat(2));

  targetEl.innerHTML += `datalist is ${service.dataList} Yes`;
});
