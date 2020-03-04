const stars = document.querySelectorAll('#star');
// const audioQuizzCards = document.querySelectorAll('.audio-quizz-card');

if (stars) {
  stars.forEach(star => {
    star.addEventListener('click', (event) => {
      star.classList.toggle("text-warning");
    });
  });
};
