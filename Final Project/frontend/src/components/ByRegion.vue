<template>
    <div class="page-container">
    <Card>
        <template #title>Get Pokemon By Region</template>

        <template #content>
        <div class="p-fluid">
            <div class="field">
            <label for="region">Region</label>
            <Dropdown
                id="region"
                v-model="selectedRegion"
                :options="regionOptions"
                optionLabel="Name"
                optionValue="Id"
                placeholder="Select a Region"
            />
            </div>
            <Button
                class="search-button"
                label="Get Pokemon"
                icon="pi pi-search"
                @click="getPokemon"
                :disabled="!selectedRegion"
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

const regionOptions = ref<Region[]>([]);
const selectedRegion = ref<number | null>(null);
const pokemonList = ref<Pokemon[]>([]);
const hasRetrieved = ref(false);

onMounted(async () => {
    try {
    const response = await axios.get('http://localhost:5000/regions');
    regionOptions.value = response.data;
    } catch (err) {
    toast.add({
        severity: 'error',
        summary: 'Error',
        detail: 'Failed to fetch regions.',
        life: 3000
    });
    }
})

const getPokemon = async () => {
    if (!selectedRegion.value) return;

    try {
    const response = await axios.get(
        `http://localhost:5000/pokemon/region/${selectedRegion.value}`
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
