import request from '@/utils/request'

// 查询文章评论列表
export function listComments(query) {
  return request({
    url: '/blog/comments/list',
    method: 'get',
    params: query
  })
}

// 查询文章评论详细
export function getComments(commentId) {
  return request({
    url: '/blog/comments/' + commentId,
    method: 'get'
  })
}

// 新增文章评论
export function addComments(data) {
  return request({
    url: '/blog/comments',
    method: 'post',
    data: data
  })
}

// 修改文章评论
export function updateComments(data) {
  return request({
    url: '/blog/comments',
    method: 'put',
    data: data
  })
}

// 删除文章评论
export function delComments(commentId) {
  return request({
    url: '/blog/comments/' + commentId,
    method: 'delete'
  })
}
