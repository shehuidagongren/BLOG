import request from '@/utils/request'

// 查询工具管理列表
export function listToolbox(query) {
  return request({
    url: '/blog/toolbox/list',
    method: 'get',
    params: query
  })
}

// 查询工具管理详细
export function getToolbox(id) {
  return request({
    url: '/blog/toolbox/' + id,
    method: 'get'
  })
}

// 新增工具管理
export function addToolbox(data) {
  return request({
    url: '/blog/toolbox',
    method: 'post',
    data: data
  })
}

// 修改工具管理
export function updateToolbox(data) {
  return request({
    url: '/blog/toolbox',
    method: 'put',
    data: data
  })
}

// 删除工具管理
export function delToolbox(id) {
  return request({
    url: '/blog/toolbox/' + id,
    method: 'delete'
  })
}
