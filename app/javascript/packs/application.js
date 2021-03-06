import 'bootstrap';
import "../plugins/flatpickr";
import "../plugins/blink_text_footer";
import "../plugins/like_deslike_color_change";
import "../plugins/geolocalisation";
import "../plugins/sidenav_opening";
import "../plugins/today_date";
import "../plugins/calendar";
import "../plugins/audio_quizz_card_animation";
import "../plugins/soundcloud_player_according_to_select";
import "../plugins/soundcloud_player_according_to_image_selection";
import "../plugins/dashboard_page_switch";
import "../plugins/facebook_sdk";
import "../plugins/first_session_animation";
import "../plugins/location_quiz";
import "../plugins/ping_button_parties";
import "../plugins/charts";
import "../plugins/parties_from_clusters";

// Select2
import "select2/dist/css/select2.css";
import { initSelect2 } from "../components/init_select2";
initSelect2();

// Mapbox
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
