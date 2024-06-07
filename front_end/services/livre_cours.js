//const url = "https://907d5r57-3001.euw.devtunnels.ms/"
const url = "http://localhost:3001/";
//const url = "http://   192.168.110.78:3001/";
let tabQuestions = [];
let themes = (theme) => document.querySelector(theme);
document.addEventListener("DOMContentLoaded", function () {
  //fetchResources("Java programming language"); // Change this query as needed
  fetchQuestion();
});
function fetchResources(query) {
  fetch(`${url}wikipedia/${query}`)
    .then((response) => response.json())
    .then((data) => {
      const searchResults = data.query.search;
      const resourcesContainer = document.getElementById("resources");
      console.lo;
      searchResults.forEach((result) => {
        const title = result.title;
        const snippet = result.snippet;
        const url = `https://en.wikipedia.org/wiki/${encodeURIComponent(
          title
        )}`;

        const resourceDiv = document.createElement("div");
        resourceDiv.classList.add("resource");
        resourceDiv.innerHTML = `
                <h2><a href="${url}" target="_blank">${title}</a></h2>
                <p>${snippet}</p>
            `;

        resourcesContainer.appendChild(resourceDiv);
      });
    })
    .catch((error) => console.error("Error fetching resources:", error));
}
function fetchQuestion() {
  fetch(`${url}allQuestions`)
    .then((resp) => {
      return resp.json();
    })
    .then((data) => {
      //console.log(data)
      tabQuestions = data;
      let fermer = document.querySelectorAll("#false");
      let ouverir = document.querySelectorAll("#true");

      themes(".sociale").addEventListener("click", () => {
        themes(".sociale").id === "false"
          ? afficherQuestion("sociale")
          : effacerQuestion("sociale");
      });
      themes(".Mathematique").addEventListener("click", () => {
        themes(".Mathematique").id === "false"
        ? afficherQuestion("Mathematique")
        : effacerQuestion("Mathematique");
        });
      themes(".Psychologie").addEventListener("click", () => {
        themes(".Psychologie").id === "false"
        ? afficherQuestion("Psychologie")
        : effacerQuestion("Psychologie");      });
      themes(".Management").addEventListener("click", () => {
        themes(".Management").id === "false"
        ? afficherQuestion("Management")
        : effacerQuestion("Management");       });
      themes(".Sport").addEventListener("click", () => {
        themes(".Sport").id === "false"
        ? afficherQuestion("Sport")
        : effacerQuestion("Sport");      });
      themes(".Programmation").addEventListener("click", () => {
        themes(".Programmation").id === "false"
        ? afficherQuestion("Programmation")
        : effacerQuestion("Programmation");      });

      ouverir.forEach((element) => {
        afficherQuestion(element.getAttribute("class"));
      });
      fermer.forEach((element) => {
        element.innerHTML = "";
        element.textContent = element.getAttribute("class");
      });
    });
}

function afficherQuestion(theme) {
  for (let i = 0; i < tabQuestions.length; i++) {
    if (tabQuestions[i].theme.toLowerCase().includes(theme.toLowerCase())) {
      let p = document.createElement("p");
      p.textContent = tabQuestions[i].contenu;
      themes("." + theme).appendChild(p);
      let btn_savoirPlus = document.createElement("button");
      btn_savoirPlus.textContent = "En savoir plus";
      btn_savoirPlus.addEventListener("click", () => {
        document.querySelector("main").style.display = "none";
        fetchResources(`${tabQuestions[i].answer}`);
      });
      themes("." + theme).appendChild(btn_savoirPlus);
    }
  }
  themes("." + theme).id = "true";
}
function effacerQuestion(theme) {
  themes("." + theme).innerHTML = "";
  themes("." + theme).textContent = themes("." + theme).getAttribute("class");
  themes("." + theme).id = "false";
}
