import request from '@/utils/request'

// 查询公告管理列表
export function listNotice(query) {
  return request({
    url: '/biz/notice/list',
    method: 'get',
    params: query
  })
}
// 下载导入模板
export function importTemplate() {
  return request({
    url: '/biz/notice/importTemplate',
    method: 'get'
  })
}

// 查询公告管理详细
export function getNotice(id) {
  return request({
    url: '/biz/notice/' + id,
    method: 'get'
  })
}

// 新增公告管理
export function addNotice(data) {
  return request({
    url: '/biz/notice',
    method: 'post',
    data: data
  })
}

// 修改公告管理
export function updateNotice(data) {
  return request({
    url: '/biz/notice',
    method: 'put',
    data: data
  })
}

// 删除公告管理
export function delNotice(id) {
  return request({
    url: '/biz/notice/' + id,
    method: 'delete'
  })
}

// 导出公告管理
export function exportNotice(query) {
  return request({
    url: '/biz/notice/export',
    method: 'get',
    params: query
  })
}
