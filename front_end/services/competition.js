//const url = "https://907d5r57-3001.euw.devtunnels.ms/"
const url="http://localhost:3001/";
//const url = "http://  192.168.110.78:3001/";

const themes = document.querySelector("#Theme");
let tabTheme = [];
let main = document.querySelector("main");
console.log("bonjour");
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

  let lien = generateComptetionLink(
    nb_questionChosen,
    difficultyChosen,
    themeChosen
  );

  //afficherLien(lien);
  window.location.href = lien;
});

function generateComptetionLink(nbQuestions, difficulte, theme) {
  let id = generateUniqueID();
  let Link = `../front_end/quizStart.html?theme=${theme}&niveau=${difficulte}&nbQuestion=${nbQuestions}&id=${id}`;
  return Link;
}
function generateUniqueID() {
  let timastamp = new Date().getTime();
  let randomNum = Math.floor(Math.random() * 10000);
  let uniqueID = timastamp.toString() + randomNum.toString();
  return uniqueID;
}
