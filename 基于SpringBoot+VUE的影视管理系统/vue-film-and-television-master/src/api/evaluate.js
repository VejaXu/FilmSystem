import { getToken } from '@/utils/auth'
import request from '@/utils/request'

// 新增评价管理
export function addEvaluate(data) {
  const token=getToken();
    return request({
      url: '/biz/evaluate',
      headers: {
        Authorization: 'Bearer '+token
      },
      method: 'post',
      data: data
    })
  }

  // 查询评价管理列表
export function listEvaluate(query) {
    return request({
      url: '/biz/evaluate/list',
      method: 'get',
      params: query
    })
  }