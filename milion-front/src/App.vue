<template>
  <div id="app">
    <header-nav></header-nav>
    <router-view/>
  </div>
</template>

<script>
import headerNav from '@/components/header/header'
export default {
  name: 'App',
  components: {
    headerNav: headerNav
  }
}
</script>

<style>

</style>
