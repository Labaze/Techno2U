const stars = document.querySelectorAll('.fa-star');

if (stars) {
  stars.forEach(star => {
    star.addEventListener('click', (event) => {
      star.classList.toggle("text-warning");
    });
  });
};
