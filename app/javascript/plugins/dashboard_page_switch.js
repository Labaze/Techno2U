if (document.querySelector("#parties")){

  const myParties = document.querySelector("#parties");
  const myArtists = document.querySelector("#artists");


  const displayParties = document.querySelector(".display-parties");
  const displayArtists = document.querySelector(".display-artists");
  displayParties.style.display = "";
  displayArtists.style.display = "none";



  myParties.addEventListener("click", (event) => {

    displayParties.style.display = "";
    displayArtists.style.display = "none";

    myParties.classList.add("selected");
    myParties.classList.remove("unselected");
    myArtists.classList.add("unselected");
    myArtists.classList.remove("selected");

  });


  myArtists.addEventListener("click", (event) => {

    displayParties.style.display = "none";
    displayArtists.style.display = "";

    myArtists.classList.add("selected");
    myArtists.classList.remove("unselected");
    myParties.classList.add("unselected");
    myParties.classList.remove("selected");
  });

}
