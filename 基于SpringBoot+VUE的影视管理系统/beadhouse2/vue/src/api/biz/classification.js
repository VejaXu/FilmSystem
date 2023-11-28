import request from '@/utils/request'

// 查询分类管理列表
export function listClassification(query) {
  return request({
    url: '/biz/classification/list',
    method: 'get',
    params: query
  })
}

// 下载用户导入模板
export function importTemplate() {
  return request({
    url: '/biz/classification/importTemplate',
    method: 'get'
  })
}

// 查询分类管理详细
export function getClassification(id) {
  return request({
    url: '/biz/classification/' + id,
    method: 'get'
  })
}

// 新增分类管理
export function addClassification(data) {
  return request({
    url: '/biz/classification',
    method: 'post',
    data: data
  })
}

// 修改分类管理
export function updateClassification(data) {
  return request({
    url: '/biz/classification',
    method: 'put',
    data: data
  })
}

// 删除分类管理
export function delClassification(id) {
  return request({
    url: '/biz/classification/' + id,
    method: 'delete'
  })
}

// 导出分类管理
export function exportClassification(query) {
  return request({
    url: '/biz/classification/export',
    method: 'get',
    params: query
  })
}
