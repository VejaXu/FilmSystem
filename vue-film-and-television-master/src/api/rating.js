import request from '@/utils/request'

// 评分
export function pingFen(data) {
    return request({
        url: '/biz/rating/pingFen',
        method: 'post',
        data: data
    })
}

// 获取当前电影的评分
export function filmsPingFen(id) {
    return request({
        url: `/biz/rating/${id}/pingFen`,
        method: 'get',
    })
}