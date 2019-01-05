/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : localhost:3306
 Source Schema         : oa

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 05/01/2019 22:06:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `class_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级备注',
  `teacher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班主任id',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '班级所属专业id',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '班级所属院系id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `majorId`(`major_id`) USING BTREE,
  INDEX `deptId`(`dept_id`) USING BTREE,
  INDEX `teacherId`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `course_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `credit` double(2, 0) NOT NULL COMMENT '学分',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程描述',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '课程所属专业',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '课程所属院系',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `majorId`(`major_id`) USING BTREE,
  INDEX `deptId`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '院系id',
  `department_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系名称',
  `department_admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系负责人',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人联系方式',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (14, '电子信息部门', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (15, '通用航空部门', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (16, '建筑部门', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (17, '信息部门16', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (18, '信息部门17', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (19, '信息部门18', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (20, '部门19', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (21, '部门20', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (22, '部门21', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (23, '部门22', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (24, '部门23', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (26, '部门25', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (27, '部门26', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (28, '部门27', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (29, '部门28', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (30, '部门29', '张1', '10001', '备注1');
INSERT INTO `t_department` VALUES (32, '财务部门', '李四', '100100', '这是备注');
INSERT INTO `t_department` VALUES (33, '人力资源部', '王五', '19919', '这是备注');
INSERT INTO `t_department` VALUES (37, '采购部', '关羽', '199191', '备注这是');
INSERT INTO `t_department` VALUES (39, '后勤部', '张飞', '10010101', '');
INSERT INTO `t_department` VALUES (40, '腐败部门', '秦桧', '1919191', '~~');
INSERT INTO `t_department` VALUES (41, '岛国片研究部门', '波多空', '1911918', '222');
INSERT INTO `t_department` VALUES (42, '太白金星', '111', '111', '111');
INSERT INTO `t_department` VALUES (43, '反阶级固化专项部门', '廉颇', '12121', '0101010101');
INSERT INTO `t_department` VALUES (44, '1111', '2222', '3333', '4444');
INSERT INTO `t_department` VALUES (45, '88888888', '888888', '888888', '888888');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group`  (
  `id` int(11) NOT NULL COMMENT '小组编号',
  `group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小组名称',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '小组进行的项目',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '小组所属课程id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '小组所属班级id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `taskId`(`task_id`) USING BTREE,
  INDEX `coueseId`(`course_id`) USING BTREE,
  INDEX `classId`(`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_group_student
-- ----------------------------
DROP TABLE IF EXISTS `t_group_student`;
CREATE TABLE `t_group_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NULL DEFAULT NULL COMMENT '小组编号',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程编号',
  `student_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生编号',
  `group_leader` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_major
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `major_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名称',
  `remark` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业备注',
  `dept_id` int(10) NULL DEFAULT NULL COMMENT '院系id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `deptId`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_major
-- ----------------------------
INSERT INTO `t_major` VALUES (1, '软件技术专业', '备注1', 14);
INSERT INTO `t_major` VALUES (2, '云计算专业', '备注2', 14);
INSERT INTO `t_major` VALUES (3, '网络技术专业', '备注3', 14);
INSERT INTO `t_major` VALUES (4, '开飞机专业', '备注4 ', 15);
INSERT INTO `t_major` VALUES (5, '造飞机专业', '备注5', 15);
INSERT INTO `t_major` VALUES (6, '修飞机专业', '备注6', 15);
INSERT INTO `t_major` VALUES (7, '盖房子专业', '备注7', 16);
INSERT INTO `t_major` VALUES (8, '拆房子专业', '备注8', 16);
INSERT INTO `t_major` VALUES (9, '修房子专业', '备注9', 16);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `pid` int(11) NULL DEFAULT NULL COMMENT '该菜单对应的父菜单,0代表根结点,-1代表这个链接是按钮, 其他数字代表这个链接是子结点',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单对应的url',
  `type` enum('导航栏','菜单','按钮') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型. pid有-1之后,这个字段可有可无',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单对应的图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '系统菜单', 0, '#', '导航栏', NULL, NULL);
INSERT INTO `t_permission` VALUES (3, '部门管理', 1, '#', '导航栏', 'layui-icon-console', NULL);
INSERT INTO `t_permission` VALUES (4, '专业管理', 1, '#', '导航栏', 'layui-icon-senior', NULL);
INSERT INTO `t_permission` VALUES (5, '课程管理', 1, '#', '导航栏', 'layui-icon-theme', NULL);
INSERT INTO `t_permission` VALUES (6, '学生管理', 1, '#', '导航栏', 'layui-icon-website', NULL);
INSERT INTO `t_permission` VALUES (7, '教师管理', 1, '#', '导航栏', 'layui-icon-diamond', NULL);
INSERT INTO `t_permission` VALUES (8, '管理员管理', 1, '#', '导航栏', 'layui-icon-fire', NULL);
INSERT INTO `t_permission` VALUES (12, '部门列表', 3, '/dept', '导航栏', '', NULL);
INSERT INTO `t_permission` VALUES (13, '部门数据分页', -1, '/deptPaging', '按钮', NULL, NULL);
INSERT INTO `t_permission` VALUES (14, '专业列表', 4, '/major', '导航栏', NULL, NULL);
INSERT INTO `t_permission` VALUES (15, '任务管理', 1, '#', NULL, 'layui-icon-read', '即作业管理');
INSERT INTO `t_permission` VALUES (16, '作业列表', 15, '/task', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL,
  `role_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员');
INSERT INTO `t_role` VALUES (2, '教师');
INSERT INTO `t_role` VALUES (3, '学生组长');
INSERT INTO `t_role` VALUES (4, '普通学生');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (34, 2, 1);
INSERT INTO `t_role_permission` VALUES (35, 2, 15);
INSERT INTO `t_role_permission` VALUES (36, 2, 16);
INSERT INTO `t_role_permission` VALUES (37, 1, 1);
INSERT INTO `t_role_permission` VALUES (38, 1, 3);
INSERT INTO `t_role_permission` VALUES (39, 1, 4);
INSERT INTO `t_role_permission` VALUES (40, 1, 5);
INSERT INTO `t_role_permission` VALUES (41, 1, 6);
INSERT INTO `t_role_permission` VALUES (42, 1, 7);
INSERT INTO `t_role_permission` VALUES (43, 1, 8);
INSERT INTO `t_role_permission` VALUES (44, 1, 12);
INSERT INTO `t_role_permission` VALUES (45, 1, 13);
INSERT INTO `t_role_permission` VALUES (46, 1, 14);

-- ----------------------------
-- Table structure for t_student_course
-- ----------------------------
DROP TABLE IF EXISTS `t_student_course`;
CREATE TABLE `t_student_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NULL DEFAULT NULL,
  `student_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` tinyint(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courseId`(`course_id`) USING BTREE,
  INDEX `studentId`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学习任务id',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `type` enum('小组任务','全员任务') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学习任务类型',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '作业截止时间',
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件路径',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `teacher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布学习任务的教师的id',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacherId`(`teacher_id`) USING BTREE,
  INDEX `classId`(`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_task_class
-- ----------------------------
DROP TABLE IF EXISTS `t_task_class`;
CREATE TABLE `t_task_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NULL DEFAULT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_task_group
-- ----------------------------
DROP TABLE IF EXISTS `t_task_group`;
CREATE TABLE `t_task_group`  (
  `id` int(11) NOT NULL,
  `task_id` int(11) NULL DEFAULT NULL,
  `group_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_task_student
-- ----------------------------
DROP TABLE IF EXISTS `t_task_student`;
CREATE TABLE `t_task_student`  (
  `id` int(11) NOT NULL,
  `task_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher_class`;
CREATE TABLE `t_teacher_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacherId`(`teacher_id`) USING BTREE,
  INDEX `classId`(`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号/工号/学号',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男' COMMENT '性别',
  `telephone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `hiredate` date NULL DEFAULT NULL COMMENT '入职时间',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `idcard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '123', 'abc', '张三', '男', '10086', '888@qq.com', '12306', '2018-12-28', '2018-12-19', '111111111111111111', '这是管理员', NULL);
INSERT INTO `t_user` VALUES (2, 'teacher', '123', 'def', '李四', '女', '10010', '666@qq.com', '12121', '2018-12-14', '2018-12-03', '222222222222222222', '这是教师', NULL);
INSERT INTO `t_user` VALUES (3, 'student', '123', 'qwer', '王五', '男', '10000', '999@qq.com', '88888', '2019-01-05', '2019-01-02', '33333333', '这是普通学生', NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, 1);
INSERT INTO `t_user_role` VALUES (2, 2, 2);
INSERT INTO `t_user_role` VALUES (3, 3, 4);

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父亲姓名',
  `m_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '母亲姓名',
  `home_telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭联系电话',
  `household_type` enum('城市','农村') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '城市' COMMENT '户口性质',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'Tom', 'Anne', '110', '城市', NULL, NULL, '3');

-- ----------------------------
-- Table structure for t_usert
-- ----------------------------
DROP TABLE IF EXISTS `t_usert`;
CREATE TABLE `t_usert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `almamater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '母校',
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主修专业',
  `highest_education` enum('小学','初中','高中','专科','本科','硕士','博士') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_usert
-- ----------------------------
INSERT INTO `t_usert` VALUES (1, '清华大学', '哲学系', '博士', '2');

SET FOREIGN_KEY_CHECKS = 1;
