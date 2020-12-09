<template>
  <div class="hello">
    <div>{{question.description}}</div>
    <div>
      <button v-for="(answer, index) in answers" :disabled="isActive" :key="index" :value="answer.right"
              v-on:click="click($event, answer, question)"
      >{{ answer.description }}</button>
    </div>
    <pre>Score: {{ score }}</pre>
    <button :hidden="!isActive" :disabled="isDisabled" @click="next(false)">Առաջ</button>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      questions: '',
      question: '',
      answers: [],
      success: [],
      score: 0,
      isActive: false,
      isDisabled: false
    }
  },
  methods: {
    click (event, answer, question) {
      const _this = this
      if (answer.right) {
        event.target.classList.toggle('true')
        _this.score += question.point
        _this.questions.splice(question.index, 1)
        if (!_this.questions.length) {

        }
      } else {
        event.target.classList.toggle('false')
        _this.$el.querySelector('button[value=true]').classList.toggle('true')
        _this.isDisabled = true
        _this.$http.secured.post('score', {total_point: _this.score, total_question: 10}).then(response => {}).catch(error => { return error })
      }
      _this.isActive = true
    },
    next (isTrue = false) {
      let number = Math.floor(Math.random() * this.questions.length)
      let exists = this.success.some(field => {
        return field === number
      })
      if (!exists) {
        this.question = this.questions[number]
        this.question['index'] = number
        this.answers = this.questions[number].answers
        this.isActive = false
        this.$el.querySelector('button[value=true]').classList.toggle('true')
      } else {
        if (isTrue) {
          return
        }
        this.next(true)
      }
    },
    questionsData () {
      this.$http.secured.get('games', {
        headers: {
          Authorization: localStorage.auth_token
        }
      }).then(response => {
        this.questions = response.data
        let number = Math.floor(Math.random() * this.questions.length)
        this.question = response.data[number]
        this.question['index'] = number
        this.answers = response.data[number].answers
        this.success.push(number)
      })
    }
  },
  mounted () {

  },
  created () {
    this.questionsData()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
.false{
  background-color: #B00100;
}
.true{
  background-color: #42b983;
}
ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
