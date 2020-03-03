const selector = document.getElementById('artist_selector');
const trackIdsElement = document.getElementById('track_ids');

const generateIframe = (soundcloudId) => {
  return `
    <iframe
    width="100%"
    height="166"
    scrolling="no"
    frameborder="no"
    allow="autoplay"
    src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/${soundcloudId}&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
  >
  </iframe>`
};

const getSoundcloudId = (artist_selected) => {
  if (trackIdsElement) {
    const data = trackIdsElement.dataset.ids;
    const track_ids = JSON.parse(data);
    return soundcloudId = track_ids[artist_selected];
  };
};

if (selector) {
  const soundcloud_player_lot = document.getElementById('soundcloud_player_show_lot_artists');
  let artist_selected = selector.value;
  let soundcloudId = getSoundcloudId(artist_selected);

  soundcloud_player_lot.innerHTML = generateIframe(soundcloudId);

  $('#artist_selector').on('select2:select', function (e) {
    event.preventDefault();
    artist_selected = selector.value;
    soundcloudId = getSoundcloudId(artist_selected);
    soundcloud_player_lot.innerHTML = '';
    soundcloud_player_lot.innerHTML = generateIframe(soundcloudId);
  });
};
