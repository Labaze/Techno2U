if (document.querySelector(".geolocation")) {
  navigator.geolocation.getCurrentPosition((data) => {
    const lat = data.coords.latitude;
    const long = data.coords.longitude;
    url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${long},${lat}.json?types=place&access_token=pk.eyJ1IjoiZG91cnRlYWxhY3JlbWUiLCJhIjoiY2s2MjlxdWRzMDgxZzNrbzRzeHBqdWkyOSJ9.LbopI8ToNvFZAhmF3knf9w`
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const geoloc = data.features[0].text;
        console.log(geoloc);
        const location_button = document.querySelector(".geolocation");
        location_button.addEventListener("click", (event) => {
           location_button.href = `?utf8=✓&search%5Blocation%5D=${geoloc}`
         });
      });
  });
};
