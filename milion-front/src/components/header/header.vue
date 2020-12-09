<template>
  <div>
    <div v-if="isSigned">
      <a  class="link-list" @click="signOut" >Sign Out</a>
    </div>
    <div v-else>
      <router-link to="/signin" class="link-list">Sign In</router-link>
      <router-link to="/signup" class="link-list">Sign Up</router-link>
    </div>

  </div>
</template>

<script>
export default {
  // name: 'header',
  watch: {
    isSigned: function (val) {
      this.isSigned = val
    }
  },
  data () {
    return {
      isSigned: false
    }
  },
  methods: {
    setError (error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text
    },
    signedIn () {
      return !!localStorage.signedIn
    },
    signOut () {
      delete localStorage.csrf
      delete localStorage.auth_token
      delete localStorage.signedIn
      this.$router.replace('signin')
    }
  }
}
</script>

<style scoped>

</style>
