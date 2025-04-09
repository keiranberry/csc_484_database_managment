import { createRouter, createWebHistory } from 'vue-router';
import Login from './components/Login.vue';
import Home from './components/Home.vue';

const routes = [
    {
    path: '/',
    name: 'Login',
    component: Login
    },
    {
    path: '/home',
    name: 'Home',
    component: Home,
    meta: { requiresAuth: true } 
    }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

router.beforeEach((to, from, next) => {
    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';

    if (to.meta.requiresAuth && !isLoggedIn) {
    next({ name: 'Login' });
    } else {
    next();
    }
});

export default router;
