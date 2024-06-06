let Link = window.location.href;
let main = document.querySelector(".afficheLien");

function afficherLien(lien) {
  main.innerHTML = "";
  let newdiv = document.createElement("div");
  let title = document.createElement("h2");
  let p = document.createElement("p");
  p.style.color = "blue";
  p.style.textShadow = `10px 5px 10px black`;
  let btn_start = document.createElement("button");

  let titleContent = document.createTextNode("Lien de la competition");
  title.appendChild(titleContent);
  let pContent = document.createTextNode(`${lien}`);
  p.appendChild(pContent);
  let icon = document.createElement(`ion-icon`);
  icon.setAttribute("name", "copy-outline");
  let btn_startContent = document.createTextNode("Démarrer la Competition !");
  btn_start.appendChild(btn_startContent);
  newdiv.appendChild(title);
  newdiv.appendChild(p);
  newdiv.appendChild(icon);
  newdiv.appendChild(btn_start);
  main.appendChild(newdiv);

  // Ajouter un gestionnaire d'événements pour rediriger vers la page de compétition
  btn_start.addEventListener("click", function () {
    // Assurez-vous que 'lien' contient l'URL correcte de la page de compétition
    window.location.href = lien;
  });
}

// Fonction pour ajouter un utilisateur à la liste
function ajouterUtilisateur(utilisateur) {
  let utilisateurs = localStorage.getItem("utilisateurs");
  if (!utilisateurs) {
    utilisateurs = [];
  } else {
    utilisateurs = JSON.parse(utilisateurs);
  }
  utilisateurs.push(utilisateur);
  localStorage.setItem("utilisateurs", JSON.stringify(utilisateurs));
}

// Fonction pour afficher la liste des utilisateurs sur la page
function afficherUtilisateurs() {
  let utilisateurs = localStorage.getItem("utilisateurs");
  if (utilisateurs) {
    utilisateurs = JSON.parse(utilisateurs);
    let listeUtilisateurs = document.querySelector(".liste-utilisateurs");
    listeUtilisateurs.innerHTML = "";
    utilisateurs.forEach((utilisateur) => {
      let utilisateurItem = document.createElement("li");
      let text = document.createTextNode(utilisateur);
      utilisateurItem.appendChild(text);
      listeUtilisateurs.appendChild(utilisateurItem);
    });
  } else {
    console.log("il n'y a personne !");
  }
}

function retirerUtilisateur(utilisateur) {
  let utilisateurs = localStorage.getItem("utilisateurs");
  if (utilisateurs) {
    utilisateurs = JSON.parse(utilisateurs);
    const index = utilisateurs.indexOf(utilisateur);
    if (index !== -1) {
      utilisateurs.splice(index, 1);
      localStorage.setItem("utilisateurs", JSON.stringify(utilisateurs));
    }
  }
}

window.addEventListener("beforeunload", function (event) {
  retirerUtilisateur("Utilisateur 1"); // Remplacez 'Utilisateur 1' par l'identifiant de l'utilisateur actuel
});

// Appeler la fonction pour ajouter l'utilisateur actuel
ajouterUtilisateur("Utilisateur 1");

// Appeler la fonction pour afficher les utilisateurs
afficherUtilisateurs();

// Afficher le lien de la compétition
afficherLien(Link);
