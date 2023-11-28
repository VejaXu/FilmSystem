import request from '@/utils/request'

// 查询轮播图列表
export function listCarousel(query) {
  return request({
    url: '/biz/carousel/list',
    method: 'get',
    params: query
  })
}

// 查询轮播图详细
export function getCarousel(id) {
  return request({
    url: '/biz/carousel/' + id,
    method: 'get'
  })
}

// 新增轮播图
export function addCarousel(data) {
  return request({
    url: '/biz/carousel',
    method: 'post',
    data: data
  })
}

// 修改轮播图
export function updateCarousel(data) {
  return request({
    url: '/biz/carousel',
    method: 'put',
    data: data
  })
}

// 删除轮播图
export function delCarousel(id) {
  return request({
    url: '/biz/carousel/' + id,
    method: 'delete'
  })
}

// 导出轮播图
export function exportCarousel(query) {
  return request({
    url: '/biz/carousel/export',
    method: 'get',
    params: query
  })
}