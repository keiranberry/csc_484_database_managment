<template>
    <div class="home-container">
      <Card>
        <template #title>Welcome</template>
        <template #content>
          <p>You are now logged in.</p>
        </template>
      </Card>
    </div>
  </template>
  
  <script setup lang="ts">
  import Card from 'primevue/card';
  </script>
  
  <style scoped>
  .home-container {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  </style>
  