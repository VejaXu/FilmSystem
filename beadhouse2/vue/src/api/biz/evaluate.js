import request from '@/utils/request'

// 查询评价管理列表
export function listEvaluate(query) {
  return request({
    url: '/biz/evaluate/list',
    method: 'get',
    params: query
  })
}

// 查询评价管理详细
export function getEvaluate(id) {
  return request({
    url: '/biz/evaluate/' + id,
    method: 'get'
  })
}

// 新增评价管理
export function addEvaluate(data) {
  return request({
    url: '/biz/evaluate',
    method: 'post',
    data: data
  })
}

// 修改评价管理
export function updateEvaluate(data) {
  return request({
    url: '/biz/evaluate',
    method: 'put',
    data: data
  })
}

// 删除评价管理
export function delEvaluate(id) {
  return request({
    url: '/biz/evaluate/' + id,
    method: 'delete'
  })
}

// 导出评价管理
export function exportEvaluate(query) {
  return request({
    url: '/biz/evaluate/export',
    method: 'get',
    params: query
  })
}