import { getToken } from '@/utils/auth'
import request from '@/utils/request'

//修改用户
export function updateUser(data) {
  const token=getToken();
    return request({
      url: '/system/user/edit',
      headers: {
        Authorization: 'Bearer '+token
      },
      method: 'put', 
      data: data
    })
  }

    // 获取验证码
export function code() {
  return request({
    url: '/system/user/code',
    method: 'post'
  })
}

  // 新增用户
export function addUser(data) {
  return request({
    url: '/system/user/add',
    method: 'post',
    data: data
  })
}

  // 用户密码重置
export function updateUserPwd(oldPassword, newPassword) {
    const data = {
      oldPassword,
      newPassword
    }
    const token=getToken();
    return request({
      url: '/system/user/profile/updatePwd',
      headers: {
        Authorization: 'Bearer '+token
      },
      method: 'put',
      params: data
    })
  }

  export function getUserProfile() {
    return request({
      url: '/system/user/profile',
      method: 'get'
    })
  }