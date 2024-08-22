import request from '@/utils/request'

// 查询博客收藏列表
export function listFavorites(query) {
  return request({
    url: '/blog/favorites/list',
    method: 'get',
    params: query
  })
}

// 查询博客收藏详细
export function getFavorites(id) {
  return request({
    url: '/blog/favorites/' + id,
    method: 'get'
  })
}

// 新增博客收藏
export function addFavorites(data) {
  return request({
    url: '/blog/favorites',
    method: 'post',
    data: data
  })
}

// 修改博客收藏
export function updateFavorites(data) {
  return request({
    url: '/blog/favorites',
    method: 'put',
    data: data
  })
}

// 删除博客收藏
export function delFavorites(id) {
  return request({
    url: '/blog/favorites/' + id,
    method: 'delete'
  })
}
