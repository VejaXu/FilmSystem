import request from '@/utils/request'

// 查询电影管理列表
export function listFilms(query) {
  return request({
    url: '/biz/films/list',
    method: 'get',
    params: query
  })
}

// 下载导入模板
export function importTemplate() {
  return request({
    url: '/biz/films/importTemplate',
    method: 'get'
  })
}

// 查询电影管理详细
export function getFilms(id) {
  return request({
    url: '/biz/films/' + id,
    method: 'get'
  })
}

// 新增电影管理
export function addFilms(data) {
  return request({
    url: '/biz/films',
    method: 'post',
    data: data
  })
}

// 修改电影管理
export function updateFilms(data) {
  return request({
    url: '/biz/films',
    method: 'put',
    data: data
  })
}

// 删除电影管理
export function delFilms(id) {
  return request({
    url: '/biz/films/' + id,
    method: 'delete'
  })
}

// 导出电影管理
export function exportFilms(query) {
  return request({
    url: '/biz/films/export',
    method: 'get',
    params: query
  })
}
