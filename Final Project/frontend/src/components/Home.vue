<template>
    <div class="home-container">
    <Card class="full-card">
        <template #title>Welcome</template>
        <template #content>
        <div class="button-container">
            <Button label="Get Pokemon by Type" icon="pi pi-star" @click="router.push('/by-type')" />
            <Button label="Get Pokemon by Generation" icon="pi pi-star" @click="router.push('/by-generation')" />
            <Button label="Get Pokemon by Region" icon="pi pi-star" @click="router.push('/by-region')" />
            <Button label="Get Weaknesses for Pokemon" icon="pi pi-star" @click="router.push('/weaknesses')" />
            <Button label="Get Strengths for Pokemon" icon="pi pi-star" @click="router.push('/strengths')" />
            <Button label="Get Pokemon Another is Weak To" icon="pi pi-star" @click="router.push('/weak-to')" />
            <Button label="Get Pokemon Another is Strong Against" icon="pi pi-star" @click="router.push('/strong-against')" />
            <Button label="Log Capture of Pokemon" icon="pi pi-star" @click="router.push('/catch')" />
            <Button label="Get Number Caught" icon="pi pi-star" @click="router.push('/caught')" />
            <Button label="Get Uncaught Pokemon" icon="pi pi-star" @click="router.push('/uncaught')" />
        </div>
        </template>
    </Card>
    </div>
</template>
  
<script setup lang="ts">
import Card from 'primevue/card';
import Button from 'primevue/button'
import { useRouter } from 'vue-router';

const router = useRouter();
</script>
  
<style scoped>
.home-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%; 
    width: 100%; 
}

.full-card {
    width: 100%;
    max-width: 900px; 
    height: 80%; 
    padding: 2rem;
}

.button-container {
    display: flex;
    flex-direction: column;
    gap: 1.5rem;
    width: 100%;
}

button {
    width: 100%; 
    font-size: 16px; 
    padding: 12px; 
}
</style>
