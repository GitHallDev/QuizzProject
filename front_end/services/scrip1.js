//const url = "https://907d5r57-3001.euw.devtunnels.ms/";
const url = "http://localhost:3001/";
//const url = "http:// 192.168.199.92:3001/";
let wrapper = document.querySelector(".wrapper");
let LoginLink = document.querySelector(".login_link");
let signupLink = document.querySelector(".signUp_link");
let btnPopup = document.querySelector(".btnPopup");
let iconClose = document.querySelector(".icon_close");
signupLink.addEventListener("click", function () {
  wrapper.classList.add("active");
});
LoginLink.addEventListener("click", function () {
  wrapper.classList.remove("active");
});
btnPopup.addEventListener("click", function () {
  wrapper.classList.add("active_popup");
});
iconClose.addEventListener("click", function () {
  wrapper.classList.remove("active_popup");
});

let formsignUp = document.querySelector("#form_signUp");

let nom = document.querySelector("#Username");
let email = document.querySelector("#email_sign");
let psw = document.querySelector("#psw_sign");

function se_connecter() {}

formsignUp.addEventListener("submit", (e) => {
  e.preventDefault();
  const user = {
    nom: nom.value,
    email: email.value,
    password: psw.value,
  };
  fetch(`${url}users`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(user),
  })
    .then((resp) => {
      return resp.json();
    })
    .then((data) => {
      console.log(data);
      if (data.status === "success") {
        window.Location.href = "option.html"; //alert("incription réussi !");
      } else alert(" L'email est déjà utiliser!");

      //
    })
    .catch((error) => {
      console.error("Erreur: " + error);
    });
});

let formLogin = document.querySelector("#form_login");

let email_login = document.querySelector("#email_login");
let psw_login = document.querySelector("#psw_login");

formLogin.addEventListener("submit", (e) => {
  e.preventDefault();
  const user = {
    nom: null,
    email: email_login.value,
    password: psw_login.value,
  };

  fetch(`${url}usersLogin`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(user),
  })
    .then((resp) => {
      return resp.json();
    })
    .then((data) => {
      console.log(data);
      if (data.status === "success") {
        window.location.href = "option.html"; //alert("incription réussi !");
      } else alert(" Erreur d'Email ou de Mots de passe !");

      //
    })
    .catch((error) => {
      console.error("Erreur: " + error);
    });
});
