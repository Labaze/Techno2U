const myParties = document.querySelector("#parties");
const myArtists = document.querySelector("#artists");

displayParties = document.querySelector(".display-parties");
displayParties.style.display = "";
displayArtists = document.querySelector(".display-artists");
displayArtists.style.display = "none";
myParties.innerText = "• My parties";
myArtists.innerText = "My artists";


myParties.addEventListener("click", (event) => {

  displayParties = document.querySelector(".display-parties");
  displayParties.style.display = "";

  displayArtists = document.querySelector(".display-artists");
  displayArtists.style.display = "none";

  myParties.innerText = "• My parties";
  myArtists.innerText = "My artists";

});


myArtists.addEventListener("click", (event) => {

  displayArtists = document.querySelector(".display-parties");
  displayArtists.style.display = "none";

  displayArtists = document.querySelector(".display-artists");
  displayArtists.style.display = "";

  myParties.innerText = "My parties";
  myArtists.innerText = "• My artists";
});

