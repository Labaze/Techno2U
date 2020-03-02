const selector = document.getElementById('artist_selector');

if (selector) {
    document.querySelectorAll(".soundcloud_player_show")[0].classList.remove('d-none');
  $('#artist_selector').on('select2:select', function (e) {
    event.preventDefault();
    document.querySelectorAll(".soundcloud_player_show").forEach( element => element.classList.add('d-none'));
    const artist_selected = selector.value;
    const player_to_show = document.getElementById(artist_selected);
    player_to_show.classList.remove('d-none');
  });
};
