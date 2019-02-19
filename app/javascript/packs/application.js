console.log("Hello from app/javascript/packs/application.js!");

import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../components/init_select2';
import { previewImageOnFileSelect } from '../components/photo_preview';

initUpdateNavbarOnScroll();
initSelect2();
previewImageOnFileSelect();
