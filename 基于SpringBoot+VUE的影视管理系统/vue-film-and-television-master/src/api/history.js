import request from '@/utils/request'

// 查询观看历史列表
export function listHistory(films) {
  return request({
    url: '/biz/history/list',
    method: 'get',
    params: films
  })
}

// 查询观看历史详细
export function getHistory(id) {
  return request({
    url: '/biz/history/' + id,
    method: 'get'
  })
}

// 新增观看历史
export function addHistory(data) {
  return request({
    url: '/biz/history',
    method: 'post',
    data: data
  })
}

// 修改观看历史
export function updateHistory(data) {
  return request({
    url: '/biz/history',
    method: 'put',
    data: data
  })
}

// 删除观看历史
export function delHistory(id) {
  return request({
    url: '/biz/history/' + id,
    method: 'delete'
  })
}

// 导出观看历史
export function exportHistory(query) {
  return request({
    url: '/biz/history/export',
    method: 'get',
    params: query
  })
}