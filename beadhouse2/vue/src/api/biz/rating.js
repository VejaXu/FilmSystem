import request from '@/utils/request'

// 查询电影评分列表
export function listRating(query) {
  return request({
    url: '/biz/rating/list',
    method: 'get',
    params: query
  })
}

// 查询电影评分详细
export function getRating(movieRatingId) {
  return request({
    url: '/biz/rating/' + movieRatingId,
    method: 'get'
  })
}

// 新增电影评分
export function addRating(data) {
  return request({
    url: '/biz/rating',
    method: 'post',
    data: data
  })
}

// 修改电影评分
export function updateRating(data) {
  return request({
    url: '/biz/rating',
    method: 'put',
    data: data
  })
}

// 删除电影评分
export function delRating(movieRatingId) {
  return request({
    url: '/biz/rating/' + movieRatingId,
    method: 'delete'
  })
}

// 导出电影评分
export function exportRating(query) {
  return request({
    url: '/biz/rating/export',
    method: 'get',
    params: query
  })
}