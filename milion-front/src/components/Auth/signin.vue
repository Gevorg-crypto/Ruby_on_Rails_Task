<template>
  <div class="">
      <div class="">
        <h3>Sign In</h3>
        <form @submit.prevent="signin">
          <div class="" v-if="error">{{ error }}</div>
          <div>
            <label for="email" class="label">E-mail Address</label>
            <input type="email" v-model="email" class="input"  id="email" placeholder="example@mail.com">
          </div>
          <div>
            <label for="password" class="label">E-mail Address</label>
            <input type="password" v-model="password" class="input"  id="password" placeholder="password">
          </div>
          <button type="submit" class="">Submit</button>
          <div>
            <router-link to="/signup" class="link-list">Sign Up</router-link>
          </div>
        </form>
      </div>
  </div>
</template>

<script>
export default {
  name: 'signin',
  data () {
    return {
      email: '',
      password: '',
      error: ''
    }
  },
  methods: {
    signin () {
      this.$http.plain.post('/signin', {email: this.email, password: this.password})
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error))
    },
    signinSuccessful (response) {
      if (!response.data.csrf && !response.data.auth_token) {
        this.signinFailed(response)
        return
      }
      localStorage.auth_token = response.data.auth_token
      localStorage.csrf = response.data.csrf
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || ''
      delete localStorage.csrf
      delete localStorage.auth_token
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/')
      }
    }
  }
}
</script>

<style scoped>

</style>
