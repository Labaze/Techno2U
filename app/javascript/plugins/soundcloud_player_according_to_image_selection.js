const images_selector = document.getElementById('artist-images-grid');
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

const getDefaultSoundcloudId = () => {
  if (trackIdsElement) {
    const data = trackIdsElement.dataset.ids;
    const track_ids = JSON.parse(data);
    return soundcloudId = track_ids[Object.keys(track_ids)[0]];
  };
};

if (images_selector) {
  const soundcloud_player_few = document.getElementById('soundcloud_player_show_few_artists');
  let soundcloudId = getDefaultSoundcloudId();
  soundcloud_player_few.innerHTML = generateIframe(soundcloudId);

  images_selector.addEventListener("click", (event) => {
    event.preventDefault();
    const artist = event.target.id;
    soundcloudId = getSoundcloudId(artist);
    soundcloud_player_few.innerHTML = '';
    soundcloud_player_few.innerHTML = generateIframe(soundcloudId);

  });
};
