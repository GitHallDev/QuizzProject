//const url = "https://907d5r57-3001.euw.devtunnels.ms/"
const url="http://localhost:3001/";
//const url = "http://   192.168.110.78:3001/";

const themes = document.querySelector("#Theme");
let tabTheme = [];

fetch(url, { method: "GET" })
  .then((resp) => resp.json())
  .then((userData) => {
    tabTheme = userData;
    affichertheme(tabTheme);
  })
  .catch((error) => {
    console.error("Error: ", error);
  });
function affichertheme(tab) {
  tab.forEach((element) => {
    const newoption = document.createElement("option");
    const text = document.createTextNode(element.sujet);
    newoption.value = element.sujet;
    newoption.appendChild(text);
    themes.appendChild(newoption);
  });
}

const difficulty = document.querySelector("#difficulte");
let themeChosen;
let difficultyChosen;
let nb_questionChosen;

const nb_question = document.querySelector("#nb_questions");

const formulaire = document.querySelector("form");
formulaire.addEventListener("submit", (e) => {
  e.preventDefault();
  nb_questionChosen = nb_question.value;
  difficultyChosen = difficulty.value;
  themeChosen = themes.value;
  window.location.href = `../front_end/quiz.html?theme=${themeChosen}&niveau=${difficultyChosen}&nbQuestion=${nb_questionChosen}`;
});
