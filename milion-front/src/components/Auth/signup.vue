<template>
  <div class="">
    <div class="">
      <h3>Sign Up</h3>
      <form @submit.prevent="signup">
        <div class="" v-if="error">{{ error }}</div>
        <div>
          <label for="email" class="label">E-mail Address</label>
          <input type="email" v-model="email" class="input"  id="email" placeholder="example@mail.com">
        </div>
        <div>
          <label for="password" class="label">Password</label>
          <input type="password" v-model="password" class="input"  id="password" placeholder="password">
        </div>
        <div>
          <label for="password-confirmation" class="label">Password Confirmation</label>
          <input type="password" v-model="password_confirmation" class="input"  id="password-confirmation" placeholder="password">
        </div>
        <button type="submit" class="">Submit</button>
        <div>
          <router-link to="/signin" class="link-list">Sign In</router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'signup',
  data () {
    return {
      email: '',
      password: '',
      password_confirmation: '',
      error: ''
    }
  },
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signup () {
      this.$http.plain.post('signup', {email: this.email, password: this.password, password_confirmation: this.password_confirmation}).then(response => this.signinSuccessful(response)).catch(error => this.signinFailed(error))
    },
    signinSuccessful (response) {
      if (!response.data.csrf && response.data.auth_token) {
        this.signinFailed(response)
        return
      }
      localStorage.csrf = response.data.csrf
      localStorage.auth_token = response.data.auth_token
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/')
    },
    signinFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
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
