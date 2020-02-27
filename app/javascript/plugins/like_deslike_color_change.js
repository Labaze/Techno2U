const stars = document.querySelectorAll('.fa-star');
const audioQuizzCards = document.querySelectorAll('.audio-quizz-card');




if (stars) {
  stars.forEach(star => {
    star.addEventListener('click', (event) => {
      star.classList.toggle("text-warning");
    });
  });
};

if (audioQuizzCards) {
  audioQuizzCards.forEach(quizzCard => {
    quizzCard.firstElementChild.addEventListener('click', (event) => {
      quizzCard.firstElementChild.firstElementChild.classList.toggle("text-danger");
    });
  });
};

