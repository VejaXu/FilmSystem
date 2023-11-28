import { getToken } from '@/utils/auth'
import request from '@/utils/request'

//登录请求
export function loginAPI(data) {
    return request({
      url: '/login',
      method: 'post',
      data: data
    })
  }
  // 获取用户详细信息
export function getInfo() {
  const token=getToken();
    return request({
      url: '/getInfo',
      headers: {
        Authorization: 'Bearer '+token
      },
      method: 'get'
      
    })
  }

// 获取验证码
export function getCodeImg() {
  return request({
    url: '/captchaImage',
    method: 'get',
    timeout: 20000
  })
}