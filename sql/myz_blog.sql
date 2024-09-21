/*
 Navicat Premium Data Transfer

 Source Server         : Mysql8
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : localhost:3307
 Source Schema         : myz_blog

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 23/08/2024 14:22:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'myz_articles', '文章表', NULL, NULL, 'MyzArticles', 'crud', 'element-ui', 'com.ruoyi.system', 'blog', 'articles', '文章', 'ShanYouMuXi', '0', '/', '{\"parentMenuId\":1062}', 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56', NULL);
INSERT INTO `gen_table` VALUES (4, 'myz_favorites', '博客收藏表', NULL, NULL, 'MyzFavorites', 'crud', 'element-ui', 'com.ruoyi.system', 'blog', 'favorites', '博客收藏', '木有枝', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36', NULL);
INSERT INTO `gen_table` VALUES (6, 'myz_comments', '文章评论表', NULL, NULL, 'MyzComments', 'crud', 'element-ui', 'com.ruoyi.system', 'blog', 'comments', '文章评论', '木有枝', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57', NULL);
INSERT INTO `gen_table` VALUES (7, 'myz_goal', '学习目标', NULL, NULL, 'MyzGoal', 'crud', 'element-ui', 'com.ruoyi.system', 'blog', 'goal', '学习目标', '木有枝', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20', NULL);
INSERT INTO `gen_table` VALUES (8, 'myz_toolbox', '工具', NULL, NULL, 'MyzToolbox', 'crud', 'element-ui', 'com.ruoyi.system', 'blog', 'toolbox', '工具管理', '木有枝', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (32, 3, 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (33, 3, 'article_title', '文章标题', 'varchar(50)', 'String', 'articleTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (34, 3, 'article_content', '文章内容', 'text', 'String', 'articleContent', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'editor', '', 3, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (35, 3, 'article_author_id', '文章作者编号', 'bigint', 'Long', 'articleAuthorId', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'input', '', 4, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (36, 3, 'article_type', '文章类型', 'int', 'Long', 'articleType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_type', 5, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (37, 3, 'article_tag', '文章标签', 'int', 'Long', 'articleTag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_tag', 6, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (38, 3, 'article_direction', '文章方向', 'int', 'Long', 'articleDirection', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_direction', 7, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (39, 3, 'article_comments', '文章评论', 'text', 'String', 'articleComments', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'editor', '', 8, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (40, 3, 'article_likes', '文章点赞次数', 'bigint', 'Long', 'articleLikes', '0', '0', '0', '1', '1', '1', '1', 'GTE', 'input', '', 9, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (41, 3, 'article_views', '文章展示次数', 'bigint', 'Long', 'articleViews', '0', '0', '0', '1', '1', '1', '1', 'GTE', 'input', '', 10, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (42, 3, 'seo_title', '搜索擎优化用的标题', 'varchar(255)', 'String', 'seoTitle', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 11, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (43, 3, 'seo_description', '搜索引擎优化用的描述', 'varchar(255)', 'String', 'seoDescription', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 12, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (44, 3, 'cover_image', '封面图片', 'varchar(255)', 'String', 'coverImage', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 13, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (45, 3, 'source_link', '存储原文链接', 'varchar(255)', 'String', 'sourceLink', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 14, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (46, 3, 'allow_comments', '允许评论', 'int', 'Long', 'allowComments', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_allow_comments', 15, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (47, 3, 'article_status', '文章状态', 'int', 'Long', 'articleStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_status', 16, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (48, 3, 'del_flag', '删除标记', 'int', 'Long', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', 'blog_del_flag', 17, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (49, 3, 'article_created_at', '文章创建时间', 'timestamp', 'Date', 'articleCreatedAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (50, 3, 'article_updated_at', '文章更新时间', 'timestamp', 'Date', 'articleUpdatedAt', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 19, 'admin', '2024-08-08 15:34:00', '', '2024-08-08 15:50:56');
INSERT INTO `gen_table_column` VALUES (51, 4, 'id', '唯一标识符', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (52, 4, 'title', '收藏的博客或文章标题', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (53, 4, 'description', '对博客或文章的描述', 'text', 'String', 'description', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 3, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (54, 4, 'url', '博客或文章的URL链接', 'varchar(255)', 'String', 'url', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (55, 4, 'author', '博客或文章的作者', 'varchar(100)', 'String', 'author', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (56, 4, 'notes', '额外的笔记或评论', 'text', 'String', 'notes', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (57, 4, 'article_type', '文章类型', 'int', 'Long', 'articleType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_type', 7, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (58, 4, 'article_tag', '文章标签', 'int', 'Long', 'articleTag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_tag', 8, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (59, 4, 'article_direction', '文章方向', 'int', 'Long', 'articleDirection', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_direction', 9, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (60, 4, 'article_status', '文章状态', 'int', 'Long', 'articleStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_status', 10, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (61, 4, 'del_flag', '删除标记', 'int', 'Long', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'select', 'blog_del_flag', 11, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (62, 4, 'favorite_date', '收藏日期', 'timestamp', 'Date', 'favoriteDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (63, 4, 'article_updated_at', '文章更新时间', 'timestamp', 'Date', 'articleUpdatedAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2024-08-10 15:58:44', '', '2024-08-10 16:02:36');
INSERT INTO `gen_table_column` VALUES (74, 6, 'comment_id', '评论唯一标识符', 'int', 'Long', 'commentId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (75, 6, 'article_id', '评论所属文章的ID', 'int', 'Long', 'articleId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (76, 6, 'article_type', '博客类型', 'int', 'Long', 'articleType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_class', 3, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (77, 6, 'user_id', '发表评论的用户ID，可以为NULL表示匿名用户', 'int', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (78, 6, 'user_name', '用户昵称，当user_id为NULL时使用', 'varchar(255)', 'String', 'userName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (79, 6, 'user_email', '用户邮箱，用于匿名用户', 'varchar(255)', 'String', 'userEmail', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (80, 6, 'parent_comment_id', '被回复的评论ID，如果是顶级评论则为NULL', 'int', 'Long', 'parentCommentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (81, 6, 'content', '评论内容', 'text', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 8, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (82, 6, 'status', '评论状态', 'enum(\'approved\',\'pending\',\'spam\')', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'blog_comments_status', 9, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (83, 6, 'created_at', '评论创建时间', 'datetime', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 10, 'admin', '2024-08-10 21:04:07', '', '2024-08-10 21:05:57');
INSERT INTO `gen_table_column` VALUES (84, 7, 'id', '唯一标识符', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (85, 7, 'goal_name', '目标名称', 'varchar(255)', 'String', 'goalName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (86, 7, 'description', '目标描述', 'varchar(255)', 'String', 'description', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (87, 7, 'status', '目标状态', 'int', 'Long', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_goal_status', 4, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (88, 7, 'goal_type', '目标类型', 'int', 'Long', 'goalType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_type', 5, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (89, 7, 'goal_tag', '目标标签', 'int', 'Long', 'goalTag', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_tag', 6, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (90, 7, 'image_url', '图片URL', 'varchar(255)', 'String', 'imageUrl', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (91, 7, 'website_url', '网站链接', 'varchar(255)', 'String', 'websiteUrl', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (92, 7, 'precondition', '前置条件', 'varchar(255)', 'String', 'precondition', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (93, 7, 'article_id', '博客索引', 'int', 'Long', 'articleId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (94, 7, 'order_index', '展示顺序', 'int', 'Long', 'orderIndex', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 11, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (95, 7, 'come_true_data', '实现时间', 'date', 'Date', 'comeTrueData', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 12, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (96, 7, 'created_at', '收藏时间', 'timestamp', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '0', 'BETWEEN', 'datetime', '', 13, 'admin', '2024-08-13 12:16:04', '', '2024-08-13 12:21:20');
INSERT INTO `gen_table_column` VALUES (97, 8, 'id', '唯一ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (98, 8, 'tool_name', '工具名称', 'varchar(255)', 'String', 'toolName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (99, 8, 'description', '工具描述', 'varchar(255)', 'String', 'description', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (100, 8, 'image_url', '工具图片', 'varchar(255)', 'String', 'imageUrl', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (101, 8, 'link_url', '工具链接', 'varchar(255)', 'String', 'linkUrl', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (102, 8, 'type', '工具类型', 'int', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'blog_tool_type', 6, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (103, 8, 'order_index', '工具顺序', 'int', 'Long', 'orderIndex', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (104, 8, 'user_id', '用户id', 'int', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');
INSERT INTO `gen_table_column` VALUES (105, 8, 'created_at', '创建时间', 'timestamp', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'datetime', '', 9, 'admin', '2024-08-13 14:18:07', '', '2024-08-13 14:59:57');

-- ----------------------------
-- Table structure for myz_articles
-- ----------------------------
DROP TABLE IF EXISTS `myz_articles`;
CREATE TABLE `myz_articles`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `article_author_id` bigint NOT NULL COMMENT '文章作者编号',
  `article_type` int NULL DEFAULT NULL COMMENT '文章类型',
  `article_tag` int NULL DEFAULT NULL COMMENT '文章标签',
  `article_direction` int NULL DEFAULT NULL COMMENT '文章方向',
  `article_comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章评论',
  `article_likes` bigint NULL DEFAULT 0 COMMENT '文章点赞次数',
  `article_views` bigint NULL DEFAULT 0 COMMENT '文章展示次数',
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '搜索擎优化用的标题',
  `seo_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '搜索引擎优化用的描述',
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图片',
  `source_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储原文链接',
  `allow_comments` int NULL DEFAULT NULL COMMENT '允许评论',
  `article_status` int NULL DEFAULT NULL COMMENT '文章状态',
  `del_flag` int NULL DEFAULT NULL COMMENT '删除标记',
  `article_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章创建时间',
  `article_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '文章更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_author`(`article_author_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of myz_articles
-- ----------------------------
INSERT INTO `myz_articles` VALUES (12, 'A', '<p>a</p>', 1, 1, 2, 2, '<p>ds</p>', 1, 1, '1', '1', '/profile/upload/2024/08/08/284543_20240808162619A001.png', 'https://cn.bing.com/search?pc=CNPA19&q=earcher', 1, 2, 1, '2024-08-07 00:00:00', '2024-08-22 00:00:00');
INSERT INTO `myz_articles` VALUES (13, '秀英有限责任公司', 'Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more. Navicat Cloud provides a cloud service for synchronizing connections, queries, model files and virtual group information from Navicat, other Navicat family members, different machines and different platfo', 4, 3, 5, 1, 'Navicat provides pow', 38, 56, '女士', 'hazukiyam9', 'C:\\Users\\Administrator\\Pictures\\img_780202.jpg', 'http://drive.ruid1109.biz/Food', 1, 2, 0, '2010-11-01 07:42:43', '2002-04-22 11:10:27');
INSERT INTO `myz_articles` VALUES (14, '安琪有限责任公司', 'Navicat Data Modeler is a powerful and cost-effective database design tool which helps you build high-quality conceptual, logical and physical data models. After comparing data, the window shows the number of records that will be inserted, updated or deleted in the target.', 3, 2, 2, 2, 'I may not have gone ', 79, 17, '小姐', 'karen3', 'C:\\Users\\Administrator\\Pictures\\img_586150.jpg', 'http://drive.luils59.org/ToolsHomeDecoration', 3, 5, 0, '2010-06-14 03:58:19', '2004-07-10 11:30:21');
INSERT INTO `myz_articles` VALUES (15, '云熙有限责任公司', 'The past has no power over the present moment. Monitored servers include MySQL, MariaDB and SQL Server, and compatible with cloud databases like Amazon RDS, Amazon Aurora, Oracle Cloud, Google Cloud and Microsoft Azure.', 9, 3, 5, 1, 'To connect to a data', 19, 71, '女士', 'moritay7', 'C:\\Users\\Administrator\\Pictures\\img_006888.jpg', 'http://drive.gomea.biz/IndustrialScientificSupplies', 2, 1, 0, '2012-08-01 19:57:09', '2005-08-28 06:31:06');
INSERT INTO `myz_articles` VALUES (16, '于記电脑有限责任公司', 'Flexible settings enable you to set up a custom key for comparison and synchronization. Navicat is a multi-connections Database Administration tool allowing you to connect to MySQL, Oracle, PostgreSQL, SQLite, SQL Server, MariaDB and/or MongoDB databases, making database administration to multiple k', 5, 2, 4, 3, 'Navicat authorizes y', 17, 82, '教授', 'lohy5', 'C:\\Users\\Administrator\\Pictures\\img_324691.png', 'https://image.titszching6.biz/ComputersElectronics', 2, 5, 0, '2014-09-14 21:35:39', '2013-10-09 06:20:37');
INSERT INTO `myz_articles` VALUES (17, '夏发展贸易有限责任公司', 'If opportunity doesn’t knock, build a door. To get a secure connection, the first thing you need to do is to install OpenSSL Library and download Database Source. You must be the change you wish to see in the world.', 4, 2, 2, 2, 'Export Wizard allows', 59, 72, '教授', 'ctak3', 'C:\\Users\\Administrator\\Pictures\\img_350291.png', 'http://image.wfkwan85.net/AutomotivePartsAccessories', 1, 4, 0, '2011-11-23 16:12:09', '2004-08-18 18:07:27');
INSERT INTO `myz_articles` VALUES (18, '震南电讯有限责任公司', 'Typically, it is employed as an encrypted version of Telnet. You cannot save people, you can just love them. In a Telnet session, all communications, including username and password, are transmitted in plain-text, allowing anyone to listen-in on your session and steal passwords and other information', 6, 2, 3, 3, 'I destroy my enemies', 10, 32, '女士', 'lij50', 'C:\\Users\\Administrator\\Pictures\\img_983216.jpg', 'https://video.ggo.cn/AppsGames', 4, 3, 0, '2005-10-12 07:32:24', '2000-09-21 03:45:03');
INSERT INTO `myz_articles` VALUES (19, '莫記系统有限责任公司', 'To open a query using an external editor, control-click it and select Open with External Editor. You can set the file path of an external editor in Preferences. Monitored servers include MySQL, MariaDB and SQL Server, and compatible with cloud databases like Amazon RDS, Amazon Aurora, Oracle Cloud, ', 2, 2, 4, 2, 'The reason why a gre', 82, 24, '小姐', 'nakamuras', 'C:\\Users\\Administrator\\Pictures\\img_469675.jpg', 'http://www.chavbrian.biz/IndustrialScientificSupplies', 3, 2, 0, '2012-01-29 15:56:27', '2019-02-08 14:24:18');
INSERT INTO `myz_articles` VALUES (20, '孔工业有限责任公司', 'Remember that failure is an event, not a person. To connect to a database or schema, simply double-click it in the pane. To start working with your server in Navicat, you should first establish a connection or several connections using the Connection window.', 2, 2, 3, 3, 'All the Navicat Clou', 44, 80, '先生', 'choyeef810', 'C:\\Users\\Administrator\\Pictures\\img_785125.jpg', 'http://image.howardkim5.org/Food', 3, 2, 0, '2024-05-06 04:50:16', '2013-12-03 18:10:58');
INSERT INTO `myz_articles` VALUES (22, '子异有限责任公司', 'Anyone who has never made a mistake has never tried anything new. Export Wizard allows you to export data from tables, collections, views, or query results to any available formats. If your Internet Service Provider (ISP) does not provide direct access to its server, Secure Tunneling Protocol (SSH) ', 10, 2, 2, 3, 'It is used while you', 99, 54, '教授', 'mda', 'C:\\Users\\Administrator\\Pictures\\img_539964.png', 'http://auth.jordan4.xyz/PetSupplies', 1, 3, 0, '2008-11-02 13:29:58', '2006-06-24 11:16:08');
INSERT INTO `myz_articles` VALUES (23, '璐电讯有限责任公司', 'Flexible settings enable you to set up a custom key for comparison and synchronization. Optimism is the one quality more associated with success and happiness than any other.', 3, 2, 3, 1, 'Navicat Monitor can ', 99, 93, '先生', 'wsho1974', 'C:\\Users\\Administrator\\Pictures\\img_975581.jpg', 'http://image.hmit3.jp/IndustrialScientificSupplies', 3, 2, 0, '2006-02-02 04:11:22', '2023-01-08 17:53:25');
INSERT INTO `myz_articles` VALUES (24, '秀英电子有限责任公司', 'The Information Pane shows the detailed object information, project activities, the DDL of database objects, object dependencies, membership of users/roles and preview. Navicat provides a wide range advanced features, such as compelling code editing capabilities, smart code-completion, SQL formattin', 9, 1, 1, 2, 'SSH serves to preven', 39, 86, '太太', 'christopherporter', 'C:\\Users\\Administrator\\Pictures\\img_646170.png', 'http://www.odaichi.us/ToysGames', 4, 5, 0, '2005-01-25 15:19:18', '2016-02-28 20:28:43');
INSERT INTO `myz_articles` VALUES (25, '廖工程有限责任公司', 'Navicat Cloud could not connect and access your databases. By which it means, it could only store your connection settings, queries, model files, and virtual group; your database passwords and data (e.g. tables, views, etc) will not be stored to Navicat Cloud.', 6, 2, 3, 1, 'If opportunity doesn', 39, 48, '先生', 'wmy114', 'C:\\Users\\Administrator\\Pictures\\img_634008.jpg', 'https://video.reuc.co.jp/ToysGames', 3, 1, 0, '2013-04-07 23:20:29', '2007-06-11 00:30:27');
INSERT INTO `myz_articles` VALUES (26, '汤記通讯有限责任公司', 'Flexible settings enable you to set up a custom key for comparison and synchronization. In a Telnet session, all communications, including username and password, are transmitted in plain-text, allowing anyone to listen-in on your session and steal passwords and other information.', 6, 2, 1, 2, 'Genius is an infinit', 69, 67, '小姐', 'woods2', 'C:\\Users\\Administrator\\Pictures\\img_797670.png', 'https://video.jiangshiha97.com/FilmSupplies', 4, 1, 0, '2006-07-25 03:48:40', '2018-01-02 04:41:29');
INSERT INTO `myz_articles` VALUES (27, '龚記有限责任公司', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server, or Amazon RDS instance. Navicat Monitor can be installed on any local computer or virtual machine and does not require any software installation on the servers being monitored.', 4, 2, 1, 1, 'The repository datab', 66, 97, '女士', 'culu', 'C:\\Users\\Administrator\\Pictures\\img_342275.png', 'http://drive.zhongxiuying.net/Others', 2, 2, 0, '2010-02-21 03:31:59', '2016-10-15 14:10:45');
INSERT INTO `myz_articles` VALUES (28, '震南有限责任公司', 'What you get by achieving your goals is not as important as what you become by achieving your goals. All the Navicat Cloud objects are located under different projects. You can share the project to other Navicat Cloud accounts for collaboration. To successfully establish a new connection to local/re', 1, 3, 1, 2, 'It provides strong a', 9, 90, '教授', 'panzhennan', 'C:\\Users\\Administrator\\Pictures\\img_997013.jpg', 'https://video.airisai.cn/ClothingShoesandJewelry', 3, 2, 0, '2016-08-24 19:47:20', '2006-05-31 04:31:26');
INSERT INTO `myz_articles` VALUES (29, '璐通讯有限责任公司', 'Anyone who has ever made anything of importance was disciplined. The reason why a great man is great is that he resolves to be a great man. If the Show objects under schema in navigation pane option is checked at the Preferences window, all database objects are also displayed in the pane.', 6, 3, 2, 3, 'Navicat Monitor requ', 25, 42, '女士', 'azhou', 'C:\\Users\\Administrator\\Pictures\\img_667511.jpg', 'https://drive.jacksonthelm.org/Books', 2, 4, 0, '2016-10-23 21:27:49', '2006-11-02 09:06:01');
INSERT INTO `myz_articles` VALUES (30, '嘉伦食品有限责任公司', 'It collects process metrics such as CPU load, RAM usage, and a variety of other resources over SSH/SNMP. To clear or reload various internal caches, flush tables, or acquire locks, control-click your connection in the Navigation pane and select Flush and choose the flush option. You must have the re', 4, 2, 3, 2, 'I may not have gone ', 83, 32, '太太', 'ziyidong', 'C:\\Users\\Administrator\\Pictures\\img_291182.jpg', 'https://video.lwu.biz/Beauty', 4, 4, 0, '2007-11-15 22:33:32', '2005-12-16 22:14:58');
INSERT INTO `myz_articles` VALUES (31, '嘉伦贸易有限责任公司', 'In other words, Navicat provides the ability for data in different databases and/or schemas to be kept up-to-date so that each repository contains the same information. A man’s best friends are his ten fingers.', 8, 3, 1, 2, 'The reason why a gre', 10, 39, '女士', 'kmchu3', 'C:\\Users\\Administrator\\Pictures\\img_517636.png', 'http://auth.grcar.org/ClothingShoesandJewelry', 2, 2, 0, '2013-05-13 06:16:48', '2019-01-22 06:31:59');
INSERT INTO `myz_articles` VALUES (32, '马技术有限责任公司', 'A man is not old until regrets take the place of dreams. How we spend our days is, of course, how we spend our lives. Navicat allows you to transfer data from one database and/or schema to another with detailed analytical process. It collects process metrics such as CPU load, RAM usage, and a variet', 4, 1, 2, 2, 'Export Wizard allows', 100, 36, '教授', 'isy4', 'C:\\Users\\Administrator\\Pictures\\img_677951.jpg', 'http://drive.pattersonjane.jp/CollectiblesFineArt', 2, 5, 0, '2003-10-24 08:43:47', '2020-01-18 06:58:16');
INSERT INTO `myz_articles` VALUES (33, '测试', '<p><u>测试</u> <strong>AA <em>BB <s>CC</s></em></strong></p><p><br></p><p><br></p><blockquote>DASDASDASD</blockquote><pre class=\"ql-syntax\" spellcheck=\"false\">private Date createdAt;\n</pre><ol><li>43</li><li>45</li></ol><ul><li>6546</li><li>765</li></ul><p>65756</p><p class=\"ql-indent-2\">54534</p><p class=\"ql-indent-2\"><span class=\"ql-size-huge\">453455</span></p><p class=\"ql-indent-2\"><br></p><p class=\"ql-indent-2\"><br></p><h1>一</h1><h2>二</h2><h3>三</h3><h4>四</h4><p><span style=\"color: rgb(0, 138, 0);\">防守打法收到</span></p><p><span style=\"background-color: rgb(204, 232, 204);\">恶趣味去问问</span></p><p class=\"ql-align-center\"><span style=\"background-color: rgb(204, 232, 204);\">大四的</span></p><p class=\"ql-align-right\"><span style=\"background-color: rgb(204, 232, 204);\">3232</span></p><p><span style=\"background-color: rgb(204, 232, 204);\">323</span></p><p class=\"ql-align-justify\"><a href=\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"background-color: rgb(204, 232, 204);\">4の4234</a></p><p>43244344344Tff</p><p><a href=\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\" rel=\"noopener noreferrer\" target=\"_blank\">Kimi.ai - 帮你看更大的世界 (moonshot.cn)</a></p><p><img src=\"/dev-api/profile/upload/2024/08/13/adminAvatar_20240813104409A001.jpg\"></p><p><br></p><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"http://baike.baidu.com/l/nDXEBQn5\"></iframe><p><br></p>', 111, 3, 2, 2, NULL, 0, 0, NULL, NULL, '/profile/upload/2024/08/13/adminAvatar_20240813104521A002.jpg', 'https://baijiahao.baidu.com/s?id=1798723173756861692', 2, 2, 0, '2024-08-13 00:00:00', '2024-08-13 10:51:20');

-- ----------------------------
-- Table structure for myz_comments
-- ----------------------------
DROP TABLE IF EXISTS `myz_comments`;
CREATE TABLE `myz_comments`  (
  `comment_id` int NOT NULL AUTO_INCREMENT COMMENT '评论唯一标识符',
  `article_id` int NOT NULL COMMENT '评论所属文章的ID',
  `article_type` int NULL DEFAULT NULL COMMENT '博客类型',
  `user_id` int NULL DEFAULT NULL COMMENT '发表评论的用户ID，可以为NULL表示匿名用户',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称，当user_id为NULL时使用',
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户邮箱，用于匿名用户',
  `parent_comment_id` int NULL DEFAULT NULL COMMENT '被回复的评论ID，如果是顶级评论则为NULL',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `status` enum('approved','pending','spam') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending' COMMENT '评论状态',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论创建时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `parent_comment_id`(`parent_comment_id` ASC) USING BTREE,
  CONSTRAINT `myz_comments_ibfk_1` FOREIGN KEY (`parent_comment_id`) REFERENCES `myz_comments` (`comment_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myz_comments
-- ----------------------------
INSERT INTO `myz_comments` VALUES (1, 13, 1, NULL, '测试1', '2293902648@qq.com', NULL, '231223', 'pending', '2024-08-11 10:56:12');
INSERT INTO `myz_comments` VALUES (2, 13, 1, NULL, '测试1', '2293902648@qq.com', NULL, '231223', 'pending', '2024-08-11 10:56:20');
INSERT INTO `myz_comments` VALUES (3, 13, 1, NULL, '测试1', '2293902648@qq.com', NULL, '231223', 'pending', '2024-08-11 10:56:22');
INSERT INTO `myz_comments` VALUES (92, 13, 1, NULL, '43234', '23423', 2, '42342', 'pending', '2024-08-12 16:29:13');
INSERT INTO `myz_comments` VALUES (93, 13, 1, NULL, '434', '245345', 92, '45345345', 'pending', '2024-08-12 16:29:29');
INSERT INTO `myz_comments` VALUES (94, 13, 1, NULL, '454545', '245345', 92, '53453453454', 'pending', '2024-08-12 16:29:35');
INSERT INTO `myz_comments` VALUES (95, 13, 1, NULL, '33333', '245345', 92, '热尔二位', 'pending', '2024-08-12 16:29:51');
INSERT INTO `myz_comments` VALUES (96, 13, 1, NULL, '33333', '245345', NULL, '65765765', 'pending', '2024-08-12 16:46:17');
INSERT INTO `myz_comments` VALUES (97, 13, 1, NULL, 'eqwe', '31231', 1, '323121', 'pending', '2024-08-12 17:04:30');
INSERT INTO `myz_comments` VALUES (98, 13, 1, NULL, '1111', '111', NULL, '31231', 'pending', '2024-08-12 17:06:12');
INSERT INTO `myz_comments` VALUES (99, 13, 1, NULL, '1111', '111', 1, '43242343', 'pending', '2024-08-12 17:06:21');
INSERT INTO `myz_comments` VALUES (100, 13, 1, NULL, '3123', '3123', NULL, 'qqq', 'pending', '2024-08-12 18:07:53');
INSERT INTO `myz_comments` VALUES (101, 13, 1, NULL, '3123', '12312', NULL, '321312', 'pending', '2024-08-12 18:08:44');
INSERT INTO `myz_comments` VALUES (102, 13, 1, NULL, '3123', '12312', 101, '32131232323', 'pending', '2024-08-12 18:09:03');
INSERT INTO `myz_comments` VALUES (103, 13, 1, NULL, '3232', '323', NULL, '323', 'pending', '2024-08-12 18:09:54');
INSERT INTO `myz_comments` VALUES (104, 13, 1, NULL, '3232', '323', 103, '434323', 'pending', '2024-08-12 18:10:02');
INSERT INTO `myz_comments` VALUES (105, 13, 1, NULL, '3423', '', 103, '4234', 'pending', '2024-08-12 18:10:48');
INSERT INTO `myz_comments` VALUES (106, 13, 1, NULL, '3423', '', 105, '4234423423', 'pending', '2024-08-12 18:10:55');
INSERT INTO `myz_comments` VALUES (107, 13, 1, NULL, '4432', '423', 99, '3232', 'pending', '2024-08-12 18:11:44');
INSERT INTO `myz_comments` VALUES (108, 13, 1, NULL, '4432', '423', 97, '344', 'pending', '2024-08-12 18:11:50');
INSERT INTO `myz_comments` VALUES (109, 13, 1, NULL, '234234', '234234', NULL, '42342', 'pending', '2024-08-12 18:12:12');
INSERT INTO `myz_comments` VALUES (110, 13, 1, NULL, '4444444', '', NULL, '443', 'pending', '2024-08-12 18:12:32');
INSERT INTO `myz_comments` VALUES (111, 13, 1, NULL, '4444444', '433', NULL, '4332', 'pending', '2024-08-12 18:12:38');
INSERT INTO `myz_comments` VALUES (112, 13, 1, NULL, '234234', '234234234', NULL, '4234', 'pending', '2024-08-12 18:13:30');
INSERT INTO `myz_comments` VALUES (113, 13, 1, NULL, 'gggg', 'gggg', NULL, 'gggggggggg', 'pending', '2024-08-12 18:14:33');
INSERT INTO `myz_comments` VALUES (114, 13, 1, NULL, 'dddd', 'dddd', NULL, 'ddddd', 'pending', '2024-08-12 18:16:33');
INSERT INTO `myz_comments` VALUES (115, 13, 1, NULL, 'fffff', 'fffff', NULL, 'ffffffff', 'pending', '2024-08-12 18:17:16');
INSERT INTO `myz_comments` VALUES (116, 13, 1, NULL, '4234', '234', NULL, '3242342', 'pending', '2024-08-12 18:20:29');
INSERT INTO `myz_comments` VALUES (117, 13, 1, NULL, 'aaa', 'aaaa', NULL, 'aaaaaaaaaaaaaaa', 'pending', '2024-08-12 18:22:33');
INSERT INTO `myz_comments` VALUES (118, 13, 1, NULL, '111', '111', NULL, '1111', 'pending', '2024-08-12 18:25:36');
INSERT INTO `myz_comments` VALUES (119, 13, 1, NULL, '111', '111', NULL, '11111', 'pending', '2024-08-12 18:25:41');
INSERT INTO `myz_comments` VALUES (120, 13, 1, NULL, 'ccc', 'ccc', NULL, 'ccc', 'pending', '2024-08-12 18:26:11');
INSERT INTO `myz_comments` VALUES (121, 13, 1, NULL, 'ccc', 'ccc', NULL, 'cccc', 'pending', '2024-08-12 18:26:15');
INSERT INTO `myz_comments` VALUES (122, 13, 1, NULL, '4234', '324234', NULL, '324234', 'pending', '2024-08-12 18:50:38');
INSERT INTO `myz_comments` VALUES (123, 13, 1, NULL, '4234', '324234', NULL, '4444444444444444444444444', 'pending', '2024-08-12 18:50:49');
INSERT INTO `myz_comments` VALUES (124, 13, 1, NULL, 'mmmm', 'mmmm', NULL, '密密麻麻密密麻麻密密麻麻密码', 'pending', '2024-08-12 18:52:40');
INSERT INTO `myz_comments` VALUES (125, 13, 1, NULL, 'mmmm', 'mmmm', 124, 'nnnnnnnnnnnnnnn', 'pending', '2024-08-12 18:52:54');
INSERT INTO `myz_comments` VALUES (126, 13, 1, NULL, 'mmmm', 'mmmm', NULL, 'bbbbbbbbbbbbb', 'pending', '2024-08-12 18:53:00');
INSERT INTO `myz_comments` VALUES (127, 13, 1, NULL, '4343', '2293902648@qq.com', NULL, '434', 'pending', '2024-08-12 19:10:56');
INSERT INTO `myz_comments` VALUES (128, 13, 1, NULL, '4343', '2293902648@qq.com', NULL, '7777', 'pending', '2024-08-12 19:11:04');
INSERT INTO `myz_comments` VALUES (129, 13, 1, NULL, '5555555555555', '2293902648@qq.com', NULL, '红红火火恍恍惚惚', 'pending', '2024-08-12 19:21:03');
INSERT INTO `myz_comments` VALUES (130, 13, 1, NULL, '5555555555555', '2293902648@qq.com', 129, '6564563', 'pending', '2024-08-12 19:21:16');
INSERT INTO `myz_comments` VALUES (131, 13, 1, NULL, '34234', '2293902648@qq.com', 130, '432423423', 'pending', '2024-08-12 19:23:12');
INSERT INTO `myz_comments` VALUES (132, 13, 1, NULL, '34234', '2293902648@qq.com', NULL, '9876543', 'pending', '2024-08-12 19:23:21');
INSERT INTO `myz_comments` VALUES (133, 13, 1, NULL, '4234', '2293902648@qq.com', 114, '4234', 'pending', '2024-08-12 19:23:57');
INSERT INTO `myz_comments` VALUES (134, 13, 1, NULL, '534534', '2293902648@qq.com', 92, '<p>534534</p>', 'pending', '2024-08-12 19:25:29');
INSERT INTO `myz_comments` VALUES (135, 13, 1, NULL, '534534', '2293902648@qq.com', NULL, '<p>红红火火恍恍惚惚哈哈哈哈哈哈哈哈哈</p>', 'pending', '2024-08-12 19:25:40');
INSERT INTO `myz_comments` VALUES (136, 13, 1, NULL, '534534', '2293902648@qq.com', NULL, '<p>红红火火恍恍惚惚哈哈哈哈哈哈哈哈哈</p>', 'pending', '2024-08-12 19:26:01');
INSERT INTO `myz_comments` VALUES (137, 13, 1, NULL, '5345', '2293902648@qq.com', 99, '<p>4534534</p>', 'pending', '2024-08-12 19:29:09');
INSERT INTO `myz_comments` VALUES (138, 13, 1, NULL, '5345', '2293902648@qq.com', NULL, '<p>语言运用一样一样咿咿呀呀</p>', 'pending', '2024-08-12 19:29:17');
INSERT INTO `myz_comments` VALUES (139, 13, 1, NULL, '5345', '2293902648@qq.com', 136, '<p><br></p>', 'pending', '2024-08-12 19:29:21');
INSERT INTO `myz_comments` VALUES (140, 13, 1, NULL, '4534534', '2293902648@qq.com', NULL, '<p>5345344545345334534553454</p>', 'pending', '2024-08-12 19:34:00');
INSERT INTO `myz_comments` VALUES (141, 13, 1, NULL, '4534534', '2293902648@qq.com', NULL, '<p><u>太热特特人</u><span class=\"ql-cursor\">﻿</span></p>', 'pending', '2024-08-12 19:36:41');
INSERT INTO `myz_comments` VALUES (142, 13, 1, NULL, '4534534', '2293902648@qq.com', NULL, '<p><em>45423423二二位</em></p>', 'pending', '2024-08-12 19:36:48');
INSERT INTO `myz_comments` VALUES (143, 13, 1, NULL, '4534534', '2293902648@qq.com', NULL, '<p><span class=\"ql-size-huge\">改改改改改</span></p>', 'pending', '2024-08-12 19:37:07');
INSERT INTO `myz_comments` VALUES (144, 13, 1, NULL, '4534534', '2293902648@qq.com', NULL, '<pre class=\"ql-syntax\" spellcheck=\"false\">gghsfghsfghs\n</pre>', 'pending', '2024-08-12 19:37:37');
INSERT INTO `myz_comments` VALUES (145, 13, 1, NULL, '2312312', '2293902648@qq.com', 143, '别放屁', 'pending', '2024-08-12 19:38:22');
INSERT INTO `myz_comments` VALUES (146, 17, 1, NULL, '我去而我却二', '2293902648@qq.com', NULL, '3423423', 'pending', '2024-08-12 19:38:50');
INSERT INTO `myz_comments` VALUES (147, 17, 1, NULL, '我去而我却二', '2293902648@qq.com', 146, '2293902648@qq.com', 'pending', '2024-08-12 19:38:57');
INSERT INTO `myz_comments` VALUES (148, 15, 1, NULL, '5345345345', '2293902648@qq.com', NULL, '5345345', 'pending', '2024-08-12 19:39:06');
INSERT INTO `myz_comments` VALUES (149, 13, 1, NULL, '4234', '2293902648@qq.com', NULL, '不不不不不不不不不巴巴爸爸巴巴爸爸', 'pending', '2024-08-12 19:48:55');
INSERT INTO `myz_comments` VALUES (150, 1, 2, NULL, '啊发斯蒂芬', '2293902648@qq.com', NULL, 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvv', 'pending', '2024-08-12 19:49:10');
INSERT INTO `myz_comments` VALUES (151, 1, 2, NULL, '啊发斯蒂芬', '2293902648@qq.com', 150, '休息休息嘻嘻嘻嘻嘻嘻嘻嘻嘻', 'pending', '2024-08-12 19:49:27');
INSERT INTO `myz_comments` VALUES (152, 0, 0, NULL, '硕士生', 'dasda@qq.com', NULL, '留言', 'pending', '2024-08-22 13:38:40');
INSERT INTO `myz_comments` VALUES (153, 0, 0, NULL, 'eqweqw', '1231eqw@qw.gdfs', NULL, 'cccfc', 'pending', '2024-08-22 13:40:02');
INSERT INTO `myz_comments` VALUES (154, 0, 0, NULL, 'eqweqw', '1231eqw@qw.gdfs', 152, '434234234', 'pending', '2024-08-22 13:41:02');

-- ----------------------------
-- Table structure for myz_favorites
-- ----------------------------
DROP TABLE IF EXISTS `myz_favorites`;
CREATE TABLE `myz_favorites`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收藏的博客或文章标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '对博客或文章的描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '博客或文章的URL链接',
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '博客或文章的作者',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '额外的笔记或评论',
  `article_type` int NULL DEFAULT NULL COMMENT '文章类型',
  `article_tag` int NULL DEFAULT NULL COMMENT '文章标签',
  `article_direction` int NULL DEFAULT NULL COMMENT '文章方向',
  `article_status` int NULL DEFAULT NULL COMMENT '文章状态',
  `del_flag` int NULL DEFAULT NULL COMMENT '删除标记',
  `favorite_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏日期',
  `article_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '文章更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_url`(`url` ASC) USING BTREE COMMENT '确保URL的唯一性'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myz_favorites
-- ----------------------------
INSERT INTO `myz_favorites` VALUES (1, 'a', '2134123', 'aa', 'aa', '123123', 2, 2, 1, 2, 0, '2024-08-10 16:29:24', '2024-08-10 16:29:24');

-- ----------------------------
-- Table structure for myz_goal
-- ----------------------------
DROP TABLE IF EXISTS `myz_goal`;
CREATE TABLE `myz_goal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `goal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '目标名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '目标描述',
  `status` int NULL DEFAULT NULL COMMENT '目标状态',
  `goal_type` int NULL DEFAULT NULL COMMENT '目标类型',
  `goal_tag` int NULL DEFAULT NULL COMMENT '目标标签',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '图片URL',
  `website_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '网站链接',
  `precondition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前置条件',
  `article_id` int NULL DEFAULT NULL COMMENT '博客索引',
  `order_index` int NULL DEFAULT 0,
  `come_true_data` date NULL DEFAULT NULL COMMENT '实现时间',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myz_goal
-- ----------------------------
INSERT INTO `myz_goal` VALUES (1, '测试', '测试', 1, NULL, 2, '/profile/upload/2024/08/13/adminAvatar_20240813125230A002.jpg', 'https://element.eleme.cn/#/zh-CN', '测试', NULL, 0, NULL, '2024-08-13 00:00:00');
INSERT INTO `myz_goal` VALUES (2, 'AA', 'CCC', 3, 2, 2, '/profile/upload/2024/08/13/284543_20240813132441A003.png', 'http://localhost/allArticle', 'EEE', NULL, 2, NULL, '2024-08-13 00:00:00');

-- ----------------------------
-- Table structure for myz_toolbox
-- ----------------------------
DROP TABLE IF EXISTS `myz_toolbox`;
CREATE TABLE `myz_toolbox`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `tool_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工具描述',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工具图片',
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工具链接',
  `type` int NOT NULL COMMENT '工具类型',
  `order_index` int NULL DEFAULT 0 COMMENT '工具顺序',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of myz_toolbox
-- ----------------------------
INSERT INTO `myz_toolbox` VALUES (1, 'element', 'element', '/profile/upload/2024/08/13/adminAvatar_20240813151407A001.jpg', 'https://element.eleme.cn/#/zh-CN', 3, 1, NULL, '2024-08-13 15:14:39');
INSERT INTO `myz_toolbox` VALUES (2, '花瓣网', '花瓣网', '/profile/upload/2024/08/13/微信图片_20240804183502_20240813170135A002.png', 'https://huaban.com/?ref=16map.com', 1, 0, NULL, '2024-08-13 17:02:35');
INSERT INTO `myz_toolbox` VALUES (3, '木有枝', '木有枝', '/profile/upload/2024/08/13/logoQQ_20240813171100A003.png', 'https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g', 2, 0, NULL, '2024-08-13 17:11:23');
INSERT INTO `myz_toolbox` VALUES (4, 'iconfont', 'iconfont', '/profile/upload/2024/08/13/398b2043dec3a311635c74bc214f2af0_20240813171903A004.jpeg', 'https://16map.com/sites/1267.html', 4, 0, NULL, '2024-08-13 17:19:43');
INSERT INTO `myz_toolbox` VALUES (5, 'wallhaven', 'wallhaven', '/profile/upload/2024/08/13/微信图片_20240804183333_20240813171957A005.png', 'https://wallhaven.cc/?ref=16map.com', 3, 0, NULL, '2024-08-13 17:20:32');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_user`;
CREATE TABLE `sys_auth_user`  (
  `auth_id` bigint NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `uuid` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '第三方平台用户唯一ID',
  `user_id` bigint NOT NULL COMMENT '系统用户ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户来源',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '第三方授权表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-07-02 22:17:11', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-07-02 22:17:11', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-07-02 22:17:11', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-07-02 22:17:11', 'admin', '2024-08-09 20:29:32', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-07-02 22:17:11', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-07-02 22:17:11', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 1, 'Java', '1', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:15:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 2, 'Python', '2', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:15:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 3, 'C', '3', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:15:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (33, 4, 'C#', '4', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:15:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (34, 5, 'JavaScript', '5', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:16:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (35, 1, 'Vue', '1', 'blog_article_tag', NULL, 'success', 'N', '0', 'admin', '2024-08-08 15:16:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (36, 2, 'Echarts', '2', 'blog_article_tag', NULL, 'success', 'N', '0', 'admin', '2024-08-08 15:17:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (37, 3, '算法', '3', 'blog_article_tag', NULL, 'success', 'N', '0', 'admin', '2024-08-08 15:18:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (38, 1, '笔记', '1', 'blog_article_direction', NULL, 'info', 'N', '0', 'admin', '2024-08-08 15:18:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (39, 2, '心得', '2', 'blog_article_direction', NULL, 'info', 'N', '0', 'admin', '2024-08-08 15:18:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (40, 3, '生活', '3', 'blog_article_direction', NULL, 'info', 'N', '0', 'admin', '2024-08-08 15:18:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (41, 1, '所有人可评论', '1', 'blog_allow_comments', NULL, 'default', 'N', '0', 'admin', '2024-08-08 15:19:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (42, 2, '仅用户可评论', '2', 'blog_allow_comments', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:19:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (43, 3, '仅自己可评论', '3', 'blog_allow_comments', NULL, 'success', 'N', '0', 'admin', '2024-08-08 15:20:15', 'admin', '2024-08-08 15:20:22', NULL);
INSERT INTO `sys_dict_data` VALUES (44, 4, '不可评论', '4', 'blog_allow_comments', NULL, 'info', 'N', '0', 'admin', '2024-08-08 15:20:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 1, '草稿', '1', 'blog_article_status', NULL, 'default', 'N', '0', 'admin', '2024-08-08 15:21:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 2, '已发布', '2', 'blog_article_status', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:21:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (47, 3, '待审核', '3', 'blog_article_status', NULL, 'info', 'N', '0', 'admin', '2024-08-08 15:22:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 4, '已归档', '4', 'blog_article_status', NULL, 'success', 'N', '0', 'admin', '2024-08-08 15:23:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 5, '私密', '5', 'blog_article_status', NULL, 'warning', 'N', '0', 'admin', '2024-08-08 15:23:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (50, 1, '正常', '1', 'blog_del_flag', NULL, 'primary', 'N', '0', 'admin', '2024-08-08 15:24:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 2, '已删除', '2', 'blog_del_flag', NULL, 'danger', 'N', '0', 'admin', '2024-08-08 15:24:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (52, 1, '正在审核', '1', 'myz_comments_status', NULL, 'info', 'N', '0', 'admin', '2024-08-10 20:53:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (53, 2, '审核通过', '2', 'myz_comments_status', NULL, 'success', 'N', '0', 'admin', '2024-08-10 20:53:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (54, 3, '已隐藏', '3', 'myz_comments_status', NULL, 'warning', 'N', '0', 'admin', '2024-08-10 20:54:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (55, 4, '已删除', '4', 'myz_comments_status', NULL, 'danger', 'N', '0', 'admin', '2024-08-10 20:54:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 1, '原创文章', '1', 'blog_article_class', NULL, 'primary', 'N', '0', 'admin', '2024-08-10 21:01:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 2, '收藏文章', '2', 'blog_article_class', NULL, 'success', 'N', '0', 'admin', '2024-08-10 21:01:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 1, '正在审核', '1', 'blog_comments_status', NULL, 'info', 'N', '0', 'admin', '2024-08-11 09:44:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (59, 2, '审核通过', '2', 'blog_comments_status', NULL, 'success', 'N', '0', 'admin', '2024-08-11 09:45:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (60, 3, '隐藏', '3', 'blog_comments_status', NULL, 'warning', 'N', '0', 'admin', '2024-08-11 09:45:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 4, '已删除', '4', 'blog_comments_status', NULL, 'danger', 'N', '0', 'admin', '2024-08-11 09:45:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (62, 4, '知识', '4', 'blog_article_direction', NULL, 'info', 'N', '0', 'admin', '2024-08-11 13:31:58', 'admin', '2024-08-11 13:32:58', NULL);
INSERT INTO `sys_dict_data` VALUES (63, 4, '中间件', '4', 'blog_article_tag', NULL, 'success', 'N', '0', 'admin', '2024-08-11 13:33:58', 'admin', '2024-08-11 13:34:04', NULL);
INSERT INTO `sys_dict_data` VALUES (64, 5, '卷积云', '5', 'blog_article_tag', NULL, 'success', 'N', '0', 'admin', '2024-08-11 13:34:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (65, 1, '尚未开始', '1', 'blog_goal_status', NULL, 'info', 'N', '0', 'admin', '2024-08-13 12:17:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (66, 2, '正在学习', '2', 'blog_goal_status', NULL, 'primary', 'N', '0', 'admin', '2024-08-13 12:17:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (67, 3, '已经实现', '3', 'blog_goal_status', NULL, 'success', 'N', '0', 'admin', '2024-08-13 12:18:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (68, 4, '放弃目标', '4', 'blog_goal_status', NULL, 'warning', 'N', '0', 'admin', '2024-08-13 12:35:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (69, 1, '编程', '1', 'blog_tool_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-13 14:42:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (70, 2, '设计', '2', 'blog_tool_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-13 14:42:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (71, 3, '生活', '3', 'blog_tool_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-13 14:43:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (72, 4, '娱乐', '4', 'blog_tool_type', NULL, 'primary', 'N', '0', 'admin', '2024-08-13 14:43:15', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-07-02 22:17:11', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '文章类型', 'blog_article_type', '0', 'admin', '2024-08-08 15:11:17', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (12, '文章标签', 'blog_article_tag', '0', 'admin', '2024-08-08 15:11:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (13, '文章方向', 'blog_article_direction', '0', 'admin', '2024-08-08 15:12:14', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (14, '文章评论开关', 'blog_allow_comments', '0', 'admin', '2024-08-08 15:12:43', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (15, '文章状态', 'blog_article_status', '0', 'admin', '2024-08-08 15:13:11', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (16, '删除标记', 'blog_del_flag', '0', 'admin', '2024-08-08 15:13:35', 'admin', '2024-08-08 15:13:56', NULL);
INSERT INTO `sys_dict_type` VALUES (17, '评论状态', 'blog_comments_status', '0', 'admin', '2024-08-10 20:52:44', 'admin', '2024-08-10 20:53:03', NULL);
INSERT INTO `sys_dict_type` VALUES (18, '文章类型', 'blog_article_class', '0', 'admin', '2024-08-10 21:01:11', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (19, '目标进度', 'blog_goal_status', '0', 'admin', '2024-08-13 12:17:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (20, '工具类型', 'blog_tool_type', '0', 'admin', '2024-08-13 14:42:02', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-07-02 22:17:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-07-02 22:17:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-07-02 22:17:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-02 22:29:36');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 12:03:20');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 16:20:45');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 18:04:54');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 18:43:30');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 20:36:42');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 21:22:56');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 23:05:12');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-07-03 23:06:30');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 23:06:33');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-03 23:50:14');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-04 10:22:38');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 21:02:56');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-05 23:40:21');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-07 12:33:30');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-15 19:17:11');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-07-16 17:46:58');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-03 20:59:47');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-07 19:03:59');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-07 20:27:36');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-08 13:10:00');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-08 15:08:11');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-08 17:09:43');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-08 17:09:46');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-08 18:31:25');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-08 18:31:29');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-08 18:31:32');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 12:54:30');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 16:12:18');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 17:24:38');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 17:38:59');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 17:39:02');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 18:02:13');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 18:03:17');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 19:06:14');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-09 19:32:31');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 19:32:33');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-09 20:16:07');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:16:49');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:17:00');
INSERT INTO `sys_logininfor` VALUES (140, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:17:13');
INSERT INTO `sys_logininfor` VALUES (141, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:17:20');
INSERT INTO `sys_logininfor` VALUES (142, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:18:19');
INSERT INTO `sys_logininfor` VALUES (143, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:18:45');
INSERT INTO `sys_logininfor` VALUES (144, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:19:01');
INSERT INTO `sys_logininfor` VALUES (145, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:19:09');
INSERT INTO `sys_logininfor` VALUES (146, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:21:03');
INSERT INTO `sys_logininfor` VALUES (147, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:21:23');
INSERT INTO `sys_logininfor` VALUES (148, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:24:38');
INSERT INTO `sys_logininfor` VALUES (149, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:24:40');
INSERT INTO `sys_logininfor` VALUES (150, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:24:44');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-08-09 20:28:56');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-08-09 20:28:59');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:29:02');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:29:41');
INSERT INTO `sys_logininfor` VALUES (155, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:29:43');
INSERT INTO `sys_logininfor` VALUES (156, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:29:45');
INSERT INTO `sys_logininfor` VALUES (157, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:29:46');
INSERT INTO `sys_logininfor` VALUES (158, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:31:14');
INSERT INTO `sys_logininfor` VALUES (159, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:31:21');
INSERT INTO `sys_logininfor` VALUES (160, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:33:34');
INSERT INTO `sys_logininfor` VALUES (161, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:33:35');
INSERT INTO `sys_logininfor` VALUES (162, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:33:37');
INSERT INTO `sys_logininfor` VALUES (163, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:41:54');
INSERT INTO `sys_logininfor` VALUES (164, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:41:56');
INSERT INTO `sys_logininfor` VALUES (165, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:44:02');
INSERT INTO `sys_logininfor` VALUES (166, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:44:07');
INSERT INTO `sys_logininfor` VALUES (167, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:44:08');
INSERT INTO `sys_logininfor` VALUES (168, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:44:11');
INSERT INTO `sys_logininfor` VALUES (169, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:44:19');
INSERT INTO `sys_logininfor` VALUES (170, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:46:20');
INSERT INTO `sys_logininfor` VALUES (171, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:46:40');
INSERT INTO `sys_logininfor` VALUES (172, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:47:25');
INSERT INTO `sys_logininfor` VALUES (173, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:47:41');
INSERT INTO `sys_logininfor` VALUES (174, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:48:43');
INSERT INTO `sys_logininfor` VALUES (175, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:53:08');
INSERT INTO `sys_logininfor` VALUES (176, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:53:11');
INSERT INTO `sys_logininfor` VALUES (177, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:53:24');
INSERT INTO `sys_logininfor` VALUES (178, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:56:58');
INSERT INTO `sys_logininfor` VALUES (179, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:57:56');
INSERT INTO `sys_logininfor` VALUES (180, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:58:07');
INSERT INTO `sys_logininfor` VALUES (181, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 20:58:27');
INSERT INTO `sys_logininfor` VALUES (182, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:58:38');
INSERT INTO `sys_logininfor` VALUES (183, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:59:04');
INSERT INTO `sys_logininfor` VALUES (184, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 20:59:49');
INSERT INTO `sys_logininfor` VALUES (185, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 21:00:49');
INSERT INTO `sys_logininfor` VALUES (186, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 21:01:01');
INSERT INTO `sys_logininfor` VALUES (187, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-09 21:09:28');
INSERT INTO `sys_logininfor` VALUES (188, 'user', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-09 21:10:23');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 13:32:33');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-10 13:32:56');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 15:21:53');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-10 15:23:28');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 15:23:46');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-10 15:24:57');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 15:27:05');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-10 15:27:11');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 15:27:14');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-10 15:27:40');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 15:29:21');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-10 15:29:51');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 15:58:33');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-10 20:48:35');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-11 09:29:22');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-11 10:30:05');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-11 13:31:08');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-12 21:06:24');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 10:30:41');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 12:15:46');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-13 21:36:37');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-13 21:36:47');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 10:33:44');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-08-14 10:34:21');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-14 21:07:13');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-15 12:32:44');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-16 20:56:59');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-21 22:05:09');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-22 13:20:59');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-08-22 15:20:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1066 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 3, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-07-02 22:17:10', 'admin', '2024-08-08 15:40:43', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 4, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-07-02 22:17:10', 'admin', '2024-08-08 15:40:51', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 5, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-07-02 22:17:10', 'admin', '2024-08-08 15:40:56', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '博客', 0, 6, 'http://localhost/welcome', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-07-02 22:17:10', 'admin', '2024-08-09 18:45:17', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-07-02 22:17:10', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-07-02 22:17:10', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-07-02 22:17:10', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-07-02 22:17:10', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-07-02 22:17:10', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-07-02 22:17:10', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-07-02 22:17:10', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-07-02 22:17:10', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-07-02 22:17:10', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-07-02 22:17:10', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-07-02 22:17:10', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-07-02 22:17:10', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-07-02 22:17:10', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-07-02 22:17:10', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-07-02 22:17:10', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-07-02 22:17:10', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-07-02 22:17:10', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-07-02 22:17:10', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-07-02 22:17:10', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-07-02 22:17:10', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '博客系统', 0, 2, 'adminBlog/articles', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'table', 'admin', '2024-08-08 15:40:27', 'admin', '2024-08-10 16:10:13', '');
INSERT INTO `sys_menu` VALUES (1062, '文章管理', 1061, 1, 'articles', 'adminBlog/articles/index', NULL, '', 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-08-08 15:42:30', 'admin', '2024-08-10 16:10:22', '');
INSERT INTO `sys_menu` VALUES (1063, '收藏管理', 1061, 2, 'collectArticles', 'adminBlog/collectArticles/index', NULL, '', 1, 0, 'C', '0', '0', '', 'example', 'admin', '2024-08-10 16:08:51', 'admin', '2024-08-10 16:10:26', '');
INSERT INTO `sys_menu` VALUES (1064, '评论管理', 1061, 3, 'comments', 'adminBlog/comments/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'wechat', 'admin', '2024-08-11 09:30:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, '学习目标', 1061, 4, 'studyGoal', 'adminBlog/studyGoal/index', NULL, '', 1, 0, 'C', '0', '0', NULL, 'list', 'admin', '2024-08-13 12:36:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '工具管理', 1061, 5, 'toolCabinet', 'adminBlog/toolCabinet/index', NULL, '', 1, 0, 'C', '0', '0', '', '#', 'admin', '2024-08-13 15:07:49', 'admin', '2024-08-13 15:08:03', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-07-02 22:17:11', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-07-02 22:17:11', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章类型\",\"dictType\":\"blog_article_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:11:17', 18);
INSERT INTO `sys_oper_log` VALUES (2, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章标签\",\"dictType\":\"blog_article_tag\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:11:48', 17);
INSERT INTO `sys_oper_log` VALUES (3, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章方向\",\"dictType\":\"blog_article_direction\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:12:14', 18);
INSERT INTO `sys_oper_log` VALUES (4, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章评论开关\",\"dictType\":\"blog_allow_comments\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:12:43', 18);
INSERT INTO `sys_oper_log` VALUES (5, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章状态\",\"dictType\":\"blog_article_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:13:11', 17);
INSERT INTO `sys_oper_log` VALUES (6, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"删除标记\",\"dictType\":\"blog_del_flag\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:13:35', 18);
INSERT INTO `sys_oper_log` VALUES (7, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:13:35\",\"dictId\":16,\"dictName\":\"删除标记\",\"dictType\":\"blog_del_flag\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:13:48', 21);
INSERT INTO `sys_oper_log` VALUES (8, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:13:35\",\"dictId\":16,\"dictName\":\"删除标记\",\"dictType\":\"blog_del_flag\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:13:56', 21);
INSERT INTO `sys_oper_log` VALUES (9, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"Java\",\"dictSort\":1,\"dictType\":\"blog_article_type\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:15:23', 8);
INSERT INTO `sys_oper_log` VALUES (10, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"Python\",\"dictSort\":2,\"dictType\":\"blog_article_type\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:15:36', 16);
INSERT INTO `sys_oper_log` VALUES (11, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"C\",\"dictSort\":3,\"dictType\":\"blog_article_type\",\"dictValue\":\"3\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:15:48', 15);
INSERT INTO `sys_oper_log` VALUES (12, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"C#\",\"dictSort\":4,\"dictType\":\"blog_article_type\",\"dictValue\":\"4\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:15:57', 17);
INSERT INTO `sys_oper_log` VALUES (13, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"JavaScript\",\"dictSort\":5,\"dictType\":\"blog_article_type\",\"dictValue\":\"5\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:16:13', 16);
INSERT INTO `sys_oper_log` VALUES (14, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"Vue\",\"dictSort\":1,\"dictType\":\"blog_article_tag\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:16:41', 6);
INSERT INTO `sys_oper_log` VALUES (15, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"Echarts\",\"dictSort\":2,\"dictType\":\"blog_article_tag\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:17:26', 16);
INSERT INTO `sys_oper_log` VALUES (16, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"算法\",\"dictSort\":3,\"dictType\":\"blog_article_tag\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:18:05', 17);
INSERT INTO `sys_oper_log` VALUES (17, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"笔记\",\"dictSort\":1,\"dictType\":\"blog_article_direction\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:18:21', 15);
INSERT INTO `sys_oper_log` VALUES (18, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"心得\",\"dictSort\":2,\"dictType\":\"blog_article_direction\",\"dictValue\":\"2\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:18:34', 18);
INSERT INTO `sys_oper_log` VALUES (19, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"生活\",\"dictSort\":3,\"dictType\":\"blog_article_direction\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:18:44', 18);
INSERT INTO `sys_oper_log` VALUES (20, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"所有人可评论\",\"dictSort\":1,\"dictType\":\"blog_allow_comments\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:19:30', 16);
INSERT INTO `sys_oper_log` VALUES (21, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"仅用户可评论\",\"dictSort\":2,\"dictType\":\"blog_allow_comments\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:19:53', 18);
INSERT INTO `sys_oper_log` VALUES (22, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"仅自己可评论\",\"dictSort\":3,\"dictType\":\"blog_allow_comments\",\"dictValue\":\"3\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:20:15', 16);
INSERT INTO `sys_oper_log` VALUES (23, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:20:15\",\"default\":false,\"dictCode\":43,\"dictLabel\":\"仅自己可评论\",\"dictSort\":3,\"dictType\":\"blog_allow_comments\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:20:22', 16);
INSERT INTO `sys_oper_log` VALUES (24, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不可评论\",\"dictSort\":4,\"dictType\":\"blog_allow_comments\",\"dictValue\":\"4\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:20:39', 16);
INSERT INTO `sys_oper_log` VALUES (25, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"草稿\",\"dictSort\":1,\"dictType\":\"blog_article_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:21:18', 17);
INSERT INTO `sys_oper_log` VALUES (26, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已发布\",\"dictSort\":2,\"dictType\":\"blog_article_status\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:21:34', 16);
INSERT INTO `sys_oper_log` VALUES (27, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":3,\"dictType\":\"blog_article_status\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:22:43', 14);
INSERT INTO `sys_oper_log` VALUES (28, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已归档\",\"dictSort\":4,\"dictType\":\"blog_article_status\",\"dictValue\":\"4\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:23:09', 17);
INSERT INTO `sys_oper_log` VALUES (29, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"私密\",\"dictSort\":5,\"dictType\":\"blog_article_status\",\"dictValue\":\"5\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:23:42', 15);
INSERT INTO `sys_oper_log` VALUES (30, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":1,\"dictType\":\"blog_del_flag\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:24:23', 15);
INSERT INTO `sys_oper_log` VALUES (31, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已删除\",\"dictSort\":2,\"dictType\":\"blog_del_flag\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:24:31', 17);
INSERT INTO `sys_oper_log` VALUES (32, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_articles\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:30:59', 52);
INSERT INTO `sys_oper_log` VALUES (33, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:31:57', 18);
INSERT INTO `sys_oper_log` VALUES (34, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_articles\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:32:00', 45);
INSERT INTO `sys_oper_log` VALUES (35, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:33:57', 15);
INSERT INTO `sys_oper_log` VALUES (36, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_articles\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:34:00', 41);
INSERT INTO `sys_oper_log` VALUES (37, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"articles\",\"className\":\"MyzArticles\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleTitle\",\"columnComment\":\"文章标题\",\"columnId\":33,\"columnName\":\"article_title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"articleTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleContent\",\"columnComment\":\"文章内容\",\"columnId\":34,\"columnName\":\"article_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"articleContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleAuthorId\",\"columnComment\":\"文章作者编号\",\"columnId\":35,\"columnName\":\"article_author_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:39:37', 59);
INSERT INTO `sys_oper_log` VALUES (38, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"blog\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:40:27', 9);
INSERT INTO `sys_oper_log` VALUES (39, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 22:17:10\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:40:43', 15);
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 22:17:10\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:40:51', 8);
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 22:17:10\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:40:56', 15);
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 22:17:10\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:41:00', 15);
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"blog/article\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"blog\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:42:30', 15);
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"adminblog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:50:03', 15);
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminblog/article\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:50:37', 15);
INSERT INTO `sys_oper_log` VALUES (46, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"articles\",\"className\":\"MyzArticles\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-08 15:39:37\",\"usableColumn\":false},{\"capJavaField\":\"ArticleTitle\",\"columnComment\":\"文章标题\",\"columnId\":33,\"columnName\":\"article_title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"articleTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-08 15:39:37\",\"usableColumn\":false},{\"capJavaField\":\"ArticleContent\",\"columnComment\":\"文章内容\",\"columnId\":34,\"columnName\":\"article_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"articleContent\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-08-08 15:39:37\",\"usableColumn\":false},{\"capJavaField\":\"ArticleAuthorId\",\"columnComment\":\"文章作者编号\",\"columnId\":35,\"columnName\":\"article_author_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-08 15:34:00\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 15:50:56', 38);
INSERT INTO `sys_oper_log` VALUES (47, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myz_articles\"}', NULL, 0, NULL, '2024-08-08 15:50:59', 218);
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminblog/article/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:07:51', 22);
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminblog/article/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:08:00', 17);
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"blog\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:08:44', 15);
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminblog/article/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"blog/article\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:09:05', 5);
INSERT INTO `sys_oper_log` VALUES (52, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/blog/articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:10:55', 9);
INSERT INTO `sys_oper_log` VALUES (53, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"blog/article/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"article\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:11:44', 16);
INSERT INTO `sys_oper_log` VALUES (54, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"blog/articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:11:55', 16);
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"blog/articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:13:19', 34);
INSERT INTO `sys_oper_log` VALUES (56, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminblog/articles/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:13:28', 17);
INSERT INTO `sys_oper_log` VALUES (57, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"adminBlog/articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:15:06', 34);
INSERT INTO `sys_oper_log` VALUES (58, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/articles/articles/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:15:31', 18);
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/articles/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:15:49', 15);
INSERT INTO `sys_oper_log` VALUES (60, '文章', 1, 'com.ruoyi.web.controller.blog.MyzArticlesController.add()', 'POST', 1, 'admin', '研发部门', '/adminBlog/articles', '127.0.0.1', '内网IP', '{\"allowComments\":1,\"articleAuthorId\":1,\"articleComments\":\"<p>ds</p>\",\"articleContent\":\"<p>a</p>\",\"articleCreatedAt\":\"2024-08-07\",\"articleDirection\":2,\"articleLikes\":1,\"articleStatus\":2,\"articleTag\":2,\"articleTitle\":\"A\",\"articleType\":1,\"articleUpdatedAt\":\"2024-08-22\",\"articleViews\":1,\"coverImage\":\"/profile/upload/2024/08/08/284543_20240808162619A001.png\",\"delFlag\":1,\"id\":12,\"params\":{},\"seoDescription\":\"1\",\"seoTitle\":\"1\",\"sourceLink\":\"https://cn.bing.com/search?pc=CNPA19&q=earcher\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:26:56', 19);
INSERT INTO `sys_oper_log` VALUES (61, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 22:17:10\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"博客\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://localhost/blog\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-08 16:32:07', 16);
INSERT INTO `sys_oper_log` VALUES (62, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-07-02 22:17:10\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"博客\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"http://localhost/welcome\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-09 18:45:17', 34);
INSERT INTO `sys_oper_log` VALUES (63, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"user\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":3,\"userName\":\"user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-09 19:33:51', 105);
INSERT INTO `sys_oper_log` VALUES (64, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":3,\"roleKey\":\"visitor\",\"roleName\":\"游客\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-09 19:35:22', 25);
INSERT INTO `sys_oper_log` VALUES (65, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-07-02 22:17:11\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-09 20:29:32', 16);
INSERT INTO `sys_oper_log` VALUES (66, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-09 20:29:35', 19);
INSERT INTO `sys_oper_log` VALUES (67, '文章', 3, 'com.ruoyi.web.controller.blog.MyzArticlesController.remove()', 'DELETE', 1, 'admin', '研发部门', '/adminBlog/articles/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 15:22:13', 15);
INSERT INTO `sys_oper_log` VALUES (68, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_favorites\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 15:58:44', 87);
INSERT INTO `sys_oper_log` VALUES (69, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"favorites\",\"className\":\"MyzFavorites\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一标识符\",\"columnId\":51,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 15:58:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"收藏的博客或文章标题\",\"columnId\":52,\"columnName\":\"title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 15:58:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"对博客或文章的描述\",\"columnId\":53,\"columnName\":\"description\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 15:58:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"博客或文章的URL链接\",\"columnId\":54,\"columnName\":\"url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 15:58:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:02:36', 52);
INSERT INTO `sys_oper_log` VALUES (70, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myz_favorites\"}', NULL, 0, NULL, '2024-08-10 16:02:39', 177);
INSERT INTO `sys_oper_log` VALUES (71, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"blog/articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:07:56', 14);
INSERT INTO `sys_oper_log` VALUES (72, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"blog/articles/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:08:03', 15);
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"collectArticles\",\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"收藏管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"blog/collectArticles/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:08:51', 27);
INSERT INTO `sys_oper_log` VALUES (74, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"blog/collectArticles/index\",\"createTime\":\"2024-08-10 16:08:51\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"收藏管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"blog/collectArticles/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:09:08', 8);
INSERT INTO `sys_oper_log` VALUES (75, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"blog/collectArticles/index\",\"createTime\":\"2024-08-10 16:08:51\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"收藏管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"collectArticles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:09:22', 19);
INSERT INTO `sys_oper_log` VALUES (76, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-08-08 15:40:27\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"博客系统\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"adminBlog/articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:10:13', 16);
INSERT INTO `sys_oper_log` VALUES (77, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/articles/index\",\"createTime\":\"2024-08-08 15:42:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"文章管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"articles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:10:22', 15);
INSERT INTO `sys_oper_log` VALUES (78, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/collectArticles/index\",\"createTime\":\"2024-08-10 16:08:51\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"收藏管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1061,\"path\":\"collectArticles\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:10:26', 7);
INSERT INTO `sys_oper_log` VALUES (79, '博客收藏', 1, 'com.ruoyi.web.controller.blog.MyzFavoritesController.add()', 'POST', 1, 'admin', '研发部门', '/blog/favorites', '127.0.0.1', '内网IP', '{\"articleDirection\":1,\"articleStatus\":2,\"articleTag\":2,\"articleType\":2,\"author\":\"aa\",\"description\":\"2134123\",\"id\":1,\"notes\":\"123123\",\"params\":{},\"title\":\"a\",\"url\":\"aa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 16:29:25', 31);
INSERT INTO `sys_oper_log` VALUES (80, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_comments\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:48:48', 80);
INSERT INTO `sys_oper_log` VALUES (81, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"评论状态\",\"dictType\":\"myz_comments_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:52:44', 22);
INSERT INTO `sys_oper_log` VALUES (82, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-10 20:52:44\",\"dictId\":17,\"dictName\":\"评论状态\",\"dictType\":\"blog_comments_status\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:53:03', 19);
INSERT INTO `sys_oper_log` VALUES (83, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正在审核\",\"dictSort\":1,\"dictType\":\"myz_comments_status\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:53:44', 9);
INSERT INTO `sys_oper_log` VALUES (84, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核通过\",\"dictSort\":2,\"dictType\":\"myz_comments_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:53:57', 19);
INSERT INTO `sys_oper_log` VALUES (85, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已隐藏\",\"dictSort\":3,\"dictType\":\"myz_comments_status\",\"dictValue\":\"3\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:54:18', 6);
INSERT INTO `sys_oper_log` VALUES (86, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已删除\",\"dictSort\":4,\"dictType\":\"myz_comments_status\",\"dictValue\":\"4\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 20:54:34', 14);
INSERT INTO `sys_oper_log` VALUES (87, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"文章类型\",\"dictType\":\"blog_article_class\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 21:01:11', 7);
INSERT INTO `sys_oper_log` VALUES (88, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"原创文章\",\"dictSort\":1,\"dictType\":\"blog_article_class\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 21:01:35', 6);
INSERT INTO `sys_oper_log` VALUES (89, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"收藏文章\",\"dictSort\":2,\"dictType\":\"blog_article_class\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 21:01:50', 16);
INSERT INTO `sys_oper_log` VALUES (90, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 21:04:01', 13);
INSERT INTO `sys_oper_log` VALUES (91, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_comments\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 21:04:07', 38);
INSERT INTO `sys_oper_log` VALUES (92, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"comments\",\"className\":\"MyzComments\",\"columns\":[{\"capJavaField\":\"CommentId\",\"columnComment\":\"评论唯一标识符\",\"columnId\":74,\"columnName\":\"comment_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 21:04:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"commentId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleId\",\"columnComment\":\"评论所属文章的ID\",\"columnId\":75,\"columnName\":\"article_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 21:04:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"articleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArticleType\",\"columnComment\":\"博客类型\",\"columnId\":76,\"columnName\":\"article_type\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 21:04:07\",\"dictType\":\"blog_article_class\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"articleType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"发表评论的用户ID，可以为NULL表示匿名用户\",\"columnId\":77,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-10 21:04:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-10 21:05:57', 54);
INSERT INTO `sys_oper_log` VALUES (93, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myz_comments\"}', NULL, 0, NULL, '2024-08-10 21:06:00', 195);
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/comments/index\",\"createBy\":\"admin\",\"icon\":\"wechat\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评论管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1061,\"path\":\"comments\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 09:30:38', 15);
INSERT INTO `sys_oper_log` VALUES (95, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正在审核\",\"dictSort\":1,\"dictType\":\"blog_comments_status\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 09:44:50', 21);
INSERT INTO `sys_oper_log` VALUES (96, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"审核通过\",\"dictSort\":2,\"dictType\":\"blog_comments_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 09:45:08', 18);
INSERT INTO `sys_oper_log` VALUES (97, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"隐藏\",\"dictSort\":3,\"dictType\":\"blog_comments_status\",\"dictValue\":\"3\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 09:45:43', 6);
INSERT INTO `sys_oper_log` VALUES (98, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已删除\",\"dictSort\":4,\"dictType\":\"blog_comments_status\",\"dictValue\":\"4\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 09:45:56', 17);
INSERT INTO `sys_oper_log` VALUES (99, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"content\":\"哈哈哈哈哈\",\"params\":{},\"userEmail\":\"2293902648@qq.com\",\"userName\":\"测试1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'article_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Git\\Blog\\blog\\target\\classes\\mapper\\system\\MyzCommentsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MyzCommentsMapper.insertMyzComments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into myz_comments          ( user_name,             user_email,                          content )           values ( ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'article_id\' doesn\'t have a default value\n; Field \'article_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'article_id\' doesn\'t have a default value', '2024-08-11 10:51:18', 65);
INSERT INTO `sys_oper_log` VALUES (100, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":1,\"content\":\"231223\",\"params\":{},\"status\":\"2\",\"userEmail\":\"2293902648@qq.com\",\"userName\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 10:56:12', 8);
INSERT INTO `sys_oper_log` VALUES (101, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":2,\"content\":\"231223\",\"params\":{},\"status\":\"2\",\"userEmail\":\"2293902648@qq.com\",\"userName\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 10:56:20', 14);
INSERT INTO `sys_oper_log` VALUES (102, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":3,\"content\":\"231223\",\"params\":{},\"status\":\"2\",\"userEmail\":\"2293902648@qq.com\",\"userName\":\"测试1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 10:56:22', 3);
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"知识\",\"dictSort\":4,\"dictType\":\"blog_article_direction\",\"dictValue\":\"3\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 13:31:58', 9);
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-11 13:31:58\",\"default\":false,\"dictCode\":62,\"dictLabel\":\"知识\",\"dictSort\":4,\"dictType\":\"blog_article_direction\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 13:32:58', 22);
INSERT INTO `sys_oper_log` VALUES (105, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"中间件\",\"dictSort\":4,\"dictType\":\"blog_article_tag\",\"dictValue\":\"4\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 13:33:58', 16);
INSERT INTO `sys_oper_log` VALUES (106, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-08-11 13:33:58\",\"default\":false,\"dictCode\":63,\"dictLabel\":\"中间件\",\"dictSort\":4,\"dictType\":\"blog_article_tag\",\"dictValue\":\"4\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 13:34:04', 17);
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"卷积云\",\"dictSort\":5,\"dictType\":\"blog_article_tag\",\"dictValue\":\"5\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 13:34:56', 16);
INSERT INTO `sys_oper_log` VALUES (108, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":1,\"articleType\":1,\"commentId\":4,\"content\":\"312\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 14:12:20', 5);
INSERT INTO `sys_oper_log` VALUES (109, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":1,\"articleType\":1,\"commentId\":5,\"content\":\"312\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 14:12:23', 14);
INSERT INTO `sys_oper_log` VALUES (110, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":1,\"articleType\":1,\"commentId\":6,\"content\":\"32\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 14:12:36', 7);
INSERT INTO `sys_oper_log` VALUES (111, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"content\":\"\",\"params\":{},\"status\":\"2\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Git\\Blog\\blog\\target\\classes\\mapper\\system\\MyzCommentsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MyzCommentsMapper.insertMyzComments-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into myz_comments          ( article_id,             article_type,                                                                              status )           values ( ?,             ?,                                                                              ? )\r\n### Cause: java.sql.SQLException: Field \'content\' doesn\'t have a default value\n; Field \'content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'content\' doesn\'t have a default value', '2024-08-11 14:35:33', 14);
INSERT INTO `sys_oper_log` VALUES (112, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":7,\"content\":\"测试\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 14:37:48', 5);
INSERT INTO `sys_oper_log` VALUES (113, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":8,\"content\":\"测试\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 14:37:52', 14);
INSERT INTO `sys_oper_log` VALUES (114, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":9,\"content\":\"eqw\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:02:41', 5);
INSERT INTO `sys_oper_log` VALUES (115, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":10,\"content\":\"aaa\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:04:10', 15);
INSERT INTO `sys_oper_log` VALUES (116, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":11,\"content\":\"cc\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:05:08', 14);
INSERT INTO `sys_oper_log` VALUES (117, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":12,\"content\":\"bbbb\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:05:53', 5);
INSERT INTO `sys_oper_log` VALUES (118, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":13,\"content\":\"rew\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:07:24', 14);
INSERT INTO `sys_oper_log` VALUES (119, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":14,\"content\":\"re\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:07:37', 13);
INSERT INTO `sys_oper_log` VALUES (120, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":15,\"content\":\"dfsdf\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:07:41', 14);
INSERT INTO `sys_oper_log` VALUES (121, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":16,\"content\":\"dasdas\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:07:46', 13);
INSERT INTO `sys_oper_log` VALUES (122, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":17,\"content\":\"fffff\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:07:53', 4);
INSERT INTO `sys_oper_log` VALUES (123, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":18,\"content\":\"ddddd\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:08:49', 4);
INSERT INTO `sys_oper_log` VALUES (124, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":19,\"content\":\"4324\",\"params\":{},\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:09:59', 4);
INSERT INTO `sys_oper_log` VALUES (125, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":20,\"content\":\"444444\",\"params\":{},\"parentCommentId\":1,\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:10:28', 15);
INSERT INTO `sys_oper_log` VALUES (126, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":13,\"articleType\":1,\"commentId\":21,\"content\":\"1111111111111\",\"params\":{},\"parentCommentId\":1,\"status\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-11 15:11:18', 15);
INSERT INTO `sys_oper_log` VALUES (127, '文章', 1, 'com.ruoyi.web.controller.blog.MyzArticlesController.add()', 'POST', 1, 'admin', '研发部门', '/blog/articles', '127.0.0.1', '内网IP', '{\"allowComments\":2,\"articleAuthorId\":111,\"articleContent\":\"<p><u>测试</u> <strong>AA <em>BB <s>CC</s></em></strong></p><blockquote>DASDASDASD</blockquote><pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">private Date createdAt;\\n</pre><ol><li>43</li><li>45</li></ol><ul><li>6546</li><li>765</li></ul><p>65756</p><p class=\\\"ql-indent-2\\\">54534</p><p class=\\\"ql-indent-2\\\"><span class=\\\"ql-size-huge\\\">453455</span></p><h1>一</h1><h2>二</h2><h3>三</h3><h4>四</h4><p><span style=\\\"color: rgb(0, 138, 0);\\\">防守打法收到</span></p><p><span style=\\\"background-color: rgb(204, 232, 204);\\\">恶趣味去问问</span></p><p class=\\\"ql-align-center\\\"><span style=\\\"background-color: rgb(204, 232, 204);\\\">大四的</span></p><p class=\\\"ql-align-right\\\"><span style=\\\"background-color: rgb(204, 232, 204);\\\">3232</span></p><p><span style=\\\"background-color: rgb(204, 232, 204);\\\">323</span></p><p class=\\\"ql-align-justify\\\"><a href=\\\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\" style=\\\"background-color: rgb(204, 232, 204);\\\">4の4234</a></p><p>43244344344Tff</p><p><a href=\\\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\">Kimi.ai - 帮你看更大的世界 (moonshot.cn)</a></p><p><img src=\\\"/dev-api/profile/upload/2024/08/13/adminAvatar_20240813104409A001.jpg\\\"></p><p><br></p>\",\"articleDirection\":2,\"articleStatus\":2,\"articleTag\":2,\"articleTitle\":\"测试\",\"articleType\":3,\"coverImage\":\"/profile/upload/2024/08/13/adminAvatar_20240813104521A002.jpg\",\"id\":33,\"params\":{},\"sourceLink\":\"https://baijiahao.baidu.com/s?id=1798723173756861692\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 10:47:48', 16);
INSERT INTO `sys_oper_log` VALUES (128, '文章', 2, 'com.ruoyi.web.controller.blog.MyzArticlesController.edit()', 'PUT', 1, 'admin', '研发部门', '/blog/articles', '127.0.0.1', '内网IP', '{\"allowComments\":2,\"articleAuthorId\":111,\"articleContent\":\"<p><u>测试</u> <strong>AA <em>BB <s>CC</s></em></strong></p><p><br></p><blockquote>DASDASDASD</blockquote><pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">private Date createdAt;\\n</pre><ol><li>43</li><li>45</li></ol><ul><li>6546</li><li>765</li></ul><p>65756</p><p class=\\\"ql-indent-2\\\">54534</p><p class=\\\"ql-indent-2\\\"><span class=\\\"ql-size-huge\\\">453455</span></p><p class=\\\"ql-indent-2\\\"><br></p><h1>一</h1><h2>二</h2><h3>三</h3><h4>四</h4><p><span style=\\\"color: rgb(0, 138, 0);\\\">防守打法收到</span></p><p><span style=\\\"background-color: rgb(204, 232, 204);\\\">恶趣味去问问</span></p><p class=\\\"ql-align-center\\\"><span style=\\\"background-color: rgb(204, 232, 204);\\\">大四的</span></p><p class=\\\"ql-align-right\\\"><span style=\\\"background-color: rgb(204, 232, 204);\\\">3232</span></p><p><span style=\\\"background-color: rgb(204, 232, 204);\\\">323</span></p><p class=\\\"ql-align-justify\\\"><a href=\\\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\" style=\\\"background-color: rgb(204, 232, 204);\\\">4の4234</a></p><p>43244344344Tff</p><p><a href=\\\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\">Kimi.ai - 帮你看更大的世界 (moonshot.cn)</a></p><p><img src=\\\"/dev-api/profile/upload/2024/08/13/adminAvatar_20240813104409A001.jpg\\\"></p><p><br></p><iframe class=\\\"ql-video\\\" frameborder=\\\"0\\\" allowfullscreen=\\\"true\\\" src=\\\"https://www.bilibili.com/video/BV1CB4y1a7bF/\\\"></iframe><p><br></p>\",\"articleCreatedAt\":\"2024-08-13\",\"articleDirection\":2,\"articleLikes\":0,\"articleStatus\":2,\"articleTag\":2,\"articleTitle\":\"测试\",\"articleType\":3,\"articleUpdatedAt\":\"2024-08-13\",\"articleViews\":0,\"coverImage\":\"/profile/upload/2024/08/13/adminAvatar_20240813104521A002.jpg\",\"delFlag\":0,\"id\":33,\"params\":{},\"sourceLink\":\"https://baijiahao.baidu.com/s?id=1798723173756861692\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 10:49:05', 17);
INSERT INTO `sys_oper_log` VALUES (129, '文章', 2, 'com.ruoyi.web.controller.blog.MyzArticlesController.edit()', 'PUT', 1, 'admin', '研发部门', '/blog/articles', '127.0.0.1', '内网IP', '{\"allowComments\":2,\"articleAuthorId\":111,\"articleContent\":\"<p><u>测试</u> <strong>AA <em>BB <s>CC</s></em></strong></p><p><br></p><p><br></p><blockquote>DASDASDASD</blockquote><pre class=\\\"ql-syntax\\\" spellcheck=\\\"false\\\">private Date createdAt;\\n</pre><ol><li>43</li><li>45</li></ol><ul><li>6546</li><li>765</li></ul><p>65756</p><p class=\\\"ql-indent-2\\\">54534</p><p class=\\\"ql-indent-2\\\"><span class=\\\"ql-size-huge\\\">453455</span></p><p class=\\\"ql-indent-2\\\"><br></p><p class=\\\"ql-indent-2\\\"><br></p><h1>一</h1><h2>二</h2><h3>三</h3><h4>四</h4><p><span style=\\\"color: rgb(0, 138, 0);\\\">防守打法收到</span></p><p><span style=\\\"background-color: rgb(204, 232, 204);\\\">恶趣味去问问</span></p><p class=\\\"ql-align-center\\\"><span style=\\\"background-color: rgb(204, 232, 204);\\\">大四的</span></p><p class=\\\"ql-align-right\\\"><span style=\\\"background-color: rgb(204, 232, 204);\\\">3232</span></p><p><span style=\\\"background-color: rgb(204, 232, 204);\\\">323</span></p><p class=\\\"ql-align-justify\\\"><a href=\\\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\" style=\\\"background-color: rgb(204, 232, 204);\\\">4の4234</a></p><p>43244344344Tff</p><p><a href=\\\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\\\" rel=\\\"noopener noreferrer\\\" target=\\\"_blank\\\">Kimi.ai - 帮你看更大的世界 (moonshot.cn)</a></p><p><img src=\\\"/dev-api/profile/upload/2024/08/13/adminAvatar_20240813104409A001.jpg\\\"></p><p><br></p><iframe class=\\\"ql-video\\\" frameborder=\\\"0\\\" allowfullscreen=\\\"true\\\" src=\\\"http://baike.baidu.com/l/nDXEBQn5\\\"></iframe><p><br></p>\",\"articleCreatedAt\":\"2024-08-13\",\"articleDirection\":2,\"articleLikes\":0,\"articleStatus\":2,\"articleTag\":2,\"articleTitle\":\"测试\",\"articleType\":3,\"articleUpdatedAt\":\"2024-08-13\",\"articleViews\":0,\"coverImage\":\"/profile/upload/2024/08/13/adminAvatar_20240813104521A002.jpg\",\"delFlag\":0,\"id\":33,\"params\":{},\"sourceLink\":\"https://baijiahao.baidu.com/s?id=1798723173756861692\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 10:51:20', 14);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_goal\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:16:04', 79);
INSERT INTO `sys_oper_log` VALUES (131, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"目标进度\",\"dictType\":\"blog_goal_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:17:06', 18);
INSERT INTO `sys_oper_log` VALUES (132, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"尚未开始\",\"dictSort\":1,\"dictType\":\"blog_goal_status\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:17:40', 15);
INSERT INTO `sys_oper_log` VALUES (133, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正在学习\",\"dictSort\":2,\"dictType\":\"blog_goal_status\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:17:53', 17);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已经实现\",\"dictSort\":3,\"dictType\":\"blog_goal_status\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:18:17', 18);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"goal\",\"className\":\"MyzGoal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一标识符\",\"columnId\":84,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 12:16:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GoalName\",\"columnComment\":\"目标名称\",\"columnId\":85,\"columnName\":\"goal_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 12:16:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"goalName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"目标描述\",\"columnId\":86,\"columnName\":\"description\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 12:16:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"目标状态\",\"columnId\":87,\"columnName\":\"status\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 12:16:04\",\"dictType\":\"blog_goal_status\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:21:20', 41);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myz_goal\"}', NULL, 0, NULL, '2024-08-13 12:21:24', 159);
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"放弃目标\",\"dictSort\":4,\"dictType\":\"blog_goal_status\",\"dictValue\":\"4\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:35:06', 29);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/studyGoal/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"学习目标\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1061,\"path\":\"studyGoal\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:36:57', 24);
INSERT INTO `sys_oper_log` VALUES (139, '学习目标', 1, 'com.ruoyi.web.controller.blog.MyzGoalController.add()', 'POST', 1, 'admin', '研发部门', '/blog/goal', '127.0.0.1', '内网IP', '{\"description\":\"测试\",\"goalName\":\"测试\",\"goalTag\":2,\"id\":1,\"imageUrl\":\"/profile/upload/2024/08/13/adminAvatar_20240813125230A002.jpg\",\"orderIndex\":0,\"params\":{},\"precondition\":\"测试\",\"status\":1,\"websiteUrl\":\"https://element.eleme.cn/#/zh-CN/component/input-number\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 12:52:54', 23);
INSERT INTO `sys_oper_log` VALUES (140, '学习目标', 1, 'com.ruoyi.web.controller.blog.MyzGoalController.add()', 'POST', 1, 'admin', '研发部门', '/blog/goal', '127.0.0.1', '内网IP', '{\"description\":\"CCC\",\"goalName\":\"AA\",\"goalTag\":2,\"goalType\":2,\"id\":2,\"imageUrl\":\"/profile/upload/2024/08/13/284543_20240813132441A003.png\",\"orderIndex\":2,\"params\":{},\"precondition\":\"EEE\",\"status\":2,\"websiteUrl\":\"http://localhost/studyGoal\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 13:24:59', 13);
INSERT INTO `sys_oper_log` VALUES (141, '学习目标', 2, 'com.ruoyi.web.controller.blog.MyzGoalController.edit()', 'PUT', 1, 'admin', '研发部门', '/blog/goal', '127.0.0.1', '内网IP', '{\"createdAt\":\"2024-08-13\",\"description\":\"CCC\",\"goalName\":\"AA\",\"goalTag\":2,\"goalType\":2,\"id\":2,\"imageUrl\":\"/profile/upload/2024/08/13/284543_20240813132441A003.png\",\"orderIndex\":2,\"params\":{},\"precondition\":\"EEE\",\"status\":2,\"websiteUrl\":\"http://localhost/allArticle\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 13:55:34', 22);
INSERT INTO `sys_oper_log` VALUES (142, '学习目标', 2, 'com.ruoyi.web.controller.blog.MyzGoalController.edit()', 'PUT', 1, 'admin', '研发部门', '/blog/goal', '127.0.0.1', '内网IP', '{\"createdAt\":\"2024-08-13\",\"description\":\"测试\",\"goalName\":\"测试\",\"goalTag\":2,\"id\":1,\"imageUrl\":\"/profile/upload/2024/08/13/adminAvatar_20240813125230A002.jpg\",\"orderIndex\":0,\"params\":{},\"precondition\":\"测试\",\"status\":1,\"websiteUrl\":\"https://element.eleme.cn/#/zh-CN\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 13:55:49', 17);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"myz_toolbox\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:18:07', 53);
INSERT INTO `sys_oper_log` VALUES (144, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"工具类型\",\"dictType\":\"blog_tool_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:42:02', 16);
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"编程\",\"dictSort\":1,\"dictType\":\"blog_tool_type\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:42:42', 7);
INSERT INTO `sys_oper_log` VALUES (146, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"设计\",\"dictSort\":2,\"dictType\":\"blog_tool_type\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:42:52', 15);
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"生活\",\"dictSort\":3,\"dictType\":\"blog_tool_type\",\"dictValue\":\"3\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:43:06', 16);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"娱乐\",\"dictSort\":4,\"dictType\":\"blog_tool_type\",\"dictValue\":\"4\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:43:15', 15);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"toolbox\",\"className\":\"MyzToolbox\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"唯一ID\",\"columnId\":97,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 14:18:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ToolName\",\"columnComment\":\"工具名称\",\"columnId\":98,\"columnName\":\"tool_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 14:18:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"toolName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"工具描述\",\"columnId\":99,\"columnName\":\"description\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 14:18:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImageUrl\",\"columnComment\":\"工具图片\",\"columnId\":100,\"columnName\":\"image_url\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-13 14:18:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 14:59:57', 32);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"myz_toolbox\"}', NULL, 0, NULL, '2024-08-13 15:00:00', 190);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"toolCabinet\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工具管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"adminBlog/toolCabinet/index\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 15:07:49', 35);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"adminBlog/toolCabinet/index\",\"createTime\":\"2024-08-13 15:07:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"工具管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1061,\"path\":\"toolCabinet\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 15:08:03', 18);
INSERT INTO `sys_oper_log` VALUES (153, '工具管理', 1, 'com.ruoyi.web.controller.blog.MyzToolboxController.add()', 'POST', 1, 'admin', '研发部门', '/blog/toolbox', '127.0.0.1', '内网IP', '{\"description\":\"element\",\"id\":1,\"imageUrl\":\"/profile/upload/2024/08/13/adminAvatar_20240813151407A001.jpg\",\"linkUrl\":\"https://element.eleme.cn/#/zh-CN\",\"orderIndex\":1,\"params\":{},\"toolName\":\"element\",\"type\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 15:14:39', 10);
INSERT INTO `sys_oper_log` VALUES (154, '工具管理', 1, 'com.ruoyi.web.controller.blog.MyzToolboxController.add()', 'POST', 1, 'admin', '研发部门', '/blog/toolbox', '127.0.0.1', '内网IP', '{\"description\":\"花瓣网\",\"id\":2,\"imageUrl\":\"/profile/upload/2024/08/13/微信图片_20240804183502_20240813170135A002.png\",\"linkUrl\":\"https://huaban.com/?ref=16map.com\",\"orderIndex\":0,\"params\":{},\"toolName\":\"花瓣网\",\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 17:02:35', 8);
INSERT INTO `sys_oper_log` VALUES (155, '工具管理', 1, 'com.ruoyi.web.controller.blog.MyzToolboxController.add()', 'POST', 1, 'admin', '研发部门', '/blog/toolbox', '127.0.0.1', '内网IP', '{\"description\":\"木有枝\",\"id\":3,\"imageUrl\":\"/profile/upload/2024/08/13/logoQQ_20240813171100A003.png\",\"linkUrl\":\"https://kimi.moonshot.cn/chat/cqtcf3ddl8mtk53qfm5g\",\"orderIndex\":0,\"params\":{},\"toolName\":\"木有枝\",\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 17:11:23', 15);
INSERT INTO `sys_oper_log` VALUES (156, '工具管理', 1, 'com.ruoyi.web.controller.blog.MyzToolboxController.add()', 'POST', 1, 'admin', '研发部门', '/blog/toolbox', '127.0.0.1', '内网IP', '{\"description\":\"iconfont\",\"id\":4,\"imageUrl\":\"/profile/upload/2024/08/13/398b2043dec3a311635c74bc214f2af0_20240813171903A004.jpeg\",\"linkUrl\":\"https://16map.com/sites/1267.html\",\"orderIndex\":0,\"params\":{},\"toolName\":\"iconfont\",\"type\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 17:19:43', 14);
INSERT INTO `sys_oper_log` VALUES (157, '工具管理', 1, 'com.ruoyi.web.controller.blog.MyzToolboxController.add()', 'POST', 1, 'admin', '研发部门', '/blog/toolbox', '127.0.0.1', '内网IP', '{\"description\":\"wallhaven\",\"id\":5,\"imageUrl\":\"/profile/upload/2024/08/13/微信图片_20240804183333_20240813171957A005.png\",\"linkUrl\":\"https://wallhaven.cc/?ref=16map.com\",\"orderIndex\":0,\"params\":{},\"toolName\":\"wallhaven\",\"type\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-13 17:20:32', 3);
INSERT INTO `sys_oper_log` VALUES (158, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":0,\"articleType\":2,\"commentId\":152,\"content\":\"留言\",\"params\":{},\"status\":\"2\",\"userEmail\":\"dasda@qq.com\",\"userName\":\"硕士生\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"articleId\":0,\"articleType\":2,\"commentId\":152,\"content\":\"留言\",\"params\":{},\"status\":\"2\",\"userEmail\":\"dasda@qq.com\",\"userName\":\"硕士生\"}}', 0, NULL, '2024-08-22 13:38:40', 19);
INSERT INTO `sys_oper_log` VALUES (159, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":0,\"articleType\":0,\"commentId\":153,\"content\":\"cccfc\",\"params\":{},\"status\":\"2\",\"userEmail\":\"1231eqw@qw.gdfs\",\"userName\":\"eqweqw\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"articleId\":0,\"articleType\":0,\"commentId\":153,\"content\":\"cccfc\",\"params\":{},\"status\":\"2\",\"userEmail\":\"1231eqw@qw.gdfs\",\"userName\":\"eqweqw\"}}', 0, NULL, '2024-08-22 13:40:02', 15);
INSERT INTO `sys_oper_log` VALUES (160, '文章评论', 1, 'com.ruoyi.web.controller.blog.MyzCommentsController.add()', 'POST', 1, 'admin', '研发部门', '/blog/comments', '127.0.0.1', '内网IP', '{\"articleId\":0,\"articleType\":0,\"commentId\":154,\"content\":\"434234234\",\"params\":{},\"parentCommentId\":152,\"status\":\"2\",\"userEmail\":\"1231eqw@qw.gdfs\",\"userName\":\"eqweqw\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"articleId\":0,\"articleType\":0,\"commentId\":154,\"content\":\"434234234\",\"params\":{},\"parentCommentId\":152,\"status\":\"2\",\"userEmail\":\"1231eqw@qw.gdfs\",\"userName\":\"eqweqw\"}}', 0, NULL, '2024-08-22 13:41:02', 17);
INSERT INTO `sys_oper_log` VALUES (161, '学习目标', 2, 'com.ruoyi.web.controller.blog.MyzGoalController.edit()', 'PUT', 1, 'admin', '研发部门', '/blog/goal', '127.0.0.1', '内网IP', '{\"createdAt\":\"2024-08-13\",\"description\":\"CCC\",\"goalName\":\"AA\",\"goalTag\":2,\"goalType\":2,\"id\":2,\"imageUrl\":\"/profile/upload/2024/08/13/284543_20240813132441A003.png\",\"orderIndex\":2,\"params\":{},\"precondition\":\"EEE\",\"status\":3,\"websiteUrl\":\"http://localhost/allArticle\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-08-22 14:04:18', 11);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-07-02 22:17:10', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-07-02 22:17:10', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-07-02 22:17:10', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (3, '游客', 'visitor', 2, '1', 1, 1, '0', '0', 'admin', '2024-08-09 19:35:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-08-22 15:20:32', 'admin', '2024-07-02 22:17:10', '', '2024-08-22 15:20:31', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-07-02 22:17:10', 'admin', '2024-07-02 22:17:10', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, NULL, 'user', 'user', '00', '', '', '0', '', '$2a$10$fXycqttOn52DX2BiyTd./eymeonMOCWBeCZBWI8028vW0WTaoEMNy', '0', '0', '127.0.0.1', '2024-08-09 21:09:28', 'admin', '2024-08-09 19:33:51', '', '2024-08-09 21:09:28', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
