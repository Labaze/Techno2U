let today = new Date();
let dd = String(today.getDate()).padStart(2, '0');
let mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
let yyyy = today.getFullYear();

today = yyyy + '-' + mm + '-' + dd;

const dateControl = document.querySelector('#date-picker-date-first');

if (dateControl) {
  dateControl.innerText = today;

  // CHANGER LE MIN
  dateControl.min = today;
};
