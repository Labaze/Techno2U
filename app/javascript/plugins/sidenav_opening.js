const sidenavButton = document.querySelector(".fa-bars")

if (sidenavButton) {
  sidenavButton.addEventListener('click', (event) => {
    document.querySelector(".sidenav-party-index-filters").classList.toggle('d-none');
  });
};
