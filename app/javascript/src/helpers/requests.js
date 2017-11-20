import axios from 'axios'

const BASE_URL = 'https://medach-project.herokuapp.com/'

export const simpleRequest = (url, method, data, headers) => {
  const requestObj = {
    url,
    method,
    data,
    headers: {
      ...headers
    }
  };

  return axios(requestObj);
}

export const get = (url, headers = {}) => {
  return simpleRequest(url, "get", null, headers);
}

export const post = (url, data, headers = {}) => {
  return simpleRequest(url, "post", data, headers);
}

export const getArticles = () => {
  return new Promise((resolve, reject) => {
    get(`${BASE_URL}/api/articles`)
      .then(response => {
        resolve(response)
      })
      .catch(reject)
  })
}

export const getPost = (id) => {
  return new Promise((resolve, reject) => {
    get(`${BASE_URL}/api/articles/${id}`)
      .then(response => {
        resolve(response)
      })
      .catch(reject)
  })
}

export const getPostsByTag = (tag) => {
  return new Promise((resolve, reject) => {
    get(`${BASE_URL}/api/articles/by_tag/${tag}`)
      .then(response => {
        resolve(response)
      })
      .catch(reject)
  })
}
