<template>
    <div style="width: 70%; margin: 65px auto; ">
        <el-page-header @back="goBack" content="视频详情页">

        </el-page-header>
        <div class="detail-page">
            <h1>视频详情页</h1>
            <video width="100%" height="500px" controls autoplay class="video" ref="dialogVideo" :src="films.imgs"
                :volume="100">
            </video>
        </div>
        <div style="text-align: left;">用户评价
            <el-rate v-model="rat" :max="10" style="display: contents;" @change="score()" show-score>
            </el-rate>
            <span style="margin-left: 81%;">
                <el-button type="warning" @click="collects()" icon="el-icon-star-off" circle/>
            </span>
        </div>
        <hr>
        <div>
            <h3>评论</h3>
            <el-input type="text" style="width: 60%;" v-model="evaluate.address" autocomplete="off" size="medium"
                placeholder="评价内容" prefix-icon="el-icon-edit"></el-input>
            <el-button type="primary" icon="el-icon-edit" @click="discuss()">提交</el-button>
            <el-row>
                <el-tabs v-model="activeName" type="card">

                    <el-tab-pane label="留言" name="2">
                        <div style="margin-bottom: 10px; text-align: right;" hidden>
                            <el-button @click="dialogFormVisible = true" type="primary">留言</el-button>
                        </div>

                        <div class="comment" v-if="evaluations == null || evaluations == ''">
                            <p>目前还没有人来留言。。。。。</p>
                        </div>

                        <div class="comment " v-for="(comment, index) in evaluations" :key="index"
                            v-show="index < visibleComments">
                            <div class="user">
                                <img style="width: 35px;" class="media-object avatar" src="@/assets/img/icon-me-h@2x.png"
                                    alt="">
                                <div class="nickname">{{ comment.name }}</div>
                            </div>
                            <div style="margin-top: 20px;">
                                评论时间: {{ comment.createTime }}
                            </div>
                            <div class="content text">
                                {{ comment.address }}
                            </div>
                        </div>
                        <el-button type="success" v-if="showAll" icon="el-icon-arrow-up" @click="toggleComments"
                            circle></el-button>
                        <el-button type="success" v-if="!showAll" icon="el-icon-arrow-down" @click="toggleComments"
                            circle></el-button>
                    </el-tab-pane>
                </el-tabs>
            </el-row>
        </div>
    </div>
</template>

<script>
import { getInfo, updateFilms } from '@/api/films'
import { pingFen, filmsPingFen } from '@/api/rating';
import { addEvaluate, listEvaluate } from '@/api/evaluate';
import { addCollect } from '@/api/collect'

export default {
    data() {
        return {
            scores: 0,
            visibleComments: 3, // 默认显示3条评论
            showAll: false,
            collect: {}, //收藏
            evaluations: [], //留言
            evaluate: {
                num: null,
                field2: '',
                // field1:null,
            },//评价
            activeName: '2',
            num: 0,
            films: {
                num: 0,
                field1: 0,
            },
            poster: true,
            videoState: false, // 视频播放状态
            // 学时
            studyTime: {
                currentTime: 0, // 当前已学时长
                duration: 0 // 总时长
            },
            timer: {}, // 定时器
            pauseTimer: {}, // 暂停定时器
            controls: true,
            rules: {},
            newComment: '',
            comments: [],
            rat: 0
        }
    },
    created() {
        this.getId(this.$route.params.id);
        this.getFilmsPingFen();
    },
    methods: {
        /**
         * 获取电影的评分
         */
        getFilmsPingFen(){
            filmsPingFen(this.$route.params.id).then(res=>{
                this.rat = res.data.data;
            })
        },
        toggleComments() {
            this.showAll = !this.showAll;
            console.log(this.showAll)
            if (this.showAll) {
                this.visibleComments = this.evaluations.length;
            } else {
                this.visibleComments = 3; // 只显示3条评论
            }
        },
        //收藏
        collects() {
            this.collect.field1 = this.films.id;
            this.collect.title = this.films.address;
            this.collect.name = this.films.title;
            this.collect.address = this.films.field5;
            addCollect(this.collect).then(res => {
                console.log(res)
                if (res.data.code == 200) {
                    this.$message({
                        message: res.data.msg,
                        type: 'success'
                    });
                }
            })
        },
        //查询评论
        getList() {
            this.evaluate.num = this.films.id;
            listEvaluate(this.evaluate).then(res => {

                this.evaluations = res.data.rows;
            })
        },
        //新增评论
        discuss() {
            this.evaluate.num = this.films.id;
            this.evaluate.title = this.films.title;
            addEvaluate(this.evaluate).then(res => {
                if (res.data.code == 200) {
                    this.$message({
                        message: '评论成功!',
                        type: 'success'
                    });
                    this.evaluate.address = ''
                    this.getId(this.$route.params.id);
                }
            })
        },
        //评分
        score() {
            let form = {
                filmsId: this.$route.params.id,
                movieRatingSource: this.rat
            }
            pingFen(form).then(res=>{
                this.$message.success('评分成功');
            })
        },
        //评论提交按钮
        addComment() {
            if (this.newComment) {
                this.comments.push(this.newComment);
                this.newComment = '';
            }
        },
        goBack() {
            this.$router.push("/");
        },
        getId(id) {
            getInfo(id).then(res => {
                console.log("111:", res)
                if (res.data.code == 200) {
                    this.films = res.data.data;
                    this.scores = this.films.num
                    this.getList();
                    console.log(this.films)
                }
            })

        }
    }
}
</script>

<style scoped>
.text {
    font-size: 17px;
    font-weight: bold;
    text-align: left;
    margin: auto;
}

.comment {
    text-align: initial;
    display: flex;

    border: 1px solid #ddd;
    padding: 10px;
    margin-bottom: 10px;
}

.hidden {
    display: none;
}

.comment-box {
    margin-bottom: 20px;
}

textarea {
    width: 100%;
    padding: 5px;
    margin-bottom: 10px;
}
</style>