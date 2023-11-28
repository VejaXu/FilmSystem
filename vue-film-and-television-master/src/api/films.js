import { getToken } from '@/utils/auth'
import request from '@/utils/request'

//登录请求
export function getFilms(films) {
    return request({
      url: 'biz/films/list',
      method: 'get',
      params:films
    })
}
//查询热映电影
export function getReceived(films) {
  return request({
    url: 'biz/films/receivedList',
    method: 'get',
    params:films
  })
}
// 查询电影管理详细
export function getInfo(id) {
  const token=getToken();
  return request({
    url: '/biz/films/' + id, 
    headers: {
      Authorization: 'Bearer '+token
    },
    method: 'get'
  })
}
//电影评分
export function getScore(films) {
  
  return request({
    url: 'biz/films/score',
    method: 'psot',
    params:films
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
//电影评分
// export function getFilmsName(title) {
  
//   return request({
//     url: 'biz/films/title',
//     method: 'psot',
//     params:title
//   })
// }