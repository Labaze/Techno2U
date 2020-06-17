const button = document.querySelector('.parties-i-might-like')
const data = [];

if (button) {
  button.addEventListener('click', (event) => {
    console.log('ok');
    window.location.replace('/parties?lookalike=recommendations');
  });
};


