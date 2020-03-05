if (document.querySelector(".star-button")){
  const cards = document.querySelectorAll(".card");
  cards.forEach(card => {
    console.log(card.children[0].href)
    card.children[0].addEventListener("click", (event) => {
      console.log(card.children[0].href);
      const title = card.children[2];
      console.log(title);
    });
  });
};
