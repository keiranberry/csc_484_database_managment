<template>
    <div class="page-container">
    <Card>
        <template #title>Pokemon You've Never Caught</template>
        <template #content>
        <div class="p-fluid">
            <DataTable v-if="hasRetrieved" :value="uncaughtList">
                <Column field="id" header="#"></Column>
                <Column field="name" header="Name"></Column>
            </DataTable>
        </div>
        </template>
    </Card>
    </div>
</template>

<script setup lang="ts">
import AutoComplete from 'primevue/autocomplete';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Button from 'primevue/button';
import Card from 'primevue/card';
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useToast } from 'primevue/usetoast';

const toast = useToast();

const uncaughtList = ref<Pokemon[]>([]);
const hasRetrieved = ref(false);

onMounted(async () => {
    try {
    const response = await axios.get(`http://localhost:5000/pokemon/uncaught/${localStorage.getItem('userId')}`);
    uncaughtList.value = response.data;
    hasRetrieved.value = true;
    } catch (err) {
    toast.add({
        severity: 'error',
        summary: 'Error',
        detail: 'Failed to fetch pokemon.',
        life: 3000
    });
    }
})
</script>

<style scoped>
.page-container {
    display: flex;
    justify-content: center;
    padding: 2rem;
}
</style>
