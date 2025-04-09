<template>
  <div class="login-container">
    <Card>
      <template #title>Login</template>
      <template #content>
        <div class="p-fluid">
          <div class="field">
            <label for="username">Username</label>
            <InputText id="username" v-model="username" autocomplete="username" />
          </div>
          <div class="field">
            <label for="password">Password</label>
            <Password id="password" v-model="password" toggleMask feedback />
          </div>
        </div>
      </template>
      <template #footer>
        <Button label="Login / Sign Up" icon="pi pi-sign-in" @click="handleLogin" />
      </template>
    </Card>
  </div>
</template>

<script setup lang="ts">
import InputText from 'primevue/inputtext'
import Password from 'primevue/password'
import Button from 'primevue/button'
import Card from 'primevue/card'
import { ref } from 'vue'
import axios from 'axios'
import { useToast } from 'primevue/usetoast'
import { useRouter } from 'vue-router'

const router = useRouter()
const toast = useToast()


const username = ref('')
const password = ref('')

const handleLogin = async () => {
  try {
    const alphanumericRegex = /^[a-zA-Z0-9]+$/
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/

    //username can either be alphanumeric or in a valid email format
    if (!username.value || (!alphanumericRegex.test(username.value) && !emailRegex.test(username.value))) {
        toast.add({
        severity: 'warn',
        summary: 'Invalid Username',
        detail: 'Username must be alphanumeric or a valid email address.',
        life: 3000
        });
        return
    }

    //password cannot be empty
    if (!password.value) {
        toast.add({
        severity: 'warn',
        summary: 'Invalid Password',
        detail: 'Password cannot be empty.',
        life: 3000
        });
        return
    }

    //try to login, either gets success or creates account
    const response = await axios.post('http://localhost:5000/login', {
      username: username.value,
      password: password.value
    });
    toast.add({
      severity: 'success',
      summary: 'Login Successful',
      detail: response.data.message,
      life: 3000,
      closeIcon: 'pi pi-times',
      message: {
        closable: false,
      }
    });

    //set local storage items to persist across sessions
    localStorage.setItem('isLoggedIn', 'true');
    localStorage.setItem('username', username.value);

    router.push('/home');
  } catch (error: any) {
    //if login fails for incorrect password or another reason, alert the user
    toast.add({
      severity: 'error',
      summary: 'Login Failed',
      detail: error.response?.data?.error || 'Login failed',
      life: 3000,
      closeIcon: 'pi pi-times'
    });
  }
}

</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
