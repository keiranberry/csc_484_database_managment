<template>
    <div class="page-container">
    <Card>
        <template #title>Get Pokemon By Generation</template>

        <template #content>
        <div class="p-fluid">
            <div class="field">
            <label for="generation">Generation</label>
            <Dropdown
                id="generation"
                v-model="selectedGeneration"
                :options="generationOptions"
                optionLabel="Name"
                optionValue="Id"
                placeholder="Select a Generation"
            />
            </div>
            <Button
                class="search-button"
                label="Get Pokemon"
                icon="pi pi-search"
                @click="getPokemon"
                :disabled="!selectedGeneration"
            />
        </div>
        </template>

        <template #footer>
        <DataTable v-if="hasRetrieved" :value="pokemonList">
            <Column field="id" header="#"></Column>
            <Column field="name" header="Name"></Column>
        </DataTable>
        </template>
    </Card>
    </div>
</template>

<script setup lang="ts">
import Dropdown from 'primevue/dropdown';
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Button from 'primevue/button';
import Card from 'primevue/card';
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useToast } from 'primevue/usetoast';

const toast = useToast();

const generationOptions = ref<Generation[]>([]);
const selectedGeneration = ref<number | null>(null);
const pokemonList = ref<Pokemon[]>([]);
const hasRetrieved = ref(false);

onMounted(async () => {
    try {
    const response = await axios.get('http://localhost:5000/generations');
    generationOptions.value = response.data;
    } catch (err) {
    toast.add({
        severity: 'error',
        summary: 'Error',
        detail: 'Failed to fetch generations.',
        life: 3000
    });
    }
})

const getPokemon = async () => {
    if (!selectedGeneration.value) return;

    try {
    const response = await axios.get(
        `http://localhost:5000/pokemon/generation/${selectedGeneration.value}`
    );
    pokemonList.value = response.data;
    hasRetrieved.value = true;
    } catch (err) {
    toast.add({
        severity: 'error',
        summary: 'Error',
        detail: 'Failed to fetch Pokémon.',
        life: 3000
    });
    }
}
</script>

<style scoped>
.page-container {
    display: flex;
    justify-content: center;
    padding: 2rem;
}

.search-button {
    margin-top: 1em;
}
</style>
