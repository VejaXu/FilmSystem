/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 60.205.229.98:3306
 Source Schema         : 11_vuetemp_dyy

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/09/2023 16:20:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_movie_rating
-- ----------------------------
DROP TABLE IF EXISTS `biz_movie_rating`;
CREATE TABLE `biz_movie_rating`  (
  `movie_rating_id` bigint NOT NULL AUTO_INCREMENT COMMENT '电影评分',
  `movie_rating_source` int NOT NULL COMMENT '分数',
  `films_id` bigint NOT NULL COMMENT '电影id',
  `user_id` bigint NOT NULL COMMENT '用户Id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '修改者',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`movie_rating_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '电影评分' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_movie_rating
-- ----------------------------
INSERT INTO `biz_movie_rating` VALUES (1, 7, 2, 101, '2023-09-27 15:56:44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名',
  `rl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'http://localhost:9001/profile/upload/2023/09/26/铃芽之旅1_49E958.jpg', '铃芽之旅', '铃芽之旅');
INSERT INTO `carousel` VALUES (2, 'http://localhost:9001/profile/upload/2023/09/26/满江红_0DC404.jpg', '科学', '科学');
INSERT INTO `carousel` VALUES (3, 'http://localhost:9001/profile/upload/2023/09/26/8492215_466A6B.jpg', '影片', '影片');
INSERT INTO `carousel` VALUES (4, 'http://localhost:9001/profile/upload/2023/09/26/e5cc9809df354c40836f_62A825.jpeg', '泰坦尼克号', NULL);
INSERT INTO `carousel` VALUES (5, 'http://localhost:9001/profile/upload/2023/09/26/801_4FB228.jpg', '111', '111');

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影类型',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `num` bigint NULL DEFAULT NULL COMMENT '关联序号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待审核' COMMENT '状态',
  `date1` datetime NULL DEFAULT NULL COMMENT '时间',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段1',
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段2',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段3',
  `field4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段4',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES (1, '科幻', 'http://localhost:9001/profile/upload/2023/09/25/5_D66004.jpg', '科幻', NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', '', '2023-08-31 10:43:55', '', '2023-09-27 14:25:39', NULL);
INSERT INTO `classification` VALUES (2, '动漫', 'http://localhost:9001/profile/upload/2023/09/25/rrrr_79FC2D.JPEG', '动漫', NULL, '待审核', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '', '2023-09-25 14:42:07', '动漫电影');
INSERT INTO `classification` VALUES (3, '历史', 'http://localhost:9001/profile/upload/2023/09/25/5tdrs424_317624.JPEG', '历史', NULL, '待审核', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '', '2023-09-25 14:47:46', '历史电影');
INSERT INTO `classification` VALUES (4, '古装', 'http://localhost:9001/profile/upload/2023/09/25/rrrr_10AFAE.JPEG', '古装', NULL, '待审核', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '', '2023-09-25 14:47:56', '古装电影');
INSERT INTO `classification` VALUES (5, '搞笑', 'http://localhost:9001/profile/upload/2023/09/25/5tfr34_86B897.JPEG', '搞笑', NULL, '待审核', NULL, NULL, NULL, NULL, NULL, '0', '', NULL, '', '2023-09-25 14:48:06', '搞笑电影');
INSERT INTO `classification` VALUES (6, '战争', 'http://localhost:9001/profile/upload/2023/09/25/4_58FAAB.jpg', '战争类型电影', NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', '', '2023-09-13 15:05:45', '', '2023-09-25 14:48:17', '战争类型电影');
INSERT INTO `classification` VALUES (7, '喜剧', 'http://localhost:9001/profile/upload/2023/09/25/edc33_C3E191.JPEG', '喜剧', NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', '', '2023-09-13 17:30:28', '', '2023-09-25 14:48:26', '喜剧');
INSERT INTO `classification` VALUES (8, '动作', 'http://localhost:9001/profile/upload/2023/09/25/卡片效果演示_007094.png', '动作', NULL, '0', NULL, NULL, NULL, NULL, NULL, '0', '', '2023-09-13 17:30:38', '', '2023-09-25 14:49:29', '动作');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影类型',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `num` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待审核' COMMENT '状态',
  `date1` datetime NULL DEFAULT NULL COMMENT '时间',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影ID',
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段2',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段3',
  `field4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段4',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (17, '历史', '金陵十三钗', 'http://localhost:9001/profile/upload/2023/09/26/800_BE1F65.jpg', 101, '待审核', NULL, '27', NULL, NULL, NULL, '0', '', '2023-09-26 16:44:45', '', NULL, NULL);
INSERT INTO `collect` VALUES (18, '动漫', '铃芽之旅', 'http://localhost:9001/profile/upload/2023/09/26/1000_B02E47.png', 101, '待审核', NULL, '2', NULL, NULL, NULL, '0', '', '2023-09-27 15:15:14', '', NULL, NULL);

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联电影名称',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联用户',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `num` bigint NULL DEFAULT NULL COMMENT '电影ID',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待审核' COMMENT '状态',
  `date1` datetime NULL DEFAULT NULL COMMENT '时间',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段2',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段3',
  `field4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段4',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of evaluate
-- ----------------------------
INSERT INTO `evaluate` VALUES (3, '科幻', 'user1', '好看了', 1, '待审核', NULL, '101', '好看了', NULL, NULL, '0', '', '2023-09-02 14:57:27', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (4, NULL, 'user1', '科幻', 1, '待审核', NULL, '101', '不错', NULL, NULL, '0', '', '2023-09-03 17:00:08', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (5, NULL, 'user1', '科幻', 1, '待审核', NULL, '101', '666', NULL, NULL, '0', '', '2023-09-03 17:01:19', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (6, NULL, 'user1', '科幻', 1, '待审核', NULL, '101', '00000', NULL, NULL, '0', '', '2023-09-03 17:01:26', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (7, '科幻', 'user1', '22222222222', 1, '待审核', NULL, '101', '22222222222', NULL, NULL, '0', '', '2023-09-03 17:12:08', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (8, '科幻', 'user1', '999', 1, '待审核', NULL, '101', '999', NULL, NULL, '0', '', '2023-09-03 17:12:20', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (9, '科幻', 'user1', '333', 1, '待审核', NULL, '101', '333', NULL, NULL, '0', '', '2023-09-03 17:14:14', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (10, '科幻', 'user1', '4444', 1, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-03 17:15:44', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (11, '科幻', 'user1', '5555', 1, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-03 17:17:38', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (12, '科幻', 'user1', '99', 1, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-03 17:17:54', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (13, '科幻', 'user3', '44444', 1, '待审核', NULL, '103', '', NULL, NULL, '0', '', '2023-09-03 23:44:35', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (14, '小说视频', 'user3', '4444', 4, '待审核', NULL, '103', '', NULL, NULL, '0', '', '2023-09-03 23:45:11', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (15, '小说视频', 'user3', '2222', 4, '待审核', NULL, '103', '', NULL, NULL, '0', '', '2023-09-03 23:45:21', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (16, '小说视频', 'user3', '000', 4, '待审核', NULL, '103', '', NULL, NULL, '0', '', '2023-09-03 23:45:24', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (17, '小说视频', 'user3', '999', 4, '待审核', NULL, '103', '', NULL, NULL, '0', '', '2023-09-03 23:45:27', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (18, '小说视频', 'user4', '4356', 4, '待审核', NULL, '104', '', NULL, NULL, '0', '', '2023-09-04 21:12:20', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (19, '动漫', 'user4', '2354', 2, '待审核', NULL, '104', '', NULL, NULL, '0', '', '2023-09-04 21:13:45', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (20, '犬舍真人版', 'user1', '真的好看啊', 5, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 16:39:44', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (21, '犬舍真人版', 'user1', '不错', 5, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 16:44:23', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (22, '犬舍真人版', 'user1', '666666', 5, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 16:44:28', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (23, '犬舍真人版', 'user1', '好看', 5, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 16:44:36', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (24, '犬舍真人版2', 'user1', '11111', 7, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 23:25:02', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (25, '犬舍真人版2', 'user1', '4444', 7, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 23:25:06', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (26, '犬舍真人版2', 'user1', '5555', 7, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 23:25:09', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (27, '犬舍真人版2', 'user1', '6666', 7, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-06 23:25:11', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (28, '666', 'user1', '4444', 6, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-07 00:34:38', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (29, '666', 'user1', '3333', 6, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-07 00:34:40', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (30, '666', 'user1', '2222', 6, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-07 00:34:42', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (31, '666', 'user1', '1111', 6, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-07 00:34:46', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (32, '动漫44', 'user1', '444444442222222', 2, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-25 14:41:22', '', NULL, NULL);
INSERT INTO `evaluate` VALUES (33, '铃芽之旅', 'user1', 'test', 2, '待审核', NULL, '101', '', NULL, NULL, '0', '', '2023-09-27 14:22:00', '', NULL, NULL);

-- ----------------------------
-- Table structure for films
-- ----------------------------
DROP TABLE IF EXISTS `films`;
CREATE TABLE `films`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导演',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '片长',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `imgs` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频',
  `num` bigint NULL DEFAULT 0 COMMENT '评分',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待审核' COMMENT '状态',
  `date1` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `field5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `field6` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段6',
  `field7` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段7',
  `field8` int NULL DEFAULT NULL COMMENT '字段8',
  `field9` int NULL DEFAULT NULL COMMENT '字段9',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电影管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of films
-- ----------------------------
INSERT INTO `films` VALUES (1, '流浪地球', '郭帆', '125', '科幻', '近年来，科学家们发现太阳急速衰老膨胀，短时间内包括地球在内的整个太阳系都将被太阳所吞没。为了自救，人类提出一个名为“流浪地球”的大胆计划。', 'http://localhost:9001/profile/upload/2023/09/25/20230912_110831_9B3E3B.mp4', 5, '0', '2019-02-05 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/26/800_033D2C.jpg', NULL, NULL, NULL, NULL, '0', '', '2023-08-31 11:12:42', '', '2023-09-27 14:10:37', NULL);
INSERT INTO `films` VALUES (2, '铃芽之旅', '新海诚', '121', '动漫', '生活在日本九州田舍的17岁少女・鈴芽遇见了为了寻找“门”而踏上旅途的青年。追随着青年的脚步，铃芽来到了山上一片废墟之地，在这里伫立着一扇门。', 'http://localhost:9001/profile/upload/2023/09/25/test_A776E6.mp4', 5, '1', '2023-03-02 00:00:00', '8', '日本', '日语', 'http://localhost:9001/profile/upload/2023/09/26/1000_B02E47.png', NULL, NULL, NULL, NULL, '0', '', NULL, '', '2023-09-27 09:58:14', NULL);
INSERT INTO `films` VALUES (3, '金陵十三钗', '张艺谋', '145', '历史', '1937年南京沦陷，只有一座天主教堂暂时未被占领，教会学校女学生、秦淮河畔风尘女子、军人和伤兵，还有一个美国人约翰，都先后进了教堂。', 'http://localhost:9001/profile/upload/2023/09/26/20220530_162009_619EAC.mp4', 3, '1', '2011-12-16 00:00:00', '5', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/26/800_BE1F65.jpg', NULL, NULL, NULL, NULL, '0', '', '2023-09-26 16:16:31', '', '2023-09-27 09:57:45', NULL);
INSERT INTO `films` VALUES (4, '绣春刀·修罗战场', '路阳', '120', '古装', '明天启七年，北镇抚司锦衣卫沈炼在一次扫除乱党任务中，为救画师北斋，将同僚凌云铠灭口。此后一方面要摆脱来自陆文昭、裴纶的质疑与调查。', 'http://localhost:9001/profile/upload/2023/09/26/20220530_162009_39E9F5.mp4', 0, '1', '2017-07-19 00:00:00', '4.5', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/26/thumb_1_340_453_2017_9841A4.jpg', NULL, NULL, NULL, NULL, '0', '', '2023-09-26 16:24:03', '', '2023-09-27 09:59:23', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'classification', '分类管理', NULL, NULL, 'Classification', 'crud', 'com.manage.project.biz', 'biz', 'classification', '分类管理', 'toto1693447968475', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', '{}', 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52', NULL);
INSERT INTO `gen_table` VALUES (2, 'evaluate', '评价管理', NULL, NULL, 'Evaluate', 'crud', 'com.manage.project.biz', 'biz', 'evaluate', '评价管理', 'toto1693447968574', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', '{}', 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44', NULL);
INSERT INTO `gen_table` VALUES (3, 'films', '电影管理', NULL, NULL, 'Films', 'crud', 'com.manage.project.biz', 'biz', 'films', '电影管理', 'toto1693447968623', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', '{}', 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24', NULL);
INSERT INTO `gen_table` VALUES (4, 'notice', '公告管理', NULL, NULL, 'Notice', 'crud', 'com.manage.project.biz', 'biz', 'notice', '公告管理', 'toto1693447968710', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', '{}', 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17', NULL);
INSERT INTO `gen_table` VALUES (5, 'collect', '收藏', NULL, NULL, 'Collect', 'crud', 'com.manage.project.biz', 'biz', 'collect', '收藏', 'toto1693639673962', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', NULL, 'root', '2023-09-02 15:27:53', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'history', '观看历史', NULL, NULL, 'History', 'crud', 'com.manage.project.biz', 'biz', 'history', '观看历史', 'toto1693653136271', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', NULL, 'root', '2023-09-02 19:12:16', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'carousel', '轮播图', NULL, NULL, 'Carousel', 'crud', 'com.manage.project.biz', 'biz', 'carousel', '轮播图', 'toto1693993298300', '1', 'D:\\邵阳项目\\基于vue+SpringBoot的影视项目\\遥云影视\\beadhouse2', '{}', 'root', '2023-09-06 17:41:38', '', '2023-09-06 17:42:13', NULL);
INSERT INTO `gen_table` VALUES (8, 'biz_movie_rating', '电影评分', NULL, NULL, 'BizMovieRating', 'crud', 'com.manage.project.biz', 'biz', 'rating', '电影评分', 'toto1695798531089', '1', 'C:\\Users\\xytmq\\Desktop\\基于SpringBoot+VUE的影视管理系统\\beadhouse2', NULL, 'root', '2023-09-27 15:08:51', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (2, '1', 'title', '电影类型', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (3, '1', 'name', '封面', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', NULL, 'LIKE', 'imageUpload', '', 3, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (4, '1', 'address', '介紹', 'varchar(500)', 'String', 'address', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 4, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (5, '1', 'num', '关联序号', 'bigint', 'Long', 'num', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (6, '1', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'radio', '', 6, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (7, '1', 'date1', '时间', 'datetime', 'Date', 'date1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (8, '1', 'field1', '字段1', 'varchar(255)', 'String', 'field1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (9, '1', 'field2', '字段2', 'varchar(255)', 'String', 'field2', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (10, '1', 'field3', '字段3', 'varchar(255)', 'String', 'field3', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (11, '1', 'field4', '字段4', 'varchar(255)', 'String', 'field4', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (12, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (13, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (14, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (15, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (16, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (17, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:42:52');
INSERT INTO `gen_table_column` VALUES (18, '2', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (19, '2', 'title', '电影名称', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (20, '2', 'name', '评价用户', 'varchar(200)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (21, '2', 'address', '内容', 'varchar(500)', 'String', 'address', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 4, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (22, '2', 'num', '电影ID', 'bigint', 'Long', 'num', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (23, '2', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'radio', '', 6, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (24, '2', 'date1', '时间', 'datetime', 'Date', 'date1', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 7, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (25, '2', 'field1', '评价分数', 'varchar(255)', 'String', 'field1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (26, '2', 'field2', '字段2', 'varchar(255)', 'String', 'field2', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (27, '2', 'field3', '字段3', 'varchar(255)', 'String', 'field3', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (28, '2', 'field4', '字段4', 'varchar(255)', 'String', 'field4', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (29, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (30, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (31, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (32, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (33, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (34, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:52:44');
INSERT INTO `gen_table_column` VALUES (35, '3', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (36, '3', 'title', '电影名', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (37, '3', 'name', '导演', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (38, '3', 'mobile', '片长', 'varchar(20)', 'String', 'mobile', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (39, '3', 'address', '类型', 'varchar(500)', 'String', 'address', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 5, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (40, '3', 'content', '简介', 'longtext', 'String', 'content', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'editor', '', 6, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (41, '3', 'imgs', '视频', 'varchar(500)', 'String', 'imgs', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'fileUpload', '', 7, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (42, '3', 'num', '序号', 'bigint', 'Long', 'num', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (43, '3', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'select', '电影状态', 9, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (44, '3', 'date1', '上映时间', 'datetime', 'Date', 'date1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 10, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (45, '3', 'field1', '评分', 'varchar(255)', 'String', 'field1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (46, '3', 'field2', '国家', 'varchar(255)', 'String', 'field2', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (47, '3', 'field3', '语言', 'varchar(255)', 'String', 'field3', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (48, '3', 'field5', '封面图', 'varchar(500)', 'String', 'field5', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 14, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (49, '3', 'field6', '字段6', 'varchar(500)', 'String', 'field6', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'textarea', '', 15, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (50, '3', 'field7', '字段7', 'varchar(500)', 'String', 'field7', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'textarea', '', 16, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (51, '3', 'field8', '字段8', 'int', 'Long', 'field8', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (52, '3', 'field9', '字段9', 'int', 'Long', 'field9', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (53, '3', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (54, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (55, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (56, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 22, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (57, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 23, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (58, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'textarea', '', 24, 'root', '2023-08-31 10:12:48', '', '2023-08-31 11:01:24');
INSERT INTO `gen_table_column` VALUES (59, '4', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (60, '4', 'title', '标题', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (61, '4', 'name', '名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, NULL, NULL, NULL, NULL, 'LIKE', 'input', '', 3, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (62, '4', 'address', '内容', 'varchar(500)', 'String', 'address', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'editor', '', 4, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (63, '4', 'num', '序号', 'bigint', 'Long', 'num', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 5, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (64, '4', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'radio', '', 6, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (65, '4', 'date1', '发布时间', 'datetime', 'Date', 'date1', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'datetime', '', 7, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (66, '4', 'field1', '字段1', 'varchar(255)', 'String', 'field1', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (67, '4', 'field2', '字段2', 'varchar(255)', 'String', 'field2', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 9, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (68, '4', 'field3', '字段3', 'varchar(255)', 'String', 'field3', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (69, '4', 'field4', '字段4', 'varchar(255)', 'String', 'field4', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (70, '4', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (71, '4', 'create_by', '发布人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, '1', NULL, 'EQ', 'input', '', 13, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (72, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (73, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (74, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (75, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'root', '2023-08-31 10:12:48', '', '2023-08-31 10:20:17');
INSERT INTO `gen_table_column` VALUES (76, '5', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'root', '2023-09-02 15:27:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '5', 'title', '电影类型', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-09-02 15:27:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '5', 'name', '电影名称', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '5', 'address', '地址', 'varchar(500)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '5', 'num', '用户ID', 'bigint', 'Long', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '5', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '5', 'date1', '时间', 'datetime', 'Date', 'date1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '5', 'field1', '字段1', 'varchar(255)', 'String', 'field1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '5', 'field2', '字段2', 'varchar(255)', 'String', 'field2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '5', 'field3', '字段3', 'varchar(255)', 'String', 'field3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '5', 'field4', '字段4', 'varchar(255)', 'String', 'field4', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '5', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'root', '2023-09-02 15:27:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, '6', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, '6', 'title', '电影名称', 'varchar(255)', 'String', 'title', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, '6', 'name', '导演', 'varchar(200)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, '6', 'mobile', '片长', 'varchar(20)', 'String', 'mobile', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, '6', 'address', '分类', 'varchar(500)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '6', 'content', '简介', 'longtext', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 6, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '6', 'imgs', '视频', 'varchar(500)', 'String', 'imgs', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '6', 'num', '序号', 'bigint', 'Long', 'num', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '6', 'status', '状态', 'varchar(20)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, '6', 'date1', '上映时间', 'datetime', 'Date', 'date1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '6', 'field1', '评分', 'varchar(255)', 'String', 'field1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '6', 'field2', '国家', 'varchar(255)', 'String', 'field2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '6', 'field3', '语言', 'varchar(255)', 'String', 'field3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '6', 'field5', '封面图', 'varchar(500)', 'String', 'field5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 14, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '6', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '6', 'field7', '字段7', 'varchar(500)', 'String', 'field7', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 16, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '6', 'field8', '字段8', 'int', 'Long', 'field8', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '6', 'field9', '字段9', 'int', 'Long', 'field9', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '6', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 20, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 22, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 23, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 24, 'root', '2023-09-02 19:12:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '7', 'id', 'ID', 'int', 'Long', 'id', '1', '1', NULL, NULL, NULL, '1', NULL, 'EQ', 'input', '', 1, 'root', '2023-09-06 17:41:38', '', '2023-09-06 17:42:13');
INSERT INTO `gen_table_column` VALUES (118, '7', 'img', '轮播图', 'varchar(255)', 'String', 'img', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'imageUpload', '', 2, 'root', '2023-09-06 17:41:38', '', '2023-09-06 17:42:13');
INSERT INTO `gen_table_column` VALUES (119, '7', 'name', '图片名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', NULL, 'LIKE', 'input', '', 3, 'root', '2023-09-06 17:41:38', '', '2023-09-06 17:42:13');
INSERT INTO `gen_table_column` VALUES (120, '7', 'rl', '备注', 'varchar(255)', 'String', 'rl', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'root', '2023-09-06 17:41:38', '', '2023-09-06 17:42:13');
INSERT INTO `gen_table_column` VALUES (121, '8', 'movie_rating_id', '电影评分', 'bigint', 'Long', 'movieRatingId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'root', '2023-09-27 15:08:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '8', 'movie_rating_source', '分数', 'int', 'Long', 'movieRatingSource', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'root', '2023-09-27 15:08:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '8', 'films_id', '电影id', 'bigint', 'Long', 'filmsId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'root', '2023-09-27 15:08:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (124, '8', 'user_id', '用户Id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'root', '2023-09-27 15:08:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (125, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'root', '2023-09-27 15:08:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (126, '8', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'root', '2023-09-27 15:08:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, '8', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, '', '2023-09-27 15:10:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (128, '8', 'update_by', '修改者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, '', '2023-09-27 15:10:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (129, '8', 'remarks', '备注', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2023-09-27 15:10:44', '', NULL);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电影名称',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导演',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '片长',
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简介',
  `imgs` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频',
  `num` bigint NULL DEFAULT NULL COMMENT '电影ID',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待审核' COMMENT '状态',
  `date1` datetime NULL DEFAULT NULL COMMENT '上映时间',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评分',
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `field5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面图',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `field7` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段7',
  `field8` int NULL DEFAULT NULL COMMENT '字段8',
  `field9` int NULL DEFAULT NULL COMMENT '字段9',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '观看历史' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (27, '666', '666', '300', '历史', '444', 'http://localhost:9001/profile/upload/2023/09/06/【高清MP4电影www.mp4so.co_DE7EE8.mp4', 6, '1', '2023-09-06 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/06/屏幕截图 2023-09-04 1459_929E5B.png', 101, NULL, NULL, NULL, '0', '', '2023-09-07 00:27:03', '', NULL, NULL);
INSERT INTO `history` VALUES (29, '小说视频', 'zfx', '40', '小说', '小说', 'http://localhost:9001/profile/upload/2023/08/31/3ee7e71b3827c63c0ca2ae7182c8de78.mp4', 4, '1', '2023-09-02 00:00:00', '10', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/02/3ee7e71b3827c63c0ca2_F4E7AB.jpg', 101, NULL, NULL, NULL, '0', '', '2023-09-07 00:57:02', '', '2023-09-06 11:04:42', NULL);
INSERT INTO `history` VALUES (30, '犬舍真人版', '1', '100', '科幻', '111', 'http://localhost:9001/profile/upload/2023/09/06/【高清MP4电影www.mp4so.co_B7AFCA.mp4', 7, '1', '2023-09-06 00:00:00', '2', 'asdf', 'dfasf', 'http://localhost:9001/profile/upload/2023/09/06/屏幕截图 2023-08-28 1500_386838.png', 100, NULL, NULL, NULL, '0', '', '2023-09-13 14:52:59', '', '2023-09-06 23:24:56', NULL);
INSERT INTO `history` VALUES (31, '科幻', '1', '50', '科幻', '科幻电影', 'http://localhost:9001/profile/upload/2023/08/31/20230627_182816_AB3E87.mp4', 1, '1', '2023-08-31 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/08/31/v2-f810abd43af49dd43_202EA4.png', 100, NULL, NULL, NULL, '0', '', '2023-09-13 15:59:28', '', '2023-09-06 11:04:32', NULL);
INSERT INTO `history` VALUES (32, '科幻的', '1', '50', '科幻', '科幻电影', 'http://localhost:9001/profile/upload/2023/09/25/20230912_110831_9B3E3B.mp4', 1, '1', '2023-08-31 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/25/5_B7EAE1.jpg', 100, NULL, NULL, NULL, '0', '', '2023-09-25 14:38:05', '', '2023-09-25 14:37:32', NULL);
INSERT INTO `history` VALUES (33, '犬舍真人版1', 'root', '100', '搞笑', '【高清MP4电影www.mp4so.com】犬舍真人版.Inuyashiki.2018.BD720p.日语中字', 'http://localhost:9001/profile/upload/2023/09/13/Document — Mozilla F_D7550D.mp4', 11, '1', '2023-09-06 00:00:00', '7', '美国', '英语', 'http://localhost:9001/profile/upload/2023/09/13/e0a20236df70e55a9576_DF2243.jpg', 101, NULL, NULL, NULL, '0', '', '2023-09-25 14:38:43', '', '2023-09-06 16:34:54', NULL);
INSERT INTO `history` VALUES (34, '动漫', '111', '30', '动漫', '111', 'http://localhost:9001/profile/upload/2023/09/13/Document — Mozilla F_D7550D.mp4', 2, '1', '2023-08-31 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/13/e0a20236df70e55a9576_DF2243.jpg', 100, NULL, NULL, NULL, '0', '', '2023-09-25 14:39:12', '', '2023-09-06 12:06:01', NULL);
INSERT INTO `history` VALUES (35, '动漫44', '111', '30', '动漫', '111444', 'http://localhost:9001/profile/upload/2023/09/25/test_A776E6.mp4', 2, '1', '2023-08-31 00:00:00', '6', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/25/12312231w_2A8248.png', 100, NULL, NULL, NULL, '0', '', '2023-09-25 14:40:42', '', '2023-09-25 14:40:34', NULL);
INSERT INTO `history` VALUES (36, '6663', '666', '300', '历史', '444', 'http://localhost:9001/profile/upload/2023/09/13/Document — Mozilla F_D7550D.mp4', 24, '1', '2023-09-06 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/13/e0a20236df70e55a9576_DF2243.jpg', 100, NULL, NULL, NULL, '0', '', '2023-09-26 13:25:01', '', '2023-09-07 00:34:53', NULL);
INSERT INTO `history` VALUES (37, '科幻1', '1', '50', '科幻', '科幻电影', 'http://localhost:9001/profile/upload/2023/09/13/Document — Mozilla F_D7550D.mp4', 8, '1', '2023-08-31 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/13/e0a20236df70e55a9576_DF2243.jpg', 101, NULL, NULL, NULL, '0', '', '2023-09-26 13:52:42', '', '2023-09-13 16:00:03', NULL);
INSERT INTO `history` VALUES (38, '流浪地球', '郭帆', '125', '科幻', '近年来，科学家们发现太阳急速衰老膨胀，短时间内包括地球在内的整个太阳系都将被太阳所吞没。为了自救，人类提出一个名为“流浪地球”的大胆计划，即倾全球之力在地球表面建造上万座发动机和转向发动机，推动地球离开太阳系，用2500年的时间奔往另外一个栖息之地。\n\n中国航天员刘培强（吴京 饰）在儿子刘启四岁那年前往国际空间站，和国际同侪肩负起领航者的重任。转眼刘启（屈楚萧 饰）长大，他带着妹妹朵朵（赵今麦 饰）偷偷跑到地表，偷开外公韩子昂（吴孟达 饰）的运输车，结果不仅遭到逮捕，还遭遇了全球发动机停摆的事件。为了修好发动机，阻止地球坠入木星，全球开始展开饱和式营救，连刘启他们的车也被强征加入。在与时间赛跑的过程中，无数的人前仆后继，奋不顾身，只为延续百代子孙生存的希望。', 'http://localhost:9001/profile/upload/2023/09/25/20230912_110831_9B3E3B.mp4', 1, '1', '2019-02-05 00:00:00', '4', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/26/800_033D2C.jpg', 100, NULL, NULL, NULL, '0', '', '2023-09-26 15:37:46', '', '2023-09-26 15:37:18', NULL);
INSERT INTO `history` VALUES (39, '铃芽之旅', '新海诚', '121', '动漫', '生活在日本九州田舍的17岁少女・鈴芽遇见了为了寻找“门”而踏上旅途的青年。追随着青年的脚步，铃芽来到了山上一片废墟之地，在这里静静伫立着一扇古老的门，仿佛是坍塌中存留的唯一遗迹。铃芽仿佛被什么吸引了一般，将手伸向了那扇门…', 'http://localhost:9001/profile/upload/2023/09/25/test_A776E6.mp4', 2, '1', '2023-03-02 00:00:00', '8', '日本', '日语', 'http://localhost:9001/profile/upload/2023/09/26/1000_B02E47.png', 100, NULL, NULL, NULL, '0', '', '2023-09-26 16:07:42', '', '2023-09-26 16:05:32', NULL);
INSERT INTO `history` VALUES (40, '金陵十三钗', '张艺谋', '145', '历史', '1937年南京沦陷，只有一座天主教堂暂时未被占领，教会学校女学生、秦淮河畔风尘女子、军人和伤兵，还有一个美国人约翰，都先后进了教堂，在这个相对封闭的空间里，他们共同面对一场生死浩劫，产生了各种各样奇妙的感情。然而，教堂也不是永远的净土，暂时的宁静很快被打破。', 'http://localhost:9001/profile/upload/2023/09/26/20220530_162009_619EAC.mp4', 27, '1', '2011-12-16 00:00:00', '5', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/26/800_BE1F65.jpg', 101, NULL, NULL, NULL, '0', '', '2023-09-26 16:44:37', '', NULL, NULL);
INSERT INTO `history` VALUES (41, '绣春刀·修罗战场', '路阳', '120', '古装', '明天启七年，北镇抚司锦衣卫沈炼（张震 饰）在一次扫除乱党任务中，为救画师北斋（杨幂 饰），将同僚凌云铠（武强 饰）灭口。此后一方面要摆脱来自陆文昭（张译 饰）、裴纶（雷佳音 饰）的质疑与调查，一方面又在神秘女子的要挟下放火烧了锦衣卫案牍库。', 'http://localhost:9001/profile/upload/2023/09/26/20220530_162009_39E9F5.mp4', 4, '1', '2017-07-19 00:00:00', '4.5', '中国', '汉语', 'http://localhost:9001/profile/upload/2023/09/26/thumb_1_340_453_2017_9841A4.jpg', 100, NULL, NULL, NULL, '0', '', '2023-09-27 09:58:23', '', NULL, NULL);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `num` bigint NULL DEFAULT NULL COMMENT '序号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态',
  `date1` datetime NULL DEFAULT NULL COMMENT '时间',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段1',
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段2',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段3',
  `field4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段4',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '测试公告', 'test', '<p><strong><em>【电影院公告】尊敬的观众朋友们，欢迎来到我们的电影院！为了确保您有一个愉快、舒适和安全的观影体验，请仔细阅读以下公告内容：1. 观影须知：   - 请提前选择好您心仪的电影，并按时购买电影票。电影票可在售票处购买或网上预订。   - 请在观影开始前留出时间，到达电影院并领取您的座位号。   - 为了不影响其他观众的观影体验，请关闭手机或调至静音模式。2. 座位安排：   - 请按照指定座位入座，不要随意更换座位，以免引起混乱。   - 请勿将个人物品放置在紧急出口或走道上，以确保观影期间的安全通行。3. 影片播放：   - 请遵守影片播放时间，准时进入影厅并入座。逾期入场可能导致错过部分或全部电影内容。   - 在影片播放期间，请保持安静，尽量避免大声喧哗，以免影响其他观众的观影体验。如果您在观影过程中遇到任何问题或需要帮助，请随时联系我们的工作人员。祝您观影愉快，谢谢！</em></strong></p>', NULL, '0', '2023-08-31 00:00:00', NULL, NULL, NULL, NULL, '0', '', '2023-09-06 18:10:48', '', '2023-09-27 15:00:37', '测试');
INSERT INTO `notice` VALUES (34, '2023.9.26公告', 'admin', '环宇影视爱好者网络社区感谢您一路的陪伴每一段电影时光 在喜悦中度过······现在赶快关注我们微信号电影资讯、影片信息影城最新咨询及影迷活动第一时间掌握！', NULL, '0', '2023-09-26 00:00:00', NULL, NULL, NULL, NULL, '0', '', '2023-09-26 16:00:44', '', NULL, '无');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-12-15 15:11:22', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-12-15 15:11:22', '', NULL, ' 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-12-15 15:11:22', '', NULL, 'theme-dark，theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-', 'sys.account.captchaOnOff', 'false', 'Y', 'admin', '2021-12-15 15:11:22', '', NULL, '');
INSERT INTO `sys_config` VALUES (5, '账号自助-', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-12-15 15:11:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', 'admin', '2021-12-17 23:58:53');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-15 15:11:21', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (136, 1, '有效', '有效', 'default_status', NULL, 'default', 'N', '0', 'admin', '2022-02-24 17:34:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 2, '无效', '无效', 'default_status', NULL, 'default', 'N', '0', 'admin', '2022-02-24 17:34:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 0, '上映', '1', '电影状态', '上映', 'primary', 'N', '0', 'root', '2023-08-31 10:59:25', 'root', '2023-08-31 11:00:17', '上映');
INSERT INTO `sys_dict_data` VALUES (139, 1, '下架', '0', '电影状态', '下架', 'danger', 'N', '0', 'root', '2023-08-31 10:59:48', 'root', '2023-08-31 11:00:10', '下架');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-12-15 15:11:21', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (110, '默认状态', 'default_status', '0', 'admin', '2022-02-24 17:34:02', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '电影状态', '电影状态', '0', 'root', '2023-08-31 10:58:39', '', NULL, '电影状态');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 266 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 00:08:59');
INSERT INTO `sys_logininfor` VALUES (2, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 00:12:39');
INSERT INTO `sys_logininfor` VALUES (3, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 00:13:52');
INSERT INTO `sys_logininfor` VALUES (4, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 00:14:06');
INSERT INTO `sys_logininfor` VALUES (5, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-31 09:48:05');
INSERT INTO `sys_logininfor` VALUES (6, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-31 09:48:13');
INSERT INTO `sys_logininfor` VALUES (7, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 09:48:44');
INSERT INTO `sys_logininfor` VALUES (8, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 11:55:04');
INSERT INTO `sys_logininfor` VALUES (9, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-31 11:55:12');
INSERT INTO `sys_logininfor` VALUES (10, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 11:55:17');
INSERT INTO `sys_logininfor` VALUES (11, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 13:59:23');
INSERT INTO `sys_logininfor` VALUES (12, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-31 15:39:40');
INSERT INTO `sys_logininfor` VALUES (13, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 15:39:44');
INSERT INTO `sys_logininfor` VALUES (14, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 15:41:59');
INSERT INTO `sys_logininfor` VALUES (15, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 15:42:14');
INSERT INTO `sys_logininfor` VALUES (16, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:24:19');
INSERT INTO `sys_logininfor` VALUES (17, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:27:22');
INSERT INTO `sys_logininfor` VALUES (18, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:27:56');
INSERT INTO `sys_logininfor` VALUES (19, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:31:23');
INSERT INTO `sys_logininfor` VALUES (20, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:36:32');
INSERT INTO `sys_logininfor` VALUES (21, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:37:26');
INSERT INTO `sys_logininfor` VALUES (22, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:39:27');
INSERT INTO `sys_logininfor` VALUES (23, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:40:36');
INSERT INTO `sys_logininfor` VALUES (24, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:41:04');
INSERT INTO `sys_logininfor` VALUES (25, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:42:41');
INSERT INTO `sys_logininfor` VALUES (26, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:43:20');
INSERT INTO `sys_logininfor` VALUES (27, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:43:42');
INSERT INTO `sys_logininfor` VALUES (28, '1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：1 不存在', '2023-08-31 16:45:13');
INSERT INTO `sys_logininfor` VALUES (29, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:47:36');
INSERT INTO `sys_logininfor` VALUES (30, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:52:12');
INSERT INTO `sys_logininfor` VALUES (31, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:53:24');
INSERT INTO `sys_logininfor` VALUES (32, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:55:45');
INSERT INTO `sys_logininfor` VALUES (33, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 16:57:01');
INSERT INTO `sys_logininfor` VALUES (34, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:11:29');
INSERT INTO `sys_logininfor` VALUES (35, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:17:34');
INSERT INTO `sys_logininfor` VALUES (36, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:19:07');
INSERT INTO `sys_logininfor` VALUES (37, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:19:16');
INSERT INTO `sys_logininfor` VALUES (38, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:20:21');
INSERT INTO `sys_logininfor` VALUES (39, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:20:51');
INSERT INTO `sys_logininfor` VALUES (40, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 17:50:14');
INSERT INTO `sys_logininfor` VALUES (41, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:21:21');
INSERT INTO `sys_logininfor` VALUES (42, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 18:25:01');
INSERT INTO `sys_logininfor` VALUES (43, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:25:17');
INSERT INTO `sys_logininfor` VALUES (44, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 18:25:54');
INSERT INTO `sys_logininfor` VALUES (45, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:26:04');
INSERT INTO `sys_logininfor` VALUES (46, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 18:26:54');
INSERT INTO `sys_logininfor` VALUES (47, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:27:09');
INSERT INTO `sys_logininfor` VALUES (48, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 18:27:57');
INSERT INTO `sys_logininfor` VALUES (49, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:28:07');
INSERT INTO `sys_logininfor` VALUES (50, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-08-31 18:35:31');
INSERT INTO `sys_logininfor` VALUES (51, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:35:41');
INSERT INTO `sys_logininfor` VALUES (52, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:43:32');
INSERT INTO `sys_logininfor` VALUES (53, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:44:53');
INSERT INTO `sys_logininfor` VALUES (54, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-08-31 18:45:30');
INSERT INTO `sys_logininfor` VALUES (55, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 09:53:55');
INSERT INTO `sys_logininfor` VALUES (56, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 10:33:26');
INSERT INTO `sys_logininfor` VALUES (57, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 11:38:01');
INSERT INTO `sys_logininfor` VALUES (58, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 11:38:09');
INSERT INTO `sys_logininfor` VALUES (59, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 11:39:08');
INSERT INTO `sys_logininfor` VALUES (60, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 17:16:46');
INSERT INTO `sys_logininfor` VALUES (61, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 17:18:17');
INSERT INTO `sys_logininfor` VALUES (62, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 17:28:36');
INSERT INTO `sys_logininfor` VALUES (63, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 18:38:40');
INSERT INTO `sys_logininfor` VALUES (64, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-01 22:49:29');
INSERT INTO `sys_logininfor` VALUES (65, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-02 00:17:02');
INSERT INTO `sys_logininfor` VALUES (66, 'rooot', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：rooot 不存在', '2023-09-02 00:42:39');
INSERT INTO `sys_logininfor` VALUES (67, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 00:42:43');
INSERT INTO `sys_logininfor` VALUES (68, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:09:59');
INSERT INTO `sys_logininfor` VALUES (69, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:33:20');
INSERT INTO `sys_logininfor` VALUES (70, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:33:26');
INSERT INTO `sys_logininfor` VALUES (71, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:42:52');
INSERT INTO `sys_logininfor` VALUES (72, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:44:21');
INSERT INTO `sys_logininfor` VALUES (73, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:44:37');
INSERT INTO `sys_logininfor` VALUES (74, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 11:45:16');
INSERT INTO `sys_logininfor` VALUES (75, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 13:37:29');
INSERT INTO `sys_logininfor` VALUES (76, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 14:48:33');
INSERT INTO `sys_logininfor` VALUES (77, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 16:02:25');
INSERT INTO `sys_logininfor` VALUES (78, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:26:59');
INSERT INTO `sys_logininfor` VALUES (79, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:27:36');
INSERT INTO `sys_logininfor` VALUES (80, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:33:15');
INSERT INTO `sys_logininfor` VALUES (81, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:34:41');
INSERT INTO `sys_logininfor` VALUES (82, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:36:41');
INSERT INTO `sys_logininfor` VALUES (83, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-02 17:40:06');
INSERT INTO `sys_logininfor` VALUES (84, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:40:14');
INSERT INTO `sys_logininfor` VALUES (85, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-02 17:40:21');
INSERT INTO `sys_logininfor` VALUES (86, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:40:29');
INSERT INTO `sys_logininfor` VALUES (87, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-02 17:41:17');
INSERT INTO `sys_logininfor` VALUES (88, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:41:26');
INSERT INTO `sys_logininfor` VALUES (89, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-02 17:41:33');
INSERT INTO `sys_logininfor` VALUES (90, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:41:41');
INSERT INTO `sys_logininfor` VALUES (91, 'user', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-02 17:43:26');
INSERT INTO `sys_logininfor` VALUES (92, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:45:55');
INSERT INTO `sys_logininfor` VALUES (93, 'user', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-02 17:46:52');
INSERT INTO `sys_logininfor` VALUES (94, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:47:38');
INSERT INTO `sys_logininfor` VALUES (95, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:48:22');
INSERT INTO `sys_logininfor` VALUES (96, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:50:11');
INSERT INTO `sys_logininfor` VALUES (97, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:56:57');
INSERT INTO `sys_logininfor` VALUES (98, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:57:24');
INSERT INTO `sys_logininfor` VALUES (99, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-02 17:58:08');
INSERT INTO `sys_logininfor` VALUES (100, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 17:59:25');
INSERT INTO `sys_logininfor` VALUES (101, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 18:24:52');
INSERT INTO `sys_logininfor` VALUES (102, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 19:12:05');
INSERT INTO `sys_logininfor` VALUES (103, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 20:15:06');
INSERT INTO `sys_logininfor` VALUES (104, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-02 20:16:33');
INSERT INTO `sys_logininfor` VALUES (105, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 14:19:08');
INSERT INTO `sys_logininfor` VALUES (106, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 21:02:34');
INSERT INTO `sys_logininfor` VALUES (107, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 21:41:24');
INSERT INTO `sys_logininfor` VALUES (108, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 22:19:32');
INSERT INTO `sys_logininfor` VALUES (109, 'user2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:18:45');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:20:21');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-03 23:20:30');
INSERT INTO `sys_logininfor` VALUES (112, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:20:38');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-03 23:22:56');
INSERT INTO `sys_logininfor` VALUES (114, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-03 23:23:31');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:24:57');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-03 23:30:26');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:30:36');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-03 23:30:58');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:31:24');
INSERT INTO `sys_logininfor` VALUES (120, 'user3', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-03 23:43:58');
INSERT INTO `sys_logininfor` VALUES (121, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 14:12:42');
INSERT INTO `sys_logininfor` VALUES (122, 'user2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 15:56:21');
INSERT INTO `sys_logininfor` VALUES (123, 'user2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 15:56:53');
INSERT INTO `sys_logininfor` VALUES (124, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:09:51');
INSERT INTO `sys_logininfor` VALUES (125, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:16:30');
INSERT INTO `sys_logininfor` VALUES (126, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:23:36');
INSERT INTO `sys_logininfor` VALUES (127, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:27:23');
INSERT INTO `sys_logininfor` VALUES (128, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:27:55');
INSERT INTO `sys_logininfor` VALUES (129, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:29:30');
INSERT INTO `sys_logininfor` VALUES (130, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:34:53');
INSERT INTO `sys_logininfor` VALUES (131, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:43:03');
INSERT INTO `sys_logininfor` VALUES (132, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:45:52');
INSERT INTO `sys_logininfor` VALUES (133, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:45:56');
INSERT INTO `sys_logininfor` VALUES (134, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:46:48');
INSERT INTO `sys_logininfor` VALUES (135, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:52:05');
INSERT INTO `sys_logininfor` VALUES (136, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:55:14');
INSERT INTO `sys_logininfor` VALUES (137, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 16:57:45');
INSERT INTO `sys_logininfor` VALUES (138, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:01:29');
INSERT INTO `sys_logininfor` VALUES (139, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:03:07');
INSERT INTO `sys_logininfor` VALUES (140, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:03:32');
INSERT INTO `sys_logininfor` VALUES (141, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:04:49');
INSERT INTO `sys_logininfor` VALUES (142, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:07:22');
INSERT INTO `sys_logininfor` VALUES (143, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:07:52');
INSERT INTO `sys_logininfor` VALUES (144, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:08:01');
INSERT INTO `sys_logininfor` VALUES (145, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:09:10');
INSERT INTO `sys_logininfor` VALUES (146, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:10:11');
INSERT INTO `sys_logininfor` VALUES (147, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:29:24');
INSERT INTO `sys_logininfor` VALUES (148, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:49:10');
INSERT INTO `sys_logininfor` VALUES (149, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:50:49');
INSERT INTO `sys_logininfor` VALUES (150, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 17:52:33');
INSERT INTO `sys_logininfor` VALUES (151, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:03:09');
INSERT INTO `sys_logininfor` VALUES (152, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:12:44');
INSERT INTO `sys_logininfor` VALUES (153, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:13:33');
INSERT INTO `sys_logininfor` VALUES (154, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:13:34');
INSERT INTO `sys_logininfor` VALUES (155, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:13:37');
INSERT INTO `sys_logininfor` VALUES (156, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:13:37');
INSERT INTO `sys_logininfor` VALUES (157, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:13:43');
INSERT INTO `sys_logininfor` VALUES (158, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:13:59');
INSERT INTO `sys_logininfor` VALUES (159, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:14:03');
INSERT INTO `sys_logininfor` VALUES (160, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:19:28');
INSERT INTO `sys_logininfor` VALUES (161, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-04 18:19:28');
INSERT INTO `sys_logininfor` VALUES (162, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 18:21:27');
INSERT INTO `sys_logininfor` VALUES (163, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 20:43:38');
INSERT INTO `sys_logininfor` VALUES (164, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 20:54:59');
INSERT INTO `sys_logininfor` VALUES (165, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-04 20:59:16');
INSERT INTO `sys_logininfor` VALUES (166, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-04 20:59:28');
INSERT INTO `sys_logininfor` VALUES (167, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 21:04:20');
INSERT INTO `sys_logininfor` VALUES (168, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 21:08:02');
INSERT INTO `sys_logininfor` VALUES (169, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 21:08:06');
INSERT INTO `sys_logininfor` VALUES (170, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 21:08:12');
INSERT INTO `sys_logininfor` VALUES (171, 'user4', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-04 21:09:07');
INSERT INTO `sys_logininfor` VALUES (172, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-05 09:55:44');
INSERT INTO `sys_logininfor` VALUES (173, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 10:43:50');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-06 10:44:18');
INSERT INTO `sys_logininfor` VALUES (175, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 10:44:34');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-06 11:18:03');
INSERT INTO `sys_logininfor` VALUES (177, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 12:02:48');
INSERT INTO `sys_logininfor` VALUES (178, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 13:42:47');
INSERT INTO `sys_logininfor` VALUES (179, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 15:12:20');
INSERT INTO `sys_logininfor` VALUES (180, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 15:20:08');
INSERT INTO `sys_logininfor` VALUES (181, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 17:41:26');
INSERT INTO `sys_logininfor` VALUES (182, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 18:26:02');
INSERT INTO `sys_logininfor` VALUES (183, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 22:33:05');
INSERT INTO `sys_logininfor` VALUES (184, 'root', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-06 22:38:12');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 22:39:09');
INSERT INTO `sys_logininfor` VALUES (186, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-06 22:39:54');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2023-09-06 22:43:41');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 22:43:53');
INSERT INTO `sys_logininfor` VALUES (189, 'user2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 22:47:47');
INSERT INTO `sys_logininfor` VALUES (190, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 22:52:10');
INSERT INTO `sys_logininfor` VALUES (191, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 23:13:27');
INSERT INTO `sys_logininfor` VALUES (192, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-06 23:23:27');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-07 00:31:33');
INSERT INTO `sys_logininfor` VALUES (194, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-07 00:33:26');
INSERT INTO `sys_logininfor` VALUES (195, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-07 00:48:50');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-13 10:40:58');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 10:41:03');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 10:41:13');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 10:42:58');
INSERT INTO `sys_logininfor` VALUES (200, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 13:34:19');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 13:41:20');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 14:47:08');
INSERT INTO `sys_logininfor` VALUES (203, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:27:33');
INSERT INTO `sys_logininfor` VALUES (204, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:48:51');
INSERT INTO `sys_logininfor` VALUES (205, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:56:15');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-13 15:58:56');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:58:59');
INSERT INTO `sys_logininfor` VALUES (208, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 15:59:11');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 17:34:15');
INSERT INTO `sys_logininfor` VALUES (210, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 17:34:58');
INSERT INTO `sys_logininfor` VALUES (211, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-15 14:24:07');
INSERT INTO `sys_logininfor` VALUES (212, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 14:24:14');
INSERT INTO `sys_logininfor` VALUES (213, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 14:29:11');
INSERT INTO `sys_logininfor` VALUES (214, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-15 14:31:41');
INSERT INTO `sys_logininfor` VALUES (215, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 14:32:37');
INSERT INTO `sys_logininfor` VALUES (216, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-15 14:38:22');
INSERT INTO `sys_logininfor` VALUES (217, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 14:43:00');
INSERT INTO `sys_logininfor` VALUES (218, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 14:43:22');
INSERT INTO `sys_logininfor` VALUES (219, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-15 15:06:55');
INSERT INTO `sys_logininfor` VALUES (220, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:30:38');
INSERT INTO `sys_logininfor` VALUES (221, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:14');
INSERT INTO `sys_logininfor` VALUES (222, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:19');
INSERT INTO `sys_logininfor` VALUES (223, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:21');
INSERT INTO `sys_logininfor` VALUES (224, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:21');
INSERT INTO `sys_logininfor` VALUES (225, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:22');
INSERT INTO `sys_logininfor` VALUES (226, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:23');
INSERT INTO `sys_logininfor` VALUES (227, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:27');
INSERT INTO `sys_logininfor` VALUES (228, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:31:36');
INSERT INTO `sys_logininfor` VALUES (229, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 15:33:06');
INSERT INTO `sys_logininfor` VALUES (230, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-15 15:33:16');
INSERT INTO `sys_logininfor` VALUES (231, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-15 15:33:52');
INSERT INTO `sys_logininfor` VALUES (232, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-15 15:34:01');
INSERT INTO `sys_logininfor` VALUES (233, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:34:11');
INSERT INTO `sys_logininfor` VALUES (234, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 15:34:17');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-09-15 15:35:39');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-15 15:35:41');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 15:35:48');
INSERT INTO `sys_logininfor` VALUES (238, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-15 15:35:56');
INSERT INTO `sys_logininfor` VALUES (239, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-15 15:35:59');
INSERT INTO `sys_logininfor` VALUES (240, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-15 15:36:04');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-25 14:17:25');
INSERT INTO `sys_logininfor` VALUES (242, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2023-09-25 14:20:45');
INSERT INTO `sys_logininfor` VALUES (243, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-25 14:20:49');
INSERT INTO `sys_logininfor` VALUES (244, 'user2', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-25 15:07:43');
INSERT INTO `sys_logininfor` VALUES (245, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-25 15:17:30');
INSERT INTO `sys_logininfor` VALUES (246, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '对不起，您的账号：user1 已停用', '2023-09-25 15:36:27');
INSERT INTO `sys_logininfor` VALUES (247, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2023-09-25 15:36:36');
INSERT INTO `sys_logininfor` VALUES (248, 'user1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2023-09-25 15:36:41');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 13:22:13');
INSERT INTO `sys_logininfor` VALUES (250, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 13:23:00');
INSERT INTO `sys_logininfor` VALUES (251, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 13:58:18');
INSERT INTO `sys_logininfor` VALUES (252, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-26 14:05:39');
INSERT INTO `sys_logininfor` VALUES (253, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 14:05:45');
INSERT INTO `sys_logininfor` VALUES (254, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 14:07:53');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 14:11:37');
INSERT INTO `sys_logininfor` VALUES (256, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 15:24:56');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 15:26:51');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 09:57:04');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-27 14:01:54');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-27 14:01:59');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-09-27 14:02:03');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 14:02:07');
INSERT INTO `sys_logininfor` VALUES (263, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 14:12:23');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 14:56:04');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 14:56:05');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-27 15:08:28');
INSERT INTO `sys_logininfor` VALUES (267, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-27 15:08:33');
INSERT INTO `sys_logininfor` VALUES (268, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 15:08:40');
INSERT INTO `sys_logininfor` VALUES (269, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 15:44:54');
INSERT INTO `sys_logininfor` VALUES (270, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-27 15:57:29');
INSERT INTO `sys_logininfor` VALUES (271, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 15:57:34');
INSERT INTO `sys_logininfor` VALUES (272, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-27 15:59:14');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 16:09:20');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2061 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 100, 'system', NULL, NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-12-15 15:11:21', 'root', '2022-12-05 21:35:56', '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 122, 'tool', NULL, NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-12-15 15:11:21', 'root', '2022-12-05 21:36:14', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 0, 1, 'system/user', 'system/user/index', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-12-15 15:11:21', 'root', '2023-08-31 10:31:17', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', NULL, 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', NULL, 1, 0, 'C', '1', '1', 'system:dept:list', 'tree', 'admin', '2021-12-15 15:11:21', 'root', '2022-12-05 18:41:21', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', NULL, 1, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2021-12-15 15:11:21', 'root', '2022-12-05 18:41:15', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', NULL, 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', NULL, 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 0, 11, 'system/notice', 'system/notice/index', NULL, 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2021-12-15 15:11:21', 'root', '2023-08-31 09:55:52', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', NULL, 1, 0, 'M', '1', '1', '', 'log', 'admin', '2021-12-15 15:11:21', 'root', '2022-02-25 12:11:24', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', NULL, 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', NULL, 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', NULL, 1, 0, 'C', '1', '1', 'tool:swagger:list', 'swagger', 'admin', '2021-12-15 15:11:21', 'admin', '2022-02-24 17:25:52', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', NULL, 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', NULL, 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', NULL, 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', NULL, 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', NULL, 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', NULL, 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-12-15 15:11:21', '', '2021-12-17 23:43:54', '');
INSERT INTO `sys_menu` VALUES (2003, '个人信息编辑', 0, 1, 'profile', 'system/user/profile', NULL, 1, 0, 'C', '0', '0', '', 'icon', 'root', '2022-12-05 18:44:13', 'root', '2022-12-05 18:44:41', '');
INSERT INTO `sys_menu` VALUES (2010, '公告管理', 0, 1, 'notice', 'biz/notice/index', NULL, 1, 0, 'C', '0', '0', 'biz:notice:list', 'list', 'admin', '2023-08-31 10:20:20', '', NULL, '公告管理菜单');
INSERT INTO `sys_menu` VALUES (2011, '公告管理查询', 2010, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:notice:query', '#', 'admin', '2023-08-31 10:20:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '公告管理新增', 2010, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:notice:add', '#', 'admin', '2023-08-31 10:20:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '公告管理修改', 2010, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:notice:edit', '#', 'admin', '2023-08-31 10:20:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '公告管理删除', 2010, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:notice:remove', '#', 'admin', '2023-08-31 10:20:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '公告管理导出', 2010, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:notice:export', '#', 'admin', '2023-08-31 10:20:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '分类管理', 0, 1, 'classification', 'biz/classification/index', NULL, 1, 0, 'C', '0', '0', 'biz:classification:list', 'list', 'admin', '2023-08-31 10:42:58', '', NULL, '分类管理菜单');
INSERT INTO `sys_menu` VALUES (2017, '分类管理查询', 2016, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:classification:query', '#', 'admin', '2023-08-31 10:42:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '分类管理新增', 2016, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:classification:add', '#', 'admin', '2023-08-31 10:42:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '分类管理修改', 2016, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:classification:edit', '#', 'admin', '2023-08-31 10:42:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '分类管理删除', 2016, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:classification:remove', '#', 'admin', '2023-08-31 10:42:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '分类管理导出', 2016, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:classification:export', '#', 'admin', '2023-08-31 10:42:58', 'root', '2023-09-06 22:40:44', '');
INSERT INTO `sys_menu` VALUES (2028, '评价管理', 0, 1, 'evaluate', 'biz/evaluate/index', NULL, 1, 0, 'C', '0', '0', 'biz:evaluate:list', 'list', 'admin', '2023-08-31 10:53:12', '', NULL, '评价管理菜单');
INSERT INTO `sys_menu` VALUES (2029, '评价管理查询', 2028, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:evaluate:query', '#', 'admin', '2023-08-31 10:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '评价管理新增', 2028, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:evaluate:add', '#', 'admin', '2023-08-31 10:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '评价管理修改', 2028, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:evaluate:edit', '#', 'admin', '2023-08-31 10:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '评价管理删除', 2028, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:evaluate:remove', '#', 'admin', '2023-08-31 10:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '评价管理导出', 2028, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:evaluate:export', '#', 'admin', '2023-08-31 10:53:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '电影管理', 0, 1, 'films', 'biz/films/index', NULL, 1, 0, 'C', '0', '0', 'biz:films:list', 'list', 'admin', '2023-08-31 11:01:29', '', NULL, '电影管理菜单');
INSERT INTO `sys_menu` VALUES (2041, '电影管理查询', 2040, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:films:query', '#', 'admin', '2023-08-31 11:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '电影管理新增', 2040, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:films:add', '#', 'admin', '2023-08-31 11:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '电影管理修改', 2040, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:films:edit', '#', 'admin', '2023-08-31 11:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '电影管理删除', 2040, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:films:remove', '#', 'admin', '2023-08-31 11:01:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '电影管理导出', 2040, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:films:export', '#', 'admin', '2023-08-31 11:01:29', 'root', '2023-09-06 22:40:18', '');
INSERT INTO `sys_menu` VALUES (2046, '收藏', 0, 1, 'collect', 'biz/collect/index', NULL, 1, 0, 'C', '1', '0', 'biz:collect:list', 'list', 'admin', '2023-09-02 15:28:47', 'root', '2023-09-02 17:41:11', '收藏菜单');
INSERT INTO `sys_menu` VALUES (2047, '收藏查询', 2046, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:collect:query', '#', 'admin', '2023-09-02 15:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '收藏新增', 2046, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:collect:add', '#', 'admin', '2023-09-02 15:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '收藏修改', 2046, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:collect:edit', '#', 'admin', '2023-09-02 15:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '收藏删除', 2046, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:collect:remove', '#', 'admin', '2023-09-02 15:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '收藏导出', 2046, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:collect:export', '#', 'admin', '2023-09-02 15:28:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '公告导入', 2010, 6, 'biz:notice:leading', NULL, NULL, 1, 0, 'F', '0', '0', 'biz:notice:import', 'documentation', 'root', '2023-09-06 11:07:54', 'root', '2023-09-06 11:09:28', '');
INSERT INTO `sys_menu` VALUES (2053, '电影导入', 2040, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'biz:films:import', '#', 'root', '2023-09-06 11:16:12', 'root', '2023-09-06 22:40:28', '');
INSERT INTO `sys_menu` VALUES (2054, '分类导入', 2016, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'biz:classification:import', '#', 'root', '2023-09-06 11:16:38', 'root', '2023-09-06 22:40:55', '');
INSERT INTO `sys_menu` VALUES (2055, '轮播图', 0, 1, 'carousel', 'biz/carousel/index', NULL, 1, 0, 'C', '0', '0', 'biz:carousel:list', 'list', 'admin', '2023-09-06 17:42:17', '', NULL, '轮播图菜单');
INSERT INTO `sys_menu` VALUES (2056, '轮播图查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:carousel:query', '#', 'admin', '2023-09-06 17:42:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '轮播图新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:carousel:add', '#', 'admin', '2023-09-06 17:42:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '轮播图修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:carousel:edit', '#', 'admin', '2023-09-06 17:42:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '轮播图删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:carousel:remove', '#', 'admin', '2023-09-06 17:42:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '轮播图导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:carousel:export', '#', 'admin', '2023-09-06 17:42:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '电影评分', 0, 1, 'rating', 'biz/rating/index', NULL, 1, 0, 'C', '1', '0', 'biz:rating:list', 'list', 'admin', '2023-09-27 15:10:46', 'root', '2023-09-27 15:59:06', '电影评分菜单');
INSERT INTO `sys_menu` VALUES (2062, '电影评分查询', 2061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:rating:query', '#', 'admin', '2023-09-27 15:10:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '电影评分新增', 2061, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:rating:add', '#', 'admin', '2023-09-27 15:10:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '电影评分修改', 2061, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:rating:edit', '#', 'admin', '2023-09-27 15:10:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '电影评分删除', 2061, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:rating:remove', '#', 'admin', '2023-09-27 15:10:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '电影评分导出', 2061, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:rating:export', '#', 'admin', '2023-09-27 15:10:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '用户管理', 6, 'com.manage.project.system.controller.SysUserController.importData()', 'POST', 1, 'root', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, 'Cannot invoke \"com.manage.project.system.domain.SysUser.getUserName()\" because \"user\" is null', '2023-08-31 00:38:42');
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"message\",\"orderNum\":\"11\",\"menuName\":\"通知公告\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system/notice\",\"component\":\"system/notice/index\",\"children\":[],\"createTime\":1639552281000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":107,\"menuType\":\"C\",\"perms\":\"system:notice:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 09:55:52');
INSERT INTO `sys_oper_log` VALUES (3, '代码生成', 6, 'com.manage.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'root', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'films,evaluate,classification,notice', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:12:48');
INSERT INTO `sys_oper_log` VALUES (4, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968710\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"名称\",\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Address\",\"usableColumn\":false,\"columnId\":62,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"address\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"地址\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"address\"},{\"c', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:15:45');
INSERT INTO `sys_oper_log` VALUES (5, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/notice', '127.0.0.1', '内网IP', '{tableName=notice}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:15:53');
INSERT INTO `sys_oper_log` VALUES (6, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968710\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":59,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"updateTime\":1693448145000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":60,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"标题\",\"isQuery\":\"1\",\"updateTime\":1693448145000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":61,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"名称\",\"updateTime\":1693448145000,\"sort\":3,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"tableId\":4,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Address\",\"usableColumn\":false,\"columnId\":62,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"address\",\"htmlType\":\"editor\",\"edit\":true,\"query\":false,\"columnComment\":\"内容\",\"updateTime\":1693448145000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:20:17');
INSERT INTO `sys_oper_log` VALUES (7, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/notice', '127.0.0.1', '内网IP', '{tableName=notice}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:20:20');
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:22:09');
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:22:12');
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:22:14');
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2008', '127.0.0.1', '内网IP', '{menuId=2008}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:22:16');
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2009', '127.0.0.1', '内网IP', '{menuId=2009}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:22:19');
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:22:23');
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"system/user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1639552281000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:31:11');
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"user\",\"orderNum\":\"1\",\"menuName\":\"用户管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"system/user\",\"component\":\"system/user/index\",\"children\":[],\"createTime\":1639552281000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":100,\"menuType\":\"C\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:31:17');
INSERT INTO `sys_oper_log` VALUES (16, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968475\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"电影类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":false,\"columnComment\":\"封面\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Address\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"address\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"介紹\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"table', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:42:52');
INSERT INTO `sys_oper_log` VALUES (17, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/classification', '127.0.0.1', '内网IP', '{tableName=classification}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:42:58');
INSERT INTO `sys_oper_log` VALUES (18, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968574\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"电影名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评价用户\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Address\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"address\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"内容\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"createBy\":\"ro', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:48:45');
INSERT INTO `sys_oper_log` VALUES (19, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968574\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"updateTime\":1693450125000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"电影名称\",\"isQuery\":\"1\",\"updateTime\":1693450125000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评价用户\",\"isQuery\":\"1\",\"updateTime\":1693450125000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Address\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"address\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"内容\",\"updateTime\":1693450125000,\"sor', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:49:18');
INSERT INTO `sys_oper_log` VALUES (20, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/evaluate', '127.0.0.1', '内网IP', '{tableName=evaluate}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:49:25');
INSERT INTO `sys_oper_log` VALUES (21, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968574\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"updateTime\":1693450158000,\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"电影名称\",\"isQuery\":\"1\",\"updateTime\":1693450158000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评价用户\",\"isQuery\":\"1\",\"updateTime\":1693450158000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Address\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"address\",\"htmlType\":\"textarea\",\"edit\":true,\"query\":false,\"columnComment\":\"内容\",\"updateTime\":1693450158000,\"sor', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:52:44');
INSERT INTO `sys_oper_log` VALUES (22, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/evaluate', '127.0.0.1', '内网IP', '{tableName=evaluate}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:12');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2023', '127.0.0.1', '内网IP', '{menuId=2023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:31');
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2025', '127.0.0.1', '内网IP', '{menuId=2025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:33');
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2024', '127.0.0.1', '内网IP', '{menuId=2024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:35');
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2026', '127.0.0.1', '内网IP', '{menuId=2026}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:36');
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:38');
INSERT INTO `sys_oper_log` VALUES (28, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2022', '127.0.0.1', '内网IP', '{menuId=2022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:53:41');
INSERT INTO `sys_oper_log` VALUES (29, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/films', '127.0.0.1', '内网IP', '{tableName=films}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:54:11');
INSERT INTO `sys_oper_log` VALUES (30, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968623\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"电影名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"导演\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Mobile\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"mobile\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"片长\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(20)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":3,\"p', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:58:11');
INSERT INTO `sys_oper_log` VALUES (31, '字典类型', 1, 'com.manage.project.system.controller.SysDictTypeController.add()', 'POST', 1, 'root', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"root\",\"dictName\":\"电影状态\",\"remark\":\"电影状态\",\"params\":{},\"dictType\":\"电影状态\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:58:39');
INSERT INTO `sys_oper_log` VALUES (32, '字典数据', 1, 'com.manage.project.system.controller.SysDictDataController.add()', 'POST', 1, 'root', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"success\",\"dictSort\":0,\"remark\":\"上映\",\"params\":{},\"dictType\":\"电影状态\",\"dictLabel\":\"上映\",\"createBy\":\"root\",\"default\":false,\"cssClass\":\"上映\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:59:25');
INSERT INTO `sys_oper_log` VALUES (33, '字典数据', 1, 'com.manage.project.system.controller.SysDictDataController.add()', 'POST', 1, 'root', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"default\",\"dictSort\":1,\"remark\":\"下架\",\"params\":{},\"dictType\":\"电影状态\",\"dictLabel\":\"下架\",\"createBy\":\"root\",\"default\":false,\"cssClass\":\"下架\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 10:59:48');
INSERT INTO `sys_oper_log` VALUES (34, '字典数据', 2, 'com.manage.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'root', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"primary\",\"dictSort\":1,\"remark\":\"下架\",\"params\":{},\"dictType\":\"电影状态\",\"dictLabel\":\"下架\",\"createBy\":\"root\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"下架\",\"createTime\":1693450788000,\"dictCode\":139,\"updateBy\":\"root\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:00:03');
INSERT INTO `sys_oper_log` VALUES (35, '字典数据', 2, 'com.manage.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'root', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"listClass\":\"danger\",\"dictSort\":1,\"remark\":\"下架\",\"params\":{},\"dictType\":\"电影状态\",\"dictLabel\":\"下架\",\"createBy\":\"root\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"下架\",\"createTime\":1693450788000,\"dictCode\":139,\"updateBy\":\"root\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:00:10');
INSERT INTO `sys_oper_log` VALUES (36, '字典数据', 2, 'com.manage.project.system.controller.SysDictDataController.edit()', 'PUT', 1, 'root', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"primary\",\"dictSort\":0,\"remark\":\"上映\",\"params\":{},\"dictType\":\"电影状态\",\"dictLabel\":\"上映\",\"createBy\":\"root\",\"default\":false,\"isDefault\":\"N\",\"cssClass\":\"上映\",\"createTime\":1693450765000,\"dictCode\":138,\"updateBy\":\"root\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:00:17');
INSERT INTO `sys_oper_log` VALUES (37, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693447968623\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"updateTime\":1693450691000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693447968000,\"tableId\":3,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"电影名\",\"isQuery\":\"1\",\"updateTime\":1693450691000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"导演\",\"isQuery\":\"1\",\"updateTime\":1693450691000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693447968000,\"isEdit\":\"1\",\"tableId\":3,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Mobile\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"mobile\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"片长\",\"updateTime\":1693450691000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"c', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:24');
INSERT INTO `sys_oper_log` VALUES (38, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/films', '127.0.0.1', '内网IP', '{tableName=films}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:29');
INSERT INTO `sys_oper_log` VALUES (39, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2035', '127.0.0.1', '内网IP', '{menuId=2035}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:51');
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:54');
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2037', '127.0.0.1', '内网IP', '{menuId=2037}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:56');
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2038', '127.0.0.1', '内网IP', '{menuId=2038}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:58');
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{menuId=2039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:01:59');
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2034', '127.0.0.1', '内网IP', '{menuId=2034}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 11:02:02');
INSERT INTO `sys_oper_log` VALUES (45, '用户管理', 6, 'com.manage.project.system.controller.SysUserController.importData()', 'POST', 1, 'root', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, 'Cannot invoke \"com.manage.project.system.domain.SysUser.getUserName()\" because \"user\" is null', '2023-08-31 11:40:29');
INSERT INTO `sys_oper_log` VALUES (46, '用户管理', 6, 'com.manage.project.system.controller.SysUserController.importData()', 'POST', 1, 'root', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, 'Cannot invoke \"com.manage.project.system.domain.SysUser.getUserName()\" because \"user\" is null', '2023-08-31 11:48:01');
INSERT INTO `sys_oper_log` VALUES (47, '用户管理', 6, 'com.manage.project.system.controller.SysUserController.importData()', 'POST', 1, 'root', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, 'Cannot invoke \"com.manage.project.system.domain.SysUser.getUserName()\" because \"user\" is null', '2023-08-31 11:48:53');
INSERT INTO `sys_oper_log` VALUES (48, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'root', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', NULL, 0, NULL, '2023-08-31 12:00:31');
INSERT INTO `sys_oper_log` VALUES (49, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'root', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', NULL, 0, NULL, '2023-08-31 13:59:48');
INSERT INTO `sys_oper_log` VALUES (50, '公告管理', 6, 'com.manage.project.biz.controller.ClassificationController.importData()', 'POST', 1, 'root', NULL, '/biz/classification/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 4 条，数据如下：\",\"code\":200}', 0, NULL, '2023-08-31 14:34:59');
INSERT INTO `sys_oper_log` VALUES (51, '公告管理', 6, 'com.manage.project.biz.controller.FilmsController.importData()', 'POST', 1, 'root', NULL, '/biz/films/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：\",\"code\":200}', 0, NULL, '2023-08-31 14:39:03');
INSERT INTO `sys_oper_log` VALUES (52, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.edit()', 'PUT', 1, 'root', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"13245657889\",\"admin\":false,\"loginDate\":1645762227000,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"root\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"用户1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user1\",\"userId\":101,\"createBy\":\"root\",\"roleIds\":[],\"createTime\":1645762154000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-08-31 14:44:59');
INSERT INTO `sys_oper_log` VALUES (53, '代码生成', 6, 'com.manage.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'root', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'collect', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 15:27:54');
INSERT INTO `sys_oper_log` VALUES (54, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'root', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-09-02 15:28:00');
INSERT INTO `sys_oper_log` VALUES (55, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.edit()', 'PUT', 1, 'root', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"13245657889\",\"admin\":false,\"loginDate\":1693633049000,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"root\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"3245565476@qq.com\",\"nickName\":\"用户1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user1\",\"userId\":101,\"createBy\":\"root\",\"roleIds\":[3],\"createTime\":1645762154000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:04:35');
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.edit()', 'PUT', 1, 'root', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"status\":\"0\"}],\"phonenumber\":\"13245657889\",\"admin\":false,\"loginDate\":1693633049000,\"remark\":\"111\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"root\",\"postIds\":[],\"loginIp\":\"127.0.0.1\",\"email\":\"3245565476@qq.com\",\"nickName\":\"用户1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user1\",\"userId\":101,\"createBy\":\"root\",\"roleIds\":[3],\"createTime\":1645762154000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:04:55');
INSERT INTO `sys_oper_log` VALUES (57, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.editUser()', 'PUT', 1, 'user1', NULL, '/system/user/edit', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"13245657889\",\"admin\":false,\"loginDate\":1693626316000,\"remark\":\"1111\",\"delFlag\":\"0\",\"updateBy\":\"user1\",\"loginIp\":\"127.0.0.1\",\"email\":\"3245576576@qq.com\",\"nickName\":\"用户1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user1\",\"userId\":101,\"createBy\":\"root\",\"createTime\":1645762154000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:10:18');
INSERT INTO `sys_oper_log` VALUES (58, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.editUser()', 'PUT', 1, 'user1', NULL, '/system/user/edit', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"13245657889\",\"admin\":false,\"loginDate\":1693626316000,\"delFlag\":\"0\",\"updateBy\":\"user1\",\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"用户1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user\",\"userId\":101,\"createBy\":\"root\",\"createTime\":1645762154000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:20:38');
INSERT INTO `sys_oper_log` VALUES (59, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.editUser()', 'PUT', 1, 'user1', NULL, '/system/user/edit', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"13245657889\",\"admin\":false,\"loginDate\":1693626316000,\"remark\":\"111\",\"delFlag\":\"0\",\"updateBy\":\"user1\",\"loginIp\":\"127.0.0.1\",\"email\":\"\",\"nickName\":\"用户1\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user\",\"userId\":101,\"createBy\":\"root\",\"createTime\":1645762154000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:22:50');
INSERT INTO `sys_oper_log` VALUES (60, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user1', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 12345', '{\"msg\":\"修改密码异常，请联系管理员\",\"code\":500}', 0, NULL, '2023-09-02 17:25:27');
INSERT INTO `sys_oper_log` VALUES (61, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user1', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 12345', '{\"msg\":\"修改密码异常，请联系管理员\",\"code\":500}', 0, NULL, '2023-09-02 17:26:36');
INSERT INTO `sys_oper_log` VALUES (62, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 12345', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:27:21');
INSERT INTO `sys_oper_log` VALUES (63, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645762072000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"menuIds\":[2003,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2040,2041,2042,2043,2044,2045,2028,2029,2030,2031,2032,2033,107,1036,1037,1038,1039],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:40:55');
INSERT INTO `sys_oper_log` VALUES (64, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"收藏\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"collect\",\"component\":\"biz/collect/index\",\"children\":[],\"createTime\":1693639727000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2046,\"menuType\":\"C\",\"perms\":\"biz:collect:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:41:11');
INSERT INTO `sys_oper_log` VALUES (65, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645762072000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"menuIds\":[2003,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2040,2041,2042,2043,2044,2045,2028,2029,2030,2031,2032,2033,107,1036,1037,1038,1039],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:42:00');
INSERT INTO `sys_oper_log` VALUES (66, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645762072000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"menuIds\":[2003,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2040,2041,2042,2043,2044,2045,2028,2029,2030,2031,2032,2033],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:46:17');
INSERT INTO `sys_oper_log` VALUES (67, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '12345 123456', '{\"msg\":\"修改密码异常，请联系管理员\",\"code\":500}', 0, NULL, '2023-09-02 17:48:10');
INSERT INTO `sys_oper_log` VALUES (68, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user1', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '12345 123456', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:48:35');
INSERT INTO `sys_oper_log` VALUES (69, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1645762072000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"menuIds\":[2003,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2040,2041,2042,2043,2044,2045,2028,2029,2030,2031,2032,2033,107,1036,1037,1038,1039],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 17:57:56');
INSERT INTO `sys_oper_log` VALUES (70, '代码生成', 6, 'com.manage.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'root', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'history', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-02 19:12:16');
INSERT INTO `sys_oper_log` VALUES (71, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.batchGenCode()', 'GET', 1, 'root', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-09-02 19:12:23');
INSERT INTO `sys_oper_log` VALUES (72, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1645762015000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"menuIds\":[100,1001,1002,1003,1004,1005,1006,1007,2003,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2040,2041,2042,2043,2044,2045,2028,2029,2030,2031,2032,2033],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-03 23:22:47');
INSERT INTO `sys_oper_log` VALUES (73, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user4', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 12345', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-04 21:07:26');
INSERT INTO `sys_oper_log` VALUES (74, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user4', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '12345 123456', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-04 21:08:26');
INSERT INTO `sys_oper_log` VALUES (75, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updatePwd()', 'PUT', 1, 'user4', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '12345 123456', '{\"msg\":\"修改密码失败，旧密码错误\",\"code\":500}', 0, NULL, '2023-09-04 21:08:40');
INSERT INTO `sys_oper_log` VALUES (76, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'root', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"root\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888889\",\"admin\":true,\"loginDate\":1693822768000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"管理员\",\"sex\":\"1\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"root\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1639552281000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-05 09:55:58');
INSERT INTO `sys_oper_log` VALUES (77, '菜单管理', 1, 'com.manage.project.system.controller.SysMenuController.add()', 'POST', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"5\",\"menuName\":\"公告导入\",\"params\":{},\"parentId\":2010,\"isCache\":\"0\",\"path\":\"biz:notice:leading\",\"createBy\":\"root\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"biz:notice:leading\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 11:07:54');
INSERT INTO `sys_oper_log` VALUES (78, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"6\",\"menuName\":\"公告导入\",\"params\":{},\"parentId\":2010,\"isCache\":\"0\",\"path\":\"biz:notice:leading\",\"children\":[],\"createTime\":1693969674000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2052,\"menuType\":\"F\",\"perms\":\"biz:notice:leading\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 11:08:10');
INSERT INTO `sys_oper_log` VALUES (79, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"6\",\"menuName\":\"公告导入\",\"params\":{},\"parentId\":2010,\"isCache\":\"0\",\"path\":\"biz:notice:leading\",\"children\":[],\"createTime\":1693969674000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2052,\"menuType\":\"F\",\"perms\":\"biz:notice:import\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 11:09:28');
INSERT INTO `sys_oper_log` VALUES (80, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'root', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 11:11:10');
INSERT INTO `sys_oper_log` VALUES (81, '菜单管理', 1, 'com.manage.project.system.controller.SysMenuController.add()', 'POST', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"电影导入\",\"params\":{},\"parentId\":2040,\"isCache\":\"0\",\"createBy\":\"root\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"biz:classification:import\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 11:16:12');
INSERT INTO `sys_oper_log` VALUES (82, '菜单管理', 1, 'com.manage.project.system.controller.SysMenuController.add()', 'POST', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"分类导入\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"createBy\":\"root\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"biz:notice:import\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 11:16:38');
INSERT INTO `sys_oper_log` VALUES (83, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1645762015000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"menuIds\":[100,1001,1002,1003,1004,1005,1006,1007,2003,2010,2011,2012,2013,2014,2015,2052,2016,2017,2018,2019,2020,2021,2054,2028,2029,2030,2031,2032,2033,2040,2041,2042,2043,2044,2045,2053],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 11:17:46');
INSERT INTO `sys_oper_log` VALUES (84, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 11:18:22');
INSERT INTO `sys_oper_log` VALUES (85, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 11:18:59');
INSERT INTO `sys_oper_log` VALUES (86, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 11:20:03');
INSERT INTO `sys_oper_log` VALUES (87, '代码生成', 6, 'com.manage.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'root', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'carousel', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 17:41:38');
INSERT INTO `sys_oper_log` VALUES (88, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.editSave()', 'PUT', 1, 'root', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"toto1693993298300\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":117,\"isIncrement\":\"1\",\"increment\":true,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"root\",\"isPk\":\"1\",\"createTime\":1693993298000,\"tableId\":7,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Img\",\"usableColumn\":false,\"columnId\":118,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"img\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":false,\"columnComment\":\"轮播图\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693993298000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"img\"},{\"capJavaField\":\"Name\",\"usableColumn\":false,\"columnId\":119,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"图片名\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693993298000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnName\":\"name\"},{\"capJavaField\":\"Rl\",\"usableColumn\":false,\"columnId\":120,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"rl\",\"htmlType\":\"input\",\"edit\":true,\"query\":false,\"columnComment\":\"备注\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"root\",\"isPk\":\"0\",\"createTime\":1693993298000,\"isEdit\":\"1\",\"tableId\":7,\"pk\":false,\"columnNam', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 17:42:13');
INSERT INTO `sys_oper_log` VALUES (89, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/carousel', '127.0.0.1', '内网IP', '{tableName=carousel}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 17:42:17');
INSERT INTO `sys_oper_log` VALUES (90, '角色管理', 2, 'com.manage.project.system.controller.SysRoleController.edit()', 'PUT', 1, 'root', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1645762015000,\"updateBy\":\"root\",\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"menuIds\":[100,1001,1002,1003,1004,1005,1006,1007,2055,2056,2057,2058,2059,2060,2040,2041,2042,2043,2044,2045,2053,2028,2029,2030,2031,2032,2033,2016,2017,2018,2019,2020,2021,2054,2010,2011,2012,2013,2014,2015,2052,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 22:38:07');
INSERT INTO `sys_oper_log` VALUES (91, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"电影管理导出\",\"params\":{},\"parentId\":2040,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1693450889000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2045,\"menuType\":\"F\",\"perms\":\"biz:films:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 22:40:18');
INSERT INTO `sys_oper_log` VALUES (92, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"6\",\"menuName\":\"电影导入\",\"params\":{},\"parentId\":2040,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1693970172000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2053,\"menuType\":\"F\",\"perms\":\"biz:films:import\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 22:40:28');
INSERT INTO `sys_oper_log` VALUES (93, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"5\",\"menuName\":\"分类管理导出\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1693449778000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2021,\"menuType\":\"F\",\"perms\":\"biz:classification:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 22:40:44');
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"6\",\"menuName\":\"分类导入\",\"params\":{},\"parentId\":2016,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1693970198000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2054,\"menuType\":\"F\",\"perms\":\"biz:classification:import\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-06 22:40:55');
INSERT INTO `sys_oper_log` VALUES (95, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', NULL, 1, '导入用户数据不能为空！', '2023-09-06 22:42:00');
INSERT INTO `sys_oper_log` VALUES (96, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 22:42:53');
INSERT INTO `sys_oper_log` VALUES (97, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 22:44:15');
INSERT INTO `sys_oper_log` VALUES (98, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-06 23:10:09');
INSERT INTO `sys_oper_log` VALUES (99, '公告管理', 6, 'com.manage.project.biz.controller.NoticeController.importData()', 'POST', 1, 'admin', NULL, '/biz/notice/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：\",\"code\":200}', 0, NULL, '2023-09-07 00:31:49');
INSERT INTO `sys_oper_log` VALUES (100, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-13 13:51:18');
INSERT INTO `sys_oper_log` VALUES (101, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-13 13:51:24');
INSERT INTO `sys_oper_log` VALUES (102, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-25 14:17:41');
INSERT INTO `sys_oper_log` VALUES (103, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-25 14:19:18');
INSERT INTO `sys_oper_log` VALUES (104, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-25 14:19:31');
INSERT INTO `sys_oper_log` VALUES (105, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"123\",\"admin\":false,\"loginDate\":1694763348000,\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"123\",\"nickName\":\"管理员\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"admin\",\"userId\":100,\"createBy\":\"root\",\"createTime\":1645762120000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-25 14:19:40');
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 5, 'com.manage.project.system.controller.SysUserController.export()', 'GET', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ce43fba8-879c-46cd-86c3-23b28ed400bb_用户数据.xlsx\",\"code\":200}', 0, NULL, '2023-09-25 14:42:20');
INSERT INTO `sys_oper_log` VALUES (107, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-25 14:51:01');
INSERT INTO `sys_oper_log` VALUES (108, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-25 14:51:06');
INSERT INTO `sys_oper_log` VALUES (109, '用户头像', 2, 'com.manage.project.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', NULL, 1, 'begin 0, end -1, length 4', '2023-09-25 14:51:15');
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":101,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-25 15:36:14');
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":101,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-25 15:36:34');
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":104,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-26 14:17:09');
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 2, 'com.manage.project.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":104,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-26 14:17:45');
INSERT INTO `sys_oper_log` VALUES (114, '个人信息', 2, 'com.manage.project.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"管理员\",\"status\":\"0\"}],\"phonenumber\":\"18548611928\",\"admin\":false,\"loginDate\":1695705733000,\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"2832398762@qq.com\",\"nickName\":\"管理员\",\"sex\":\"1\",\"avatar\":\"\",\"params\":{},\"userName\":\"admin\",\"userId\":100,\"createBy\":\"root\",\"createTime\":1645762120000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-26 14:18:46');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 6, 'com.manage.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'root', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'biz_movie_rating', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:08:52');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.manage.project.tool.gen.controller.GenController.synchDb()', 'GET', 1, 'root', NULL, '/tool/gen/synchDb/biz_movie_rating', '127.0.0.1', '内网IP', '{tableName=biz_movie_rating}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:10:44');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/biz_movie_rating', '127.0.0.1', '内网IP', '{tableName=biz_movie_rating}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:10:47');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.manage.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'root', NULL, '/tool/gen/genCode/biz_movie_rating', '127.0.0.1', '内网IP', '{tableName=biz_movie_rating}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:10:58');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2072', '127.0.0.1', '内网IP', '{menuId=2072}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:58:43');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2071', '127.0.0.1', '内网IP', '{menuId=2071}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:58:46');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2070', '127.0.0.1', '内网IP', '{menuId=2070}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:58:49');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2069', '127.0.0.1', '内网IP', '{menuId=2069}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:58:52');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2068', '127.0.0.1', '内网IP', '{menuId=2068}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:58:55');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 3, 'com.manage.project.system.controller.SysMenuController.remove()', 'DELETE', 1, 'root', NULL, '/system/menu/2067', '127.0.0.1', '内网IP', '{menuId=2067}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:58:59');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.manage.project.system.controller.SysMenuController.edit()', 'PUT', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"list\",\"orderNum\":\"1\",\"menuName\":\"电影评分\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"rating\",\"component\":\"biz/rating/index\",\"children\":[],\"createTime\":1695798646000,\"updateBy\":\"root\",\"isFrame\":\"1\",\"menuId\":2061,\"menuType\":\"C\",\"perms\":\"biz:rating:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-09-27 15:59:06');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-12-15 15:11:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-12-15 15:11:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-12-15 15:11:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-12-15 15:11:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'root', 1, '1', 1, 1, '0', '0', 'root', '2021-12-15 15:11:21', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (3, '普通用户', 'user', 3, '1', 1, 1, '0', '0', 'root', '2022-02-25 12:07:52', 'root', '2023-09-02 17:57:56', NULL);
INSERT INTO `sys_role` VALUES (100, '管理员', 'admin', 2, '1', 1, 1, '0', '0', 'root', '2022-02-25 12:06:55', 'root', '2023-09-06 22:38:07', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 2003);
INSERT INTO `sys_role_menu` VALUES (3, 2010);
INSERT INTO `sys_role_menu` VALUES (3, 2011);
INSERT INTO `sys_role_menu` VALUES (3, 2012);
INSERT INTO `sys_role_menu` VALUES (3, 2013);
INSERT INTO `sys_role_menu` VALUES (3, 2014);
INSERT INTO `sys_role_menu` VALUES (3, 2015);
INSERT INTO `sys_role_menu` VALUES (3, 2016);
INSERT INTO `sys_role_menu` VALUES (3, 2017);
INSERT INTO `sys_role_menu` VALUES (3, 2018);
INSERT INTO `sys_role_menu` VALUES (3, 2019);
INSERT INTO `sys_role_menu` VALUES (3, 2020);
INSERT INTO `sys_role_menu` VALUES (3, 2021);
INSERT INTO `sys_role_menu` VALUES (3, 2028);
INSERT INTO `sys_role_menu` VALUES (3, 2029);
INSERT INTO `sys_role_menu` VALUES (3, 2030);
INSERT INTO `sys_role_menu` VALUES (3, 2031);
INSERT INTO `sys_role_menu` VALUES (3, 2032);
INSERT INTO `sys_role_menu` VALUES (3, 2033);
INSERT INTO `sys_role_menu` VALUES (3, 2040);
INSERT INTO `sys_role_menu` VALUES (3, 2041);
INSERT INTO `sys_role_menu` VALUES (3, 2042);
INSERT INTO `sys_role_menu` VALUES (3, 2043);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2041);
INSERT INTO `sys_role_menu` VALUES (100, 2042);
INSERT INTO `sys_role_menu` VALUES (100, 2043);
INSERT INTO `sys_role_menu` VALUES (100, 2044);
INSERT INTO `sys_role_menu` VALUES (100, 2045);
INSERT INTO `sys_role_menu` VALUES (100, 2052);
INSERT INTO `sys_role_menu` VALUES (100, 2053);
INSERT INTO `sys_role_menu` VALUES (100, 2054);
INSERT INTO `sys_role_menu` VALUES (100, 2055);
INSERT INTO `sys_role_menu` VALUES (100, 2056);
INSERT INTO `sys_role_menu` VALUES (100, 2057);
INSERT INTO `sys_role_menu` VALUES (100, 2058);
INSERT INTO `sys_role_menu` VALUES (100, 2059);
INSERT INTO `sys_role_menu` VALUES (100, 2060);
INSERT INTO `sys_role_menu` VALUES (101, 2002);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `field1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段1',
  `field2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段2',
  `field3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段3',
  `field4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段4',
  `field5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段4',
  `field6` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段6',
  `field7` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段7',
  `field8` int NULL DEFAULT NULL COMMENT '字段8',
  `field9` int NULL DEFAULT NULL COMMENT '字段9',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'root', '管理员', '00', 'ry@163.com', '15888888889', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-09-27 15:57:34', 'admin', '2021-12-15 15:11:21', '', '2023-09-27 15:57:34', '管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (100, NULL, 'admin', '管理员', '00', '2832398762@qq.com', '18548611928', '1', '', '$2a$10$dzxVmqAD//TUyPtKodqN9eSdCRTIYSMlS/XRha0oUX1f6rl.zJs9C', '0', '0', '127.0.0.1', '2023-09-27 16:09:20', 'root', '2022-02-25 12:08:40', '', '2023-09-27 16:09:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'user1', '用户11', '00', '3246654657@qq.com', '13656765765', '0', '', '$2a$10$zWXdTNHWelzrVVxEX.dVNuHL.pNdXEr/kS.rI5F4Pr2yT531LGkhu', '0', '0', '127.0.0.1', '2023-09-27 15:44:54', 'root', '2022-02-25 12:09:14', 'admin', '2023-09-27 15:44:54', '1222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (102, NULL, 'user2', 'user2', '00', '', '15436547654', '0', '', '$2a$10$1lODLES0zT8vY8Iwf0ITyemY10D4oZrug.APXKEKOgPamMRAYTSBG', '0', '0', '127.0.0.1', '2023-09-25 15:07:47', 'user2', '2023-09-03 23:16:41', 'user2', '2023-09-25 15:07:43', '111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'user3', 'user3', '00', '', '14356756456', '0', '', '$2a$10$GSnBFMoSAU5cIPXhK7qBSujICXU9WwU./d4webew2CE4.Fkp8SJJq', '0', '0', '127.0.0.1', '2023-09-03 23:43:58', 'user3', '2023-09-03 23:43:51', 'user3', '2023-09-03 23:44:04', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'user4', 'user4', '00', '', '13456456346', '0', '', '$2a$10$LkD5ictZIQMif8nIvhGwLez9QXolQppodqSOdslj1j8fxF9WZUgUy', '0', '0', '127.0.0.1', '2023-09-04 21:09:08', 'user4', '2023-09-04 20:54:54', 'admin', '2023-09-26 14:17:45', '1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 100);

SET FOREIGN_KEY_CHECKS = 1;
