import axios from 'axios'

const BASE_URL = process.env.BASE_URL

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

export const getArticles = (page) => {
  return new Promise((resolve, reject) => {
    axios.get(`/api/articles`, {
      params: {
        page: page
      }
    })
    .then(response => {
      resolve(response)
    })
    .catch(reject)
  })
}

export const getPinnedPostsRequest = () => {
  return new Promise((resolve, reject) => {
    get(`api/articles/show_fixed`).then(response => resolve(response)).catch(error => reject(error))
  })
}

export const getAllTags = () => {
  return new Promise((resolve, reject) => {
    get(`/api/tags`).then(response => resolve(response)).catch(error => reject(error))
  })
}

export const getPost = (id) => {
  return new Promise((resolve, reject) => {
    get(`/api/articles/${id}`)
      .then(response => {
        resolve(response)
      })
      .catch(reject)
  })
}

export const getBlogPost = (id) => {
  return new Promise((resolve, reject) => {
    get(`/api/blogs/${id}`)
      .then(response => {
        resolve(response)
      })
      .catch(reject)
  })
}

export const getPostsByTag = (tag) => {
  return new Promise((resolve, reject) => {
    get(`/api/articles/by_tag/${tag}`) // /api/articles?tag=tag_name
      .then(response => {
        resolve(response)
      })
      .catch(reject)
  })
}

export const searchRequest = (query) => {
  return new Promise((resolve, reject) => {
    axios.get(`/api/articles`, {
      params: {
        query: query
      }
    }).then(response => {
      resolve(response)
    }).catch(reject)
  })
}

export const tagsMostUsed = () => {
  return new Promise((resolve, reject) => {
    axios.get(`/api/tags/most_used`)
      .then(response => {
        resolve(response)
      }).catch(error => reject(error))
  })
}

export const siteConfig = () => {
  return new Promise((resolve, reject) => {
    axios.get(`/api/site_config`)
      .then(response => {
        resolve(response)
      }).catch(error => reject(error))
  })
}
