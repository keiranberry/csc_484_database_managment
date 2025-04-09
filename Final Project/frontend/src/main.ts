import PrimeVue from 'primevue/config'
import ToastService from 'primevue/toastservice'
import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import './style.css'
import 'primeicons/primeicons.css'
import 'primevue/resources/themes/bootstrap4-dark-blue/theme.css'
import 'primevue/resources/primevue.min.css'

const app = createApp(App);

app.use(PrimeVue);
app.use(ToastService);
app.use(router);

app.mount('#app');

