console.log("Hello from app/javascript/packs/application.js!");

import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { inithover } from '../components/button';

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { cardEffect } from '../components/card';


initUpdateNavbarOnScroll();
initSelect2();
previewImageOnFileSelect();
inithover();
initMapbox();
init_autocomplete();

const card = document.querySelector(".snip1423");
if ( card ) {
  cardEffect();
}
