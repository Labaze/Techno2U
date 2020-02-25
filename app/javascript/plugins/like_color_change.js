const hearts = document.querySelectorAll('.fa-heart');

if (hearts) {
  hearts.forEach(heart => {
    heart.addEventListener('click', (event) => {
      heart.classList.toggle("text-danger");
    });
  });
};
