import axios from 'axios'

const API_URL = 'http://127.0.0.1:3000/api/v1'
const securedAxiosInstance = axios.create({
  baseURL: API_URL,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json'
  }
})

const plainAxiosInstance = axios.create({
  baseURL: API_URL,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json'
  }
})
securedAxiosInstance.interceptors.request.use(config => {
  const method = config.method.toUpperCase()
  if (method !== 'OPTIONS' && method !== 'GET') {
    config.headers = {
      ...config.headers,
      'X-CSRF-TOKEN': localStorage.csrf,
      Authorization: localStorage.auth_token
    }
  }
  return config
})

securedAxiosInstance.interceptors.request.use(null, error => {
  if (error.response && error.response.config && error.response.status === 401) {
    return plainAxiosInstance.post('/refresh', {}, {headers: { 'X-CSRF-TOKEN': localStorage.csrf, 'Authorization': localStorage.auth_token }})
      .then(response => {
        localStorage.csrf = response.data.csrf
        localStorage.auth_token = response.data.auth_token
        localStorage.signedIn = true
        let retryConfig = error.response.config
        retryConfig.headers['X-CSRF-TOKEN'] = localStorage.csrf
        retryConfig.headers['Authorization'] = localStorage.auth_token
        return plainAxiosInstance.request(retryConfig)
      }).catch(error => {
        delete localStorage.csrf
        delete localStorage.auth_token
        delete localStorage.signedIn

        location.replace('/')
        return Promise.reject(error)
      })
  } else {
    return Promise.reject(error)
  }
})

export {securedAxiosInstance, plainAxiosInstance}
