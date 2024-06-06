//const url = "https://907d5r57-3001.euw.devtunnels.ms/"
const url="http://localhost:3001/";
//const url = "http://  192.168.110.78:3001/";

const newUrl = new URL(window.location.href);
const themeChosen = newUrl.searchParams.get("theme");
const difficultyChosen = newUrl.searchParams.get("niveau");
const nb_questionChosen = parseInt(newUrl.searchParams.get("nbQuestion"), 10);
let tabQuestions = [];
let i = 0;
let score = 0;
let startTime, endTime;
const main = document.querySelector("main");

document.addEventListener("DOMContentLoaded", () => {
  startTime = new Date(); // Start the timer
  refreshtab();
});

function refreshtab() {
  fetch(`${url}question?theme=${themeChosen}&niveau=${difficultyChosen}`, {
    method: "GET",
  })
    .then((resp) => resp.json())
    .then((userData) => {
      tabQuestions = userData.slice(0, nb_questionChosen);
      // Limite le nombre de questions
      if (tabQuestions.length === 0) {
        affichage();
      } else {
        AffichageQuestions(i);
      }
    })
    .catch((error) => console.error("Erreur: ", error));
}

function affichage() {
  const message = document.createElement("h2");
  const text = document.createTextNode(
    "Aucune question pour ce thème et ce niveau pour l'instant"
  );
  message.appendChild(text);
  main.appendChild(message);
}

let userAnswers = []; // Array to store user answers

function AffichageQuestions(index) {
  main.innerHTML = ""; // Effacer le contenu précédent

  const bigdiv = document.createElement("div");
  bigdiv.setAttribute("class", "bigdiv");

  const newDiv = document.createElement("div");
  const question = document.createTextNode(tabQuestions[index].contenu);
  newDiv.appendChild(question);
  bigdiv.appendChild(newDiv);

  tabQuestions[index].propositions.forEach((element, idx) => {
    const newprops = document.createElement("p");
    const textprops = document.createTextNode(element);
    newprops.appendChild(textprops);
    newprops.style.border = "solid black 1px";
    newprops.style.margin = "10px";
    newprops.style.width = "200px";
    newprops.addEventListener("click", () => {
      newprops.classList.add("choix");
      document.querySelectorAll("p").forEach((p) => {
        if (p !== newprops) {
          p.classList.remove("choix");
          p.style.backgroundColor = "white";
        }
      });
      newprops.style.background = "grey";
    });
    newprops.dataset.index = idx; // Add data-index for tracking answer
    bigdiv.appendChild(newprops);
  });

  const btn_valid = document.createElement("button");
  btn_valid.textContent = "Valider";
  btn_valid.addEventListener("click", () => {
    const selected = document.querySelector(".choix");
    if (selected) {
      userAnswers[index] = selected.textContent;
      tabQuestions[index].soumise = selected.textContent;
      if (tabQuestions[index].answer === selected.textContent) {
        score++;
      } else console.log("Rater");
    } else {
      userAnswers[index] = -1; // No answer selected
    }
    i++;
    if (i < tabQuestions.length) {
      AffichageQuestions(i);
    } else {
      endTime = new Date(); // End the timer
      showResults();
    }
  });

  const btn_anull = document.createElement("button");
  btn_anull.textContent = "Annuler";
  btn_anull.addEventListener("click", () => {
    window.location.reload();
  });

  main.appendChild(bigdiv);
  main.appendChild(btn_valid);
  main.appendChild(btn_anull);
}

function showResults() {
  main.innerHTML = ""; // Effacer le contenu précédent

  const message = document.createElement("h2");
  const text = document.createTextNode(
    `Vous avez terminé toutes les questions ! Votre score est ${score}/${tabQuestions.length}.`
  );
  message.appendChild(text);
  main.appendChild(message);

  const timeTaken = (endTime - startTime) / 1000;
  const timeMessage = document.createElement("p");
  const timeText = document.createTextNode(
    `Temps écoulé : ${timeTaken} secondes.`
  );
  timeMessage.appendChild(timeText);
  main.appendChild(timeMessage);

  const btn_corrections = document.createElement("button");
  btn_corrections.textContent = "Voir les corrections";
  btn_corrections.addEventListener("click", showCorrections);

  main.appendChild(btn_corrections);
}
function showCorrections() {
  main.innerHTML = ""; // Effacer le contenu précédent

  tabQuestions.forEach((question, idx) => {
    const questionDiv = document.createElement("div");
    questionDiv.setAttribute("class", "question");

    const questionText = document.createElement("p");
    questionText.textContent = `Q${idx + 1}: ${question.contenu}`;
    questionDiv.appendChild(questionText);

    question.propositions.forEach((prop, propIdx) => {
      const propText = document.createElement("p");
      propText.textContent = prop;

      if (prop === question.answer) {
        propText.classList.add("correct");
      } else if (prop === (question.soumise || -1)) {
        propText.classList.add("incorrect");
      }

      questionDiv.appendChild(propText);
    });

    main.appendChild(questionDiv);
  });

  const btn_restart = document.createElement("button");
  btn_restart.textContent = "Recommencer";
  btn_restart.addEventListener("click", () => {
    window.location.reload();
  });

  main.appendChild(btn_restart);
}
