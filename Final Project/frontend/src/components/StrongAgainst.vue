<template>
    <div class="page-container">
    <Card>
        <template #title>Get Pokemon Another is Strong Against</template>

        <template #content>
        <div class="p-fluid">
            <div class="field">
            <label for="pokemon">Pokemon</label>
            <AutoComplete
                id="pokemon"
                v-model="selectedPokemon"
                :suggestions="filteredPokemon"
                optionLabel="Name"
                placeholder="Select a Pokemon"
                @complete="searchPokemon"
                :field="'Name'"
            />
            </div>
            <Button
                class="search-button"
                label="is strong against..."
                icon="pi pi-search"
                @click="getStrongAgainstPokemon"
                :disabled="!selectedPokemon"
            />
        </div>
        </template>

        <template #footer>
        <DataTable v-if="hasRetrieved" :value="strongAgainstList">
            <Column field="id" header="#"></Column>
            <Column field="name" header="Name"></Column>
        </DataTable>
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

const pokemonOptions = ref<Pokemon[]>([]);
const selectedPokemon = ref<number | null>(null);
const strongAgainstList = ref<Pokemon[]>([]);
const hasRetrieved = ref(false);
const filteredPokemon = ref<Pokemon[]>([]);

const searchPokemon = (event: { query: string }) => {
    const query = event.query.toLowerCase();
    filteredPokemon.value = pokemonOptions.value.filter(p =>
        p.Name.toLowerCase().includes(query)
    );
};

onMounted(async () => {
    try {
    const response = await axios.get('http://localhost:5000/pokemon');
    pokemonOptions.value = response.data;
    } catch (err) {
    toast.add({
        severity: 'error',
        summary: 'Error',
        detail: 'Failed to fetch pokemon.',
        life: 3000
    });
    }
})

const getStrongAgainstPokemon = async () => {
    if (!selectedPokemon.value) return;

    try {
        const response = await axios.get(
            `http://localhost:5000/pokemon/${selectedPokemon.value.Id}/strong-against`
        );
        strongAgainstList.value = response.data;
        hasRetrieved.value = true;
    } catch (err) {
        toast.add({
            severity: 'error',
            summary: 'Error',
            detail: 'Failed to fetch pokemon.',
            life: 3000
        });
    }
};
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
