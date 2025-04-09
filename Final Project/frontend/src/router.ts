import { createRouter, createWebHistory } from 'vue-router';
import Login from './components/Login.vue';
import Home from './components/Home.vue';
import ByGeneration from './components/ByGeneration.vue';
import ByRegion from './components/ByRegion.vue';
import ByType from './components/ByType.vue';
import Catch from './components/Catch.vue';
import Caught from './components/Caught.vue';
import Strengths from './components/Strengths.vue';
import StrongAgainst from './components/StrongAgainst.vue';
import Uncaught from './components/Uncaught.vue';
import Weaknesses from './components/Weaknesses.vue';
import WeakTo from './components/WeakTo.vue';

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
    },
    {
        path: '/by-generation',
        name: 'By Generation',
        component: ByGeneration,
        meta: { requiresAuth: true } 
    },
    {
        path: '/by-region',
        name: 'By Region',
        component: ByRegion,
        meta: { requiresAuth: true } 
    },
    {
        path: '/by-type',
        name: 'By Type',
        component: ByType,
        meta: { requiresAuth: true } 
    },
    {
        path: '/catch',
        name: 'Catch',
        component: Catch,
        meta: { requiresAuth: true } 
    },
    {
        path: '/caught',
        name: 'Caught',
        component: Caught,
        meta: { requiresAuth: true } 
    },
    {
        path: '/strengths',
        name: 'Strengths',
        component: Strengths,
        meta: { requiresAuth: true } 
    },
    {
        path: '/strong-against',
        name: 'Strong Against',
        component: StrongAgainst,
        meta: { requiresAuth: true } 
    },
    {
        path: '/weaknesses',
        name: 'Weaknesses',
        component: Weaknesses,
        meta: { requiresAuth: true } 
    },
    {
        path: '/uncaught',
        name: 'Uncaught',
        component: Uncaught,
        meta: { requiresAuth: true } 
    },
    {
        path: '/weak-to',
        name: 'Weak To',
        component: WeakTo,
        meta: { requiresAuth: true } 
    },
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
