console.log("Hello from app/javascript/packs/application.js!");

import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { inithover } from '../components/button';
import { cardEffect } from '../components/card';

initUpdateNavbarOnScroll();
initSelect2();
previewImageOnFileSelect();
inithover();


const card = document.querySelector(".snip1423");
if ( card ) {
  cardEffect();
}
