/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80041 (8.0.41)
 Source Host           : localhost:3306
 Source Schema         : free-fs

 Target Server Type    : MySQL
 Target Server Version : 80041 (8.0.41)
 File Encoding         : 65001

 Date: 15/05/2026 02:09:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for file_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `file_audit_log`;
CREATE TABLE `file_audit_log`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志ID',
  `operation_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型',
  `object_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '对象类型',
  `object_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作对象ID',
  `object_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作对象名称',
  `operator_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户ID(兼容前端)',
  `operator_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者名称',
  `workspace_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属工作空间ID',
  `operation_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'IP地址(兼容前端)',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '操作详情（JSON格式）',
  `old_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '旧名称(重命名操作)',
  `new_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新名称(重命名操作)',
  `old_parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '旧父目录ID(移动操作)',
  `new_parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新父目录ID(移动操作)',
  `result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作结果',
  `error_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_operation_type`(`operation_type` ASC) USING BTREE,
  INDEX `idx_object_id`(`object_id` ASC) USING BTREE,
  INDEX `idx_operator_id`(`operator_id` ASC) USING BTREE,
  INDEX `idx_operation_time`(`operation_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_audit_log
-- ----------------------------
INSERT INTO `file_audit_log` VALUES ('1324a1fca1414372aad1a20acd61d2f9', 'DELETE', 'file', 'bd5736a299234c558e661cb6b58905d5', 'WIN_20251119_15_05_24_Pro.jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:31:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('243a5db66ddc4acbaab8418bb0074575', 'DELETE', 'file', '90bc103b87e04b22afdac179bfad3f8a', 'WIN_20251119_15_05_24_Pro(2).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:50:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('2c708576307b4cc299f66df801707dc6', 'RENAME', 'file', '188c6b71ae8c48ef8fa9210a72d8ba37', '道滘镇施工现场.jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 02:11:15', NULL, NULL, '{\"oldName\":\"道滘镇施工现场1.jpg\",\"newName\":\"道滘镇施工现场.jpg\"}', '道滘镇施工现场1.jpg', '道滘镇施工现场.jpg', NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('5217c97c732b4107b661e30c27ca407f', 'UPLOAD', 'file', '6054eea0a74d4c7da838a9dad2d78b63', 'WIN_20251119_15_05_24_Pro(1).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:31:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('69d167a0129f4ee485ea9a725522e4a5', 'UPLOAD', 'file', '55a700e37a304fecbfb7fd62c43ddeec', 'WIN_20251119_15_05_24_Pro(1).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:26:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('6f12bcbb99014457abd64516eaae2636', 'UPLOAD', 'file', '2624564dcfdc4d2bb06e7e3f91a66d07', 'WIN_20251119_15_05_24_Pro(3).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:48:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('8143b5ed8d744a538bc30bef88158525', 'UPLOAD', 'file', 'e7bec9d3fc2c49ac9ab891a71d2f9a01', 'phone(1).png', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-15 01:52:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('98ef3e117f7248c3ac0e5c5af1b30c39', 'DELETE', 'file', '55a700e37a304fecbfb7fd62c43ddeec', 'WIN_20251119_15_05_24_Pro(1).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:26:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('9b64b3b2a28c4faca05f2b7a423e0e1f', 'RENAME', 'file', '9cd007c17fb94765b3cd630592d8a6e0', '杂项文件.docx', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 03:04:12', NULL, NULL, '{\"oldName\":\"杂文件.docx\",\"newName\":\"杂项文件.docx\"}', '杂文件.docx', '杂项文件.docx', NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('9e5dab9fc77b40e39e33ed3e9888317d', 'RENAME', 'file', '9cd007c17fb94765b3cd630592d8a6e0', '杂文件.docx', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 03:01:34', NULL, NULL, '{\"oldName\":\"杂.docx\",\"newName\":\"杂文件.docx\"}', '杂.docx', '杂文件.docx', NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('a51afb46-4ef8-11f1-b5e2-00ff8dcc9a00', 'RENAME', 'file', 'test-file-id', '测试文件.txt', '1', NULL, NULL, NULL, '2026-05-14 02:22:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('a841ee9609a9453c84025b5b674e963e', 'UPLOAD', 'file', '90bc103b87e04b22afdac179bfad3f8a', 'WIN_20251119_15_05_24_Pro(2).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:34:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('cfa19977328342a5a05e80ecc97154ee', 'RENAME', 'file', '9cd007c17fb94765b3cd630592d8a6e0', '杂.docx', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 02:54:07', NULL, NULL, '{\"oldName\":\"杂项文档.docx\",\"newName\":\"杂.docx\"}', '杂项文档.docx', '杂.docx', NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('d924cf25e48f43998f1ddf2181cc4109', 'DELETE', 'file', '2624564dcfdc4d2bb06e7e3f91a66d07', 'WIN_20251119_15_05_24_Pro(3).jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 23:50:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'success', NULL);
INSERT INTO `file_audit_log` VALUES ('e9e82e95bd914c33881a706a83d746fb', 'RENAME', 'file', '188c6b71ae8c48ef8fa9210a72d8ba37', '道滘镇施工现场1.jpg', '01jrvgs943q0f43h0aa5mjde0y', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-05-14 02:31:09', NULL, NULL, '{\"oldName\":\"道滘镇施工现场.jpg\",\"newName\":\"道滘镇施工现场1.jpg\"}', '道滘镇施工现场.jpg', '道滘镇施工现场1.jpg', NULL, NULL, 'success', NULL);

-- ----------------------------
-- Table structure for file_info
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `object_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `original_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源原始名称',
  `display_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '资源别名',
  `suffix` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后缀名',
  `size` bigint NULL DEFAULT NULL COMMENT '大小',
  `mime_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储标准MIME类型',
  `is_dir` tinyint(1) NOT NULL COMMENT '是否目录',
  `parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父节点ID',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属工作空间ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `content_md5` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用于秒传和文件校验',
  `storage_platform_setting_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储平台标识符',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT '最后访问时间',
  `is_deleted` tinyint(1) NULL DEFAULT NULL COMMENT '软删除标记，回收站标识0：未删除 1：已删除',
  `deleted_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_workspace_query`(`workspace_id` ASC, `user_id` ASC, `is_deleted` ASC, `parent_id` ASC) USING BTREE,
  INDEX `idx_workspace_id`(`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_info
-- ----------------------------
INSERT INTO `file_info` VALUES ('0652a4d4ab59470f9af24a3ca2239064', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/fbf7e5d7dc7f4775bcb716fa580607ef.txt', '开题报告大纲-基于Vue3+MinIO的企业级文件管理系统.txt', '开题报告大纲-基于Vue3+MinIO的企业级文件管理系统.txt', 'txt', 7352, 'text/plain', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '1456568415e5312bd1283aea111165e1', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:40:58', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('06c6d39e04aa4e9a8a0dcedce59bfede', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/5148652b9fcd475aad8ab54e109d5514.png', '1.png', '1.png', 'png', 62769, 'image/png', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '612995719b4fc55ced0f5dcf80fdefbe', NULL, '2026-04-24 17:33:54', '2026-04-24 17:33:54', '2026-04-24 17:33:56', 0, NULL);
INSERT INTO `file_info` VALUES ('188c6b71ae8c48ef8fa9210a72d8ba37', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/d9fb1e018e1845d6841963f819fcb6c5.jpg', '2(2).jpg', '道滘镇施工现场1.jpg', 'jpg', 1028463, 'image/jpeg', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '799f72403586d7157ce33194be9e0ec3', '7f4cd25e336f4161be8dc74016f60991', '2026-05-14 00:57:33', '2026-05-14 02:31:09', '2026-05-15 01:32:17', 0, NULL);
INSERT INTO `file_info` VALUES ('1f60af3b6a674df8b3ef711318682a78', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ef6d48ecf65a4973a7ebf6c3a17434a2.psd', '微信图片_20241126225943.psd', '微信图片_20241126225943.psd', 'psd', 17712612, 'application/octet-stream', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', 'f455dc411df15f2945f4c6a8138339c6', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('215e08b1d4d348d3a15035459b92e015', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260513/fbae703ac70b43ed962fef577b7663a7.mp4', 'PUBG：绝地求生  2024-06-09 12-55-00.mp4', 'PUBG：绝地求生  2024-06-09 12-55-00.mp4', 'mp4', 556017981, 'video/mp4', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '23f0374f06f905acd64b80ef1d8edb11', '7f4cd25e336f4161be8dc74016f60991', '2026-05-13 13:22:25', '2026-05-13 13:22:25', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('261c8217dc7a4f449a5f0b138be31564', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/50e3a42c508a4080b2ac0b2a66fb2132.pptx', '开题报告答辩PPT.pptx', '开题报告答辩PPT.pptx', 'pptx', 52450, 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', 'd8e943869a95d3b7bf45e281e1c1b339', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:40:59', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('2624564dcfdc4d2bb06e7e3f91a66d07', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/408f5307970a4df78a75fab6c268a570.jpg', 'WIN_20251119_15_05_24_Pro(3).jpg', 'WIN_20251119_15_05_24_Pro(3).jpg', 'jpg', 144019, 'image/jpeg', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '84607c9c09a4df6ffb9708a83d87bec6', '7f4cd25e336f4161be8dc74016f60991', '2026-05-14 23:48:14', '2026-05-14 23:48:14', NULL, 1, '2026-05-14 23:50:40');
INSERT INTO `file_info` VALUES ('441e9421a0574ac58c300a13966397e7', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/7202b9883ceb422791a36b9aa932d1dd.png', '新1.png', '新1.png', 'png', 99568, 'image/png', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '6386e2cb99e76fc40829d13a5c75e35b', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:41:00', '2026-04-30 13:02:43', 0, NULL);
INSERT INTO `file_info` VALUES ('447c34c1dbb140c99f864517a55c4e2a', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/7d5abcaeebcf4efa81f966e346bfd98a.png', '2.png', '2(1).png', 'png', 145104, 'image/png', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '82ac7aa5400353ec9fe7cad46e4a2ab4', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:41:00', '2026-04-30 12:47:22', 0, NULL);
INSERT INTO `file_info` VALUES ('55a700e37a304fecbfb7fd62c43ddeec', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/408f5307970a4df78a75fab6c268a570.jpg', 'WIN_20251119_15_05_24_Pro(1).jpg', 'WIN_20251119_15_05_24_Pro(1).jpg', 'jpg', 144019, 'image/jpeg', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '84607c9c09a4df6ffb9708a83d87bec6', '7f4cd25e336f4161be8dc74016f60991', '2026-05-14 23:26:03', '2026-05-14 23:26:03', NULL, 1, '2026-05-14 23:26:17');
INSERT INTO `file_info` VALUES ('6054eea0a74d4c7da838a9dad2d78b63', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/408f5307970a4df78a75fab6c268a570.jpg', 'WIN_20251119_15_05_24_Pro(1).jpg', 'WIN_20251119_15_05_24_Pro(1).jpg', 'jpg', 144019, 'image/jpeg', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '84607c9c09a4df6ffb9708a83d87bec6', '7f4cd25e336f4161be8dc74016f60991', '2026-05-14 23:31:19', '2026-05-14 23:31:19', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('683d365712a54ff9a7affe67130af5b1', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/aad8886941d8464ab7a8bc7b69f81b73.docx', '2026毕业设计开题答辩记录.docx', '2026毕业设计开题答辩记录.docx', 'docx', 17680, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', 'fe7ce436eb73765df1d68d9ae8b047d1', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:41:01', '2026-05-14 23:21:30', 0, NULL);
INSERT INTO `file_info` VALUES ('763bd99a7624490ea26962cde2966c2c', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ce2a330741084cacb9044a03d723550b.jpg', '3.jpg', '3.jpg', 'jpg', 952271, 'image/jpeg', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '27208587ccc05f7683cfbb56486ab0cf', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', '2026-04-24 17:37:20', 0, NULL);
INSERT INTO `file_info` VALUES ('791656e7220645b6a3395c57498d6aef', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/9ec3a7b8afa6482b8e6da5518727255f.png', '1.png', '1(1).png', 'png', 62769, 'image/png', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '612995719b4fc55ced0f5dcf80fdefbe', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:41:01', '2026-05-14 02:08:40', 0, NULL);
INSERT INTO `file_info` VALUES ('8256738f88b64ae9be888557114ad117', NULL, '测试文档', '测试文档', NULL, NULL, NULL, 1, NULL, '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', NULL, '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:13', '2026-04-24 19:40:13', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('90bc103b87e04b22afdac179bfad3f8a', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/408f5307970a4df78a75fab6c268a570.jpg', 'WIN_20251119_15_05_24_Pro(2).jpg', 'WIN_20251119_15_05_24_Pro(2).jpg', 'jpg', 144019, 'image/jpeg', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '84607c9c09a4df6ffb9708a83d87bec6', '7f4cd25e336f4161be8dc74016f60991', '2026-05-14 23:34:31', '2026-05-14 23:34:31', NULL, 1, '2026-05-14 23:50:37');
INSERT INTO `file_info` VALUES ('95ddbee9e36b4cad9e1ee0c4c64ef75a', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/d1010e7b10c9436193780c39b6f64f4b.xml', 'tempfile_1774777085382.xml', 'tempfile_1774777085382.xml', 'xml', 3938, 'text/xml', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '5066128f9b55cb323cd45db315e88489', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:41:02', '2026-05-08 14:38:50', 0, NULL);
INSERT INTO `file_info` VALUES ('9613705ced834eca80e6f406e9dc04c4', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/7a661466bf4d435cbbef85f08a06d437.jpg', '5(1).jpg', '5(1).jpg', 'jpg', 965570, 'image/jpeg', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', 'f0adedaaca6301504497f9699a2dea4a', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('9cd007c17fb94765b3cd630592d8a6e0', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/44d8dd63158348e5974dbd667143184f.docx', '杂.docx', '杂项文件.docx', 'docx', 176913, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '4cbcc47aa8370bf596a6b414a363e008', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-05-14 03:04:12', '2026-05-15 01:31:57', 0, NULL);
INSERT INTO `file_info` VALUES ('9fe791e8fc994cccb4ebfbf1e14c58af', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/e3bce871bcfe45cab4d03b742bd33c62.doc', '陈顺康 基于Vue3+MinIO的企业级文件管理系统设计与实现 开题报告 .doc', '陈顺康 基于Vue3+MinIO的企业级文件管理系统设计与实现 开题报告 .doc', 'doc', 154624, 'application/msword', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '5fa5f41b1555c8c844b8717e35d8654b', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 19:40:42', '2026-04-24 19:40:57', '2026-05-14 23:30:10', 0, NULL);
INSERT INTO `file_info` VALUES ('aca172028ea04fd1a98bd9e8a9b5872a', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260507/5bb6b478d18b493ebe2a59b171a5af43.mp4', 'PUBG：绝地求生  2024-06-09 13-03-02.mp4', 'PUBG：绝地求生  2024-06-09 13-03-02.mp4', 'mp4', 938756632, 'video/mp4', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '668c06d3d0a1ee45527fe9fa40202856', '7f4cd25e336f4161be8dc74016f60991', '2026-05-07 16:29:36', '2026-05-07 16:29:36', '2026-05-07 16:29:44', 0, NULL);
INSERT INTO `file_info` VALUES ('b3c9896745bf4419beee112d0b2ba46a', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/a1851b4affc44715ae8f1793701804b7.mp4', 'PUBG：绝地求生  2024-06-09 12-55-00.mp4', 'PUBG：绝地求生  2024-06-09 12-55-00.mp4', 'mp4', 556017981, 'video/mp4', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '23f0374f06f905acd64b80ef1d8edb11', NULL, '2026-04-24 17:34:31', '2026-04-24 17:34:31', '2026-04-24 17:43:48', 0, NULL);
INSERT INTO `file_info` VALUES ('bd5736a299234c558e661cb6b58905d5', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/408f5307970a4df78a75fab6c268a570.jpg', 'WIN_20251119_15_05_24_Pro.jpg', 'WIN_20251119_15_05_24_Pro.jpg', 'jpg', 144019, 'image/jpeg', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '84607c9c09a4df6ffb9708a83d87bec6', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 18:28:52', '2026-04-24 19:40:16', '2026-05-14 01:00:56', 1, '2026-05-14 23:31:52');
INSERT INTO `file_info` VALUES ('cff191cdbace4d91ae713e98cc78f603', NULL, '测试文件', '测试文件', NULL, NULL, NULL, 1, NULL, '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', NULL, NULL, '2026-04-24 17:33:46', '2026-04-24 17:33:46', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('d0d4aa2bdc5043a8a0a23a39077b0c16', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/9800686724f74d87a6a7622b7b6e4382.png', '微信图片_20241126225943.png', '微信图片_20241126225943.png', 'png', 3027393, 'image/png', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', 'b665f3bdfa0328e6cbfa06bcebe9672c', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('dbc222c496f049b89ebe4830f85b5999', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/c1e6ec7f6f094b2398d6f4aec884b515.doc', 'M20260508-陈顺康 基于Vue3+MinIO的企业级文件管理系统设计与实现 开题报告 .doc', 'M20260508-陈顺康 基于Vue3+MinIO的企业级文件管理系统设计与实现 开题报告 .doc', 'doc', 154624, 'application/msword', 0, NULL, '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '3297bf9d8bfc0535ac85be30453ea2fd', '7f4cd25e336f4161be8dc74016f60991', '2026-05-14 00:43:19', '2026-05-14 00:43:19', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('e6c1b6df24644443ab021e8b50a36b70', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/b080cf92868d4cf082c94a1e6de59e10.jpg', '4(1).jpg', '4(1).jpg', 'jpg', 929599, 'image/jpeg', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '4223d96edefb7d30cb7754c14f8694f5', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('e7bec9d3fc2c49ac9ab891a71d2f9a01', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ad2e920a28b54b86ade70a5de056d034.png', 'phone(1).png', 'phone(1).png', 'png', 125393, 'image/png', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '1a2815b8ba868d23f30836b8ca1fe1a0', '7f4cd25e336f4161be8dc74016f60991', '2026-05-15 01:52:04', '2026-05-15 01:52:04', NULL, 0, NULL);
INSERT INTO `file_info` VALUES ('f4370d014d784fbaa7270c0ab178905a', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ad2e920a28b54b86ade70a5de056d034.png', 'phone.png', 'phone.png', 'png', 125393, 'image/png', 0, '8256738f88b64ae9be888557114ad117', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '1a2815b8ba868d23f30836b8ca1fe1a0', '7f4cd25e336f4161be8dc74016f60991', '2026-04-24 18:28:52', '2026-04-24 19:40:17', '2026-05-13 23:44:06', 0, NULL);
INSERT INTO `file_info` VALUES ('fd4b7b3823424c58b0887c9efec2bf1f', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/3dbb0848e715420fabf3fe39962817a1.jpg', '2(1).jpg', '2(1).jpg', 'jpg', 1028463, 'image/jpeg', 0, 'cff191cdbace4d91ae713e98cc78f603', '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', '799f72403586d7157ce33194be9e0ec3', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, 0, NULL);

-- ----------------------------
-- Table structure for file_permission
-- ----------------------------
DROP TABLE IF EXISTS `file_permission`;
CREATE TABLE `file_permission`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID',
  `object_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对象类型：folder-目录, file-文件',
  `object_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对象ID',
  `workspace_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属工作空间ID',
  `grantee_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '授权对象类型：user-用户, role-角色',
  `grantee_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '授权对象ID',
  `can_read` tinyint(1) NULL DEFAULT 0 COMMENT '读权限',
  `can_write` tinyint(1) NULL DEFAULT 0 COMMENT '写权限',
  `can_delete` tinyint(1) NULL DEFAULT 0 COMMENT '删除权限',
  `can_manage` tinyint(1) NULL DEFAULT 0 COMMENT '管理权限',
  `inherit_parent` tinyint(1) NULL DEFAULT 1 COMMENT '是否继承父目录权限',
  `priority` int NULL DEFAULT 0 COMMENT '权限优先级',
  `start_time` datetime NULL DEFAULT NULL COMMENT '权限生效开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '权限生效结束时间',
  `creator_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态：0-正常, 1-禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_object`(`object_type` ASC, `object_id` ASC) USING BTREE,
  INDEX `idx_grantee`(`grantee_type` ASC, `grantee_id` ASC) USING BTREE,
  INDEX `idx_workspace`(`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_permission
-- ----------------------------

-- ----------------------------
-- Table structure for file_share_access_record
-- ----------------------------
DROP TABLE IF EXISTS `file_share_access_record`;
CREATE TABLE `file_share_access_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `share_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享ID',
  `access_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问IP',
  `access_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `access_time` datetime NOT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享页面访问记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_share_access_record
-- ----------------------------

-- ----------------------------
-- Table structure for file_share_items
-- ----------------------------
DROP TABLE IF EXISTS `file_share_items`;
CREATE TABLE `file_share_items`  (
  `share_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享ID',
  `file_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件/文件夹ID',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`share_id`, `file_id` DESC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享文件关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_share_items
-- ----------------------------
INSERT INTO `file_share_items` VALUES ('01kpzdkmywk2q2v4ftksgs965e', '763bd99a7624490ea26962cde2966c2c', '2026-04-24 17:37:20');

-- ----------------------------
-- Table structure for file_shares
-- ----------------------------
DROP TABLE IF EXISTS `file_shares`;
CREATE TABLE `file_shares`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享人ID',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属工作空间ID',
  `share_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分享名称',
  `share_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提取码（可为空）',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间（null表示永久有效）',
  `scope` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限范围: preview,download  (逗号分隔)',
  `view_count` int NULL DEFAULT 0 COMMENT '查看次数统计',
  `max_view_count` int NULL DEFAULT NULL COMMENT '最大查看次数（NULL表示无限制）',
  `download_count` int NULL DEFAULT 0 COMMENT '下载次数统计',
  `max_download_count` int NULL DEFAULT NULL COMMENT '最大下载次数（NULL表示无限制）',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_workspace_id`(`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件分享表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_shares
-- ----------------------------
INSERT INTO `file_shares` VALUES ('01kpzdkmywk2q2v4ftksgs965e', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '3.jpg', NULL, '2026-05-01 17:37:20', 'preview', 0, NULL, 0, NULL, '2026-04-24 17:37:20', '2026-04-24 17:37:20');

-- ----------------------------
-- Table structure for file_transfer_task
-- ----------------------------
DROP TABLE IF EXISTS `file_transfer_task`;
CREATE TABLE `file_transfer_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务ID(UUID)',
  `upload_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上传唯一ID',
  `parent_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属工作空间ID',
  `storage_platform_setting_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储平台配置ID',
  `object_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '对象key',
  `file_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下载时关联的文件ID',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名',
  `file_size` bigint NOT NULL COMMENT '文件大小(字节)',
  `file_md5` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件MD5值',
  `suffix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件类型(扩展名)',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储标准MIME类型',
  `total_chunks` int NOT NULL COMMENT '总分片数',
  `task_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务类型',
  `uploaded_chunks` int NULL DEFAULT 0 COMMENT '已上传分片数',
  `chunk_size` bigint NULL DEFAULT 5242880 COMMENT '分片大小(默认5MB)',
  `uploaded_size` bigint NULL DEFAULT 0 COMMENT '已上传大小(字节)',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'uploading' COMMENT '状态',
  `error_msg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '错误信息',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `complete_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `replaced_file_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被替换的文件ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_task_id`(`task_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_file_md5`(`file_md5` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_create_time`(`created_at` ASC) USING BTREE,
  INDEX `idx_workspace_id`(`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 765 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '传输任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_transfer_task
-- ----------------------------
INSERT INTO `file_transfer_task` VALUES (732, '5f6d80f8120540c39158987c160eb565', '2f4d9fae0d1a44f38474a17eafcf9486', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/5148652b9fcd475aad8ab54e109d5514.png', NULL, '1.png', 62769, '612995719b4fc55ced0f5dcf80fdefbe', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 17:33:53', '2026-04-24 17:33:54', NULL, '2026-04-24 17:33:53', '2026-04-24 17:33:54');
INSERT INTO `file_transfer_task` VALUES (733, '81d21fb79d4a4d40b2a456594d6d3c5f', '5c2cccc344c1497eaef31b6ba29f2f15', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/a1851b4affc44715ae8f1793701804b7.mp4', NULL, 'PUBG：绝地求生  2024-06-09 12-55-00.mp4', 556017981, '23f0374f06f905acd64b80ef1d8edb11', 'mp4', 'video/mp4', 107, 'upload', 107, 5242880, 0, 'completed', NULL, '2026-04-24 17:34:26', '2026-04-24 17:34:31', NULL, '2026-04-24 17:34:26', '2026-04-24 17:34:31');
INSERT INTO `file_transfer_task` VALUES (734, '9d5f9cc8e9764fbd980f16e3d6b0b1c7', 'f1ec321a2a754a21bb13d2066beeb3b8', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ce2a330741084cacb9044a03d723550b.jpg', NULL, '3.jpg', 952271, '27208587ccc05f7683cfbb56486ab0cf', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55');
INSERT INTO `file_transfer_task` VALUES (735, 'b79f892d0b7c467abe2e6674adc4d59a', '939cabca3dbd4acd82f198b58feee179', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/9800686724f74d87a6a7622b7b6e4382.png', NULL, '微信图片_20241126225943.png', 3027393, 'b665f3bdfa0328e6cbfa06bcebe9672c', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55');
INSERT INTO `file_transfer_task` VALUES (736, '7023a82bdcc047ab848e88a747a6ce7d', '5934f76a8b7b4cc1947c6b8e778a0ae9', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/3dbb0848e715420fabf3fe39962817a1.jpg', NULL, '2(1).jpg', 1028463, '799f72403586d7157ce33194be9e0ec3', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55');
INSERT INTO `file_transfer_task` VALUES (737, 'ef62ab4b2e984455b38b1bd9a979d6ec', '52977864f66d4a6aa8a1ec9a032ca377', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/b080cf92868d4cf082c94a1e6de59e10.jpg', NULL, '4(1).jpg', 929599, '4223d96edefb7d30cb7754c14f8694f5', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55');
INSERT INTO `file_transfer_task` VALUES (738, 'f4d25c329ecc4841bfec3a7ed49c7c1c', '3d89fa34af1849dabfaf1d148e2a0bd2', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/7a661466bf4d435cbbef85f08a06d437.jpg', NULL, '5(1).jpg', 965570, 'f0adedaaca6301504497f9699a2dea4a', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55');
INSERT INTO `file_transfer_task` VALUES (739, '98f4e4291f4b40d1a6f1cb86e269c32b', '4380ada526e942a08b782b808e0a28ff', 'cff191cdbace4d91ae713e98cc78f603', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', NULL, 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ef6d48ecf65a4973a7ebf6c3a17434a2.psd', NULL, '微信图片_20241126225943.psd', 17712612, 'f455dc411df15f2945f4c6a8138339c6', 'psd', 'application/octet-stream', 4, 'upload', 4, 5242880, 0, 'completed', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55', NULL, '2026-04-24 17:35:55', '2026-04-24 17:35:55');
INSERT INTO `file_transfer_task` VALUES (740, '131df73f339d455e920284cf8e6a65df', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjgzZmRlYThjLTA1YTgtNDUwMC04NzFmLWI3YTFmOGY4YTViNngxNzc3MDI2NTMyMDAyNjE3OTAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/ad2e920a28b54b86ade70a5de056d034.png', NULL, 'phone.png', 125393, '1a2815b8ba868d23f30836b8ca1fe1a0', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 18:28:51', '2026-04-24 18:28:52', NULL, '2026-04-24 18:28:51', '2026-04-24 18:28:52');
INSERT INTO `file_transfer_task` VALUES (741, '15ff68d5f373480fb1817236a36b3bf0', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjgxYTYzNmI4LWQyZmEtNDkzMy05YTJmLTI2MTNkNDYyNWU5MXgxNzc3MDI2NTMyMDAyNjE3OTAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/408f5307970a4df78a75fab6c268a570.jpg', NULL, 'WIN_20251119_15_05_24_Pro.jpg', 144019, '84607c9c09a4df6ffb9708a83d87bec6', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 18:28:51', '2026-04-24 18:28:52', NULL, '2026-04-24 18:28:51', '2026-04-24 18:28:52');
INSERT INTO `file_transfer_task` VALUES (742, '9332b0e7f3114b379265a2a10e8750fc', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3Ljc5MGFhZTViLTY1ZjMtNDljYi1hN2FhLTdjZTZhMThjNWIyNHgxNzc3MDMwODQxOTAwMDAwMzAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/7d5abcaeebcf4efa81f966e346bfd98a.png', NULL, '2.png', 145104, '82ac7aa5400353ec9fe7cad46e4a2ab4', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (743, 'b12b9213673f47eda78fd31dcbc20593', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjI5Njk1MjMwLWJhZWEtNDlkZi05ZDkyLTkzMWZjNGU2NzllNHgxNzc3MDMwODQxOTAwMDAwMzAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/9ec3a7b8afa6482b8e6da5518727255f.png', NULL, '1.png', 62769, '612995719b4fc55ced0f5dcf80fdefbe', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (744, 'd2bf7de7943b489b9803b93fe4100f24', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LmQ0ZGQ2N2FlLTQ1NjgtNDQ2ZS1hNmYxLWQ5ODEyYjkwNjJhY3gxNzc3MDMwODQxOTAwMDAwMzAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/e3bce871bcfe45cab4d03b742bd33c62.doc', NULL, '陈顺康 基于Vue3+MinIO的企业级文件管理系统设计与实现 开题报告 .doc', 154624, '5fa5f41b1555c8c844b8717e35d8654b', 'doc', 'application/msword', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (745, 'aa6b241cfce44eb2803f3b2f1ad51734', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LmJjYzYyYTk0LThmNzUtNDk2OC04ZjlkLTY3Mjc0NDllZTk4Y3gxNzc3MDMwODQxOTAwMDAwMzAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/aad8886941d8464ab7a8bc7b69f81b73.docx', NULL, '2026毕业设计开题答辩记录.docx', 17680, 'fe7ce436eb73765df1d68d9ae8b047d1', 'docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (746, '95a39c37a9bf49a0b62c6ebd5a773a39', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjE3ZDc4MzhjLWVhNjAtNDQ2NC04MDQyLTlmNTE4N2ZiZjRhYXgxNzc3MDMwODQxOTAwMDAwMzAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/d1010e7b10c9436193780c39b6f64f4b.xml', NULL, 'tempfile_1774777085382.xml', 3938, '5066128f9b55cb323cd45db315e88489', 'xml', 'text/xml', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (747, '15bc965cc9534fab815878c3afcb4604', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LmU3YzgxMWFiLTBkNDktNDUyZi1hMGQ0LTA5MzE1ZWU3YmFlYXgxNzc3MDMwODQxOTk0OTUxODAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/50e3a42c508a4080b2ac0b2a66fb2132.pptx', NULL, '开题报告答辩PPT.pptx', 52450, 'd8e943869a95d3b7bf45e281e1c1b339', 'pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (748, '7aa8cb7e48fb4dd6b255c97f2e46e671', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LmU2MjRjNWM3LTY5ODItNDA3Zi05NzEwLWZhOGUyMTY5NTdlMXgxNzc3MDMwODQxOTk4MzE5MjAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/44d8dd63158348e5974dbd667143184f.docx', NULL, '杂.docx', 176913, '4cbcc47aa8370bf596a6b414a363e008', 'docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (749, '777fbfd9366e4303a3a12246d183433f', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjM2ZDU1NGJhLTkwMzYtNDZmZi1iMWM5LWU1Zjk2YjVjOWU3ZHgxNzc3MDMwODQxOTk4MzE5MjAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/7202b9883ceb422791a36b9aa932d1dd.png', NULL, '新1.png', 99568, '6386e2cb99e76fc40829d13a5c75e35b', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (750, '226e3b82389b4f9f9bb3e94dee1cba2b', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjZjYmQzNzc0LWVlMjItNDE2MC04NTFlLWY4ZDAyNzFiM2RhYngxNzc3MDMwODQxOTk4MzE5MjAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'free-fs/01jrvgs943q0f43h0aa5mjde0y/20260424/fbf7e5d7dc7f4775bcb716fa580607ef.txt', NULL, '开题报告大纲-基于Vue3+MinIO的企业级文件管理系统.txt', 7352, '1456568415e5312bd1283aea111165e1', 'txt', 'text/plain', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42', NULL, '2026-04-24 19:40:42', '2026-04-24 19:40:42');
INSERT INTO `file_transfer_task` VALUES (751, '216864d5925d44279052da141c75b622', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260430/daf35b38016f43e490391a8bc638130a.png', NULL, '屏幕截图 2026-04-28 142118.png', 367396, NULL, 'png', 'image/png', 1, 'upload', 0, 5242880, 0, 'failed', '文件校验失败: S3初始化分片上传失败: The Access Key Id you provided does not exist in our records. (Service: S3, Status Code: 403, Request ID: 18AB0919FA4274CC, Extended Request ID: dd9025bab4ad464b049177c95eb6ebf374d3b3fd1af9251148b658df7ac2e3e8)', '2026-04-30 12:48:05', NULL, NULL, '2026-04-30 12:48:05', '2026-04-30 12:48:05');
INSERT INTO `file_transfer_task` VALUES (752, '3648e6d608f341019b476aa51d5d7302', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260430/32d00994e59c4b7dbfb8728bc6e5d663.jpg', NULL, '微信图片_20250108112438.jpg', 331135, NULL, 'jpg', 'image/jpeg', 1, 'upload', 0, 5242880, 0, 'failed', '文件校验失败: S3初始化分片上传失败: The Access Key Id you provided does not exist in our records. (Service: S3, Status Code: 403, Request ID: 18AB092DD08CE9F0, Extended Request ID: dd9025bab4ad464b049177c95eb6ebf374d3b3fd1af9251148b658df7ac2e3e8)', '2026-04-30 12:49:30', NULL, NULL, '2026-04-30 12:49:30', '2026-04-30 12:49:30');
INSERT INTO `file_transfer_task` VALUES (753, '4e74d244c7774398816d7b9e070c4a32', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260430/74ac0a6e6bad48f5bcb6591cae5ef533.jpg', NULL, '微信图片_20241230172433.jpg', 712535, NULL, 'jpg', 'image/jpeg', 1, 'upload', 0, 5242880, 0, 'failed', '文件校验失败: S3初始化分片上传失败: The Access Key Id you provided does not exist in our records. (Service: S3, Status Code: 403, Request ID: 18AB09E981E0FD0C, Extended Request ID: dd9025bab4ad464b049177c95eb6ebf374d3b3fd1af9251148b658df7ac2e3e8)', '2026-04-30 13:02:56', NULL, NULL, '2026-04-30 13:02:56', '2026-04-30 13:02:56');
INSERT INTO `file_transfer_task` VALUES (755, '4a5a9cf0656e40aa80df833884624f16', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LmUzNzQ3ZmQwLWUwOWUtNGFmMS04MjYyLTJjN2ZhZGIwYTc1NngxNzc4MTQyNTY2MDYyOTM0NjAw', '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260507/5bb6b478d18b493ebe2a59b171a5af43.mp4', NULL, 'PUBG：绝地求生  2024-06-09 13-03-02.mp4', 938756632, '668c06d3d0a1ee45527fe9fa40202856', 'mp4', 'video/mp4', 180, 'upload', 180, 5242880, 0, 'completed', NULL, '2026-05-07 16:29:26', '2026-05-07 16:29:36', NULL, '2026-05-07 16:29:26', '2026-05-07 16:29:36');
INSERT INTO `file_transfer_task` VALUES (756, '615a0b4828a344c69d20cd4032d6afdb', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjE0MDRmZmNiLTUyMWMtNDA2YS05ZTU3LTIxMWNiOTFjNGI1YXgxNzc4NjQ5NzM3NzkzNjMzODAw', '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260513/fbae703ac70b43ed962fef577b7663a7.mp4', NULL, 'PUBG：绝地求生  2024-06-09 12-55-00.mp4', 556017981, '23f0374f06f905acd64b80ef1d8edb11', 'mp4', 'video/mp4', 107, 'upload', 107, 5242880, 0, 'completed', NULL, '2026-05-13 13:22:17', '2026-05-13 13:22:25', NULL, '2026-05-13 13:22:17', '2026-05-13 13:22:25');
INSERT INTO `file_transfer_task` VALUES (757, '216979a745b2435a966630f36b2c02cd', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3LjNiZTUyODE5LTgxNmYtNDIxZS04MmFkLTQzZGQzNTBhN2ExM3gxNzc4NjkwNTk4NDczODMxNjAw', NULL, '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/c1e6ec7f6f094b2398d6f4aec884b515.doc', NULL, 'M20260508-陈顺康 基于Vue3+MinIO的企业级文件管理系统设计与实现 开题报告 .doc', 154624, '3297bf9d8bfc0535ac85be30453ea2fd', 'doc', 'application/msword', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-14 00:43:18', '2026-05-14 00:43:19', NULL, '2026-05-14 00:43:18', '2026-05-14 00:43:19');
INSERT INTO `file_transfer_task` VALUES (758, 'd7a9e4d54b354e978bc828550c69369f', 'YmQ5MmUxYWYtMWNmZC00NjhjLTlhMzMtZDlkNjczZTY3ZDk3Ljc1Yjc4YjI2LWFmOTMtNGJhMi1iZjQ5LWI4YzY2M2I0YmM3M3gxNzc4NjkxNDUzMTkzMDc4NzAw', '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/d9fb1e018e1845d6841963f819fcb6c5.jpg', NULL, '2(2).jpg', 1028463, '799f72403586d7157ce33194be9e0ec3', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-14 00:57:33', '2026-05-14 00:57:33', NULL, '2026-05-14 00:57:33', '2026-05-14 00:57:33');
INSERT INTO `file_transfer_task` VALUES (759, '3ccad9fe56794edfa68a59c83ebbbeb1', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/a03befbd618c4471a55816453170e8ee.jpg', NULL, 'WIN_20251119_15_05_24_Pro(1).jpg', 144019, '84607c9c09a4df6ffb9708a83d87bec6', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-14 23:26:02', '2026-05-14 23:26:03', NULL, '2026-05-14 23:26:02', '2026-05-14 23:26:03');
INSERT INTO `file_transfer_task` VALUES (760, '11141f9099da4976a08b9e51e162b061', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/79fd7ebcfc2c45edaa21b61a0652ca52.jpg', NULL, 'WIN_20251119_15_05_24_Pro(1).jpg', 144019, '84607c9c09a4df6ffb9708a83d87bec6', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-14 23:31:19', '2026-05-14 23:31:19', NULL, '2026-05-14 23:31:19', '2026-05-14 23:31:19');
INSERT INTO `file_transfer_task` VALUES (761, 'da3bcffbd1894a238e0d05f7b9adc1fb', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/f40a7d0688ab4ae1bf90e86db16aa2c1.jpg', NULL, 'WIN_20251119_15_05_24_Pro(2).jpg', 144019, '84607c9c09a4df6ffb9708a83d87bec6', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-14 23:34:30', '2026-05-14 23:34:31', NULL, '2026-05-14 23:34:30', '2026-05-14 23:34:31');
INSERT INTO `file_transfer_task` VALUES (762, '2beed18d88964c35a596018f11e4287c', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260514/3b4ab3d27c174984a7e9d51dbe71ecbb.jpg', NULL, 'WIN_20251119_15_05_24_Pro(3).jpg', 144019, '84607c9c09a4df6ffb9708a83d87bec6', 'jpg', 'image/jpeg', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-14 23:48:14', '2026-05-14 23:48:14', NULL, '2026-05-14 23:48:14', '2026-05-14 23:48:14');
INSERT INTO `file_transfer_task` VALUES (764, 'bcf3b0294ee34dd893a20e4e46cae5a2', NULL, '8256738f88b64ae9be888557114ad117', '01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '7f4cd25e336f4161be8dc74016f60991', 'Sk/01jrvgs943q0f43h0aa5mjde0y/20260515/c6bdb25ef01549f988754d2fcdfca14c.png', NULL, 'phone(1).png', 125393, '1a2815b8ba868d23f30836b8ca1fe1a0', 'png', 'image/png', 1, 'upload', 1, 5242880, 0, 'completed', NULL, '2026-05-15 01:52:04', '2026-05-15 01:52:04', NULL, '2026-05-15 01:52:04', '2026-05-15 01:52:04');

-- ----------------------------
-- Table structure for file_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `file_user_favorites`;
CREATE TABLE `file_user_favorites`  (
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属工作空间ID',
  `file_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件ID',
  `favorite_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`workspace_id`, `user_id`, `file_id`) USING BTREE,
  INDEX `idx_file_time`(`file_id` ASC, `favorite_time` DESC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_user_favorites
-- ----------------------------
INSERT INTO `file_user_favorites` VALUES ('01kpxd54g1s421n7bcg6bqqj85', '01kpq1bqzq1z99r0vd2xxqr3yk', '95ddbee9e36b4cad9e1ee0c4c64ef75a', '2026-05-08 14:38:49');
INSERT INTO `file_user_favorites` VALUES ('01jrvgs943q0f43h0aa5mjde0y', '01kpq1bqzq1z99r0vd2xxqr3yk', '9cd007c17fb94765b3cd630592d8a6e0', '2026-04-30 13:19:22');

-- ----------------------------
-- Table structure for file_version
-- ----------------------------
DROP TABLE IF EXISTS `file_version`;
CREATE TABLE `file_version`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '版本ID',
  `file_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联的文件ID',
  `version_number` int NOT NULL DEFAULT 1 COMMENT '版本号',
  `object_key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储的对象键',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件原始名称',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小（字节）',
  `content_md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件MD5值',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '版本备注',
  `creator_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_current` tinyint(1) NULL DEFAULT 0 COMMENT '是否为当前版本（0-否，1-是）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_file_id`(`file_id` ASC) USING BTREE,
  INDEX `idx_version_number`(`version_number` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件版本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_version
-- ----------------------------

-- ----------------------------
-- Table structure for storage_platform
-- ----------------------------
DROP TABLE IF EXISTS `storage_platform`;
CREATE TABLE `storage_platform`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '存储平台',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储平台名称',
  `identifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储平台标识符',
  `config_scheme` json NOT NULL COMMENT '存储平台配置描述schema',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储平台图标',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储平台链接',
  `is_default` tinyint NOT NULL DEFAULT 1 COMMENT '是否默认存储平台 0-否 1-是',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存储平台描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储平台' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storage_platform
-- ----------------------------
INSERT INTO `storage_platform` VALUES (31, 'Minio对象存储', 'Minio', '{}', 'icon-bendicunchu1', 'https://github.com/rustfs/rustfs', 0, 'RustFS 是一个基于 Rust 构建的高性能分布式对象存储系统。Rust 是全球最受开发者喜爱的编程语言之一，RustFS 完美结合了 MinIO 的简洁性与 Rust 的内存安全及高性能优势。它提供完整的 S3 兼容性，完全开源，并专为数据湖、人工智能（AI）和大数据负载进行了优化。');
INSERT INTO `storage_platform` VALUES (32, '阿里云OSS', 'AliyunOSS', '[{\"label\": \"Access-Key\", \"dataType\": \"string\", \"identifier\": \"accessKey\", \"validation\": {\"required\": true}}, {\"label\": \"Secret-key\", \"dataType\": \"string\", \"identifier\": \"secretKey\", \"validation\": {\"required\": true}}, {\"label\": \"服务器端点\", \"dataType\": \"string\", \"identifier\": \"endpoint\", \"validation\": {\"required\": true}}, {\"label\": \"存储桶名\", \"dataType\": \"string\", \"identifier\": \"bucket\", \"validation\": {\"required\": true}}, {\"label\": \"区域\", \"dataType\": \"string\", \"identifier\": \"region\", \"validation\": {\"required\": true}}]', 'icon-aliyun1', 'https://www.aliyun.com/product/oss', 0, '阿里云对象存储 OSS（Object Storage Service）是一款海量、安全、低成本、高可靠的云存储服务');
INSERT INTO `storage_platform` VALUES (33, '华为云OBS', 'Obs', '[{\"label\": \"Access-Key\", \"dataType\": \"string\", \"identifier\": \"accessKey\", \"validation\": {\"required\": true}}, {\"label\": \"Secret-key\", \"dataType\": \"string\", \"identifier\": \"secretKey\", \"validation\": {\"required\": true}}, {\"label\": \"服务器端点\", \"dataType\": \"string\", \"identifier\": \"endpoint\", \"validation\": {\"required\": true}}, {\"label\": \"存储桶名\", \"dataType\": \"string\", \"identifier\": \"bucket\", \"validation\": {\"required\": true}}]', 'icon-storage', 'https://support.huaweicloud.com/obs/index.html', 0, '对象存储服务（Object Storage Service，OBS）提供海量、安全、高可靠、低成本的数据存储能力，可供用户存储任意类型和大小的数据。适合企业备份/归档、视频点播、视频监控等多种数据存储场景。');
INSERT INTO `storage_platform` VALUES (34, 'RustFS对象存储', 'RustFS', '[{\"label\": \"Access-Key\", \"dataType\": \"string\", \"identifier\": \"accessKey\", \"validation\": {\"required\": true}}, {\"label\": \"Secret-key\", \"dataType\": \"string\", \"identifier\": \"secretKey\", \"validation\": {\"required\": true}}, {\"label\": \"服务器端点\", \"dataType\": \"string\", \"identifier\": \"endpoint\", \"validation\": {\"required\": true}}, {\"label\": \"存储桶名\", \"dataType\": \"string\", \"identifier\": \"bucket\", \"validation\": {\"required\": true}}]', 'icon-bendicunchu1', 'https://github.com/rustfs/rustfs', 0, 'RustFS 是一个基于 Rust 构建的高性能分布式对象存储系统。Rust 是全球最受开发者喜爱的编程语言之一，RustFS 完美结合了 MinIO 的简洁性与 Rust 的内存安全及高性能优势。它提供完整的 S3 兼容性，完全开源，并专为数据湖、人工智能（AI）和大数据负载进行了优化。');

-- ----------------------------
-- Table structure for storage_settings
-- ----------------------------
DROP TABLE IF EXISTS `storage_settings`;
CREATE TABLE `storage_settings`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id',
  `platform_identifier` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存储平台标识符',
  `config_data` json NOT NULL COMMENT '存储配置',
  `enabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用 0：否 1：是',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属工作空间ID',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除 0未删除 1已删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_workspace_id`(`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储平台配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storage_settings
-- ----------------------------
INSERT INTO `storage_settings` VALUES ('0906fd28277d475693190ad825b1ec45', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-08 15:32:45', '2026-05-08 15:32:45', '', 1);
INSERT INTO `storage_settings` VALUES ('184ba89a035e4af5a2f8e2f7eba8d12d', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-08 15:32:24', '2026-05-08 15:32:24', '', 1);
INSERT INTO `storage_settings` VALUES ('22fe716bb60e4434afa2d402af411e51', 'Minio', '{\"bucket\": \"free-fs-bucket\", \"endpoint\": \"http://127.0.0.1:9000\", \"accessKey\": \"minioadmin\", \"secretKey\": \"minioadmin\"}', 0, '01kpxd9zxfkbceyfxdkyypx6ps', '2026-04-24 17:28:36', '2026-04-24 17:28:36', '本地开发环境', 0);
INSERT INTO `storage_settings` VALUES ('42ba9edcfeba4fc9a0d25cd1b4710e79', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-08 15:32:56', '2026-05-08 15:32:56', '', 1);
INSERT INTO `storage_settings` VALUES ('4b477bb10a4746d3a1469a3d8c7e966f', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-08 15:23:11', '2026-05-08 15:23:11', '', 1);
INSERT INTO `storage_settings` VALUES ('774b751a351e411681a5b2cade443b70', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-08 15:22:40', '2026-05-08 15:22:40', '', 1);
INSERT INTO `storage_settings` VALUES ('7f4cd25e336f4161be8dc74016f60991', 'Minio', '{\"bucket\": \"free-fs-bucket\", \"endpoint\": \"http://127.0.0.1:9000\", \"accessKey\": \"admin\", \"secretKey\": \"csk582000\"}', 1, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-04-24 17:31:15', '2026-05-08 15:56:40', '本地开发环境', 0);
INSERT INTO `storage_settings` VALUES ('c16d8af8bcdb4552a5d0a5b5cb20e4b6', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-08 15:56:52', '2026-05-08 15:56:52', '', 1);
INSERT INTO `storage_settings` VALUES ('fce7a47de6be41f7af0caea6d4ac80c4', 'Minio', '{}', 0, '01kpq1bqzq1z99r0vd2xxqr3yk', '2026-05-13 23:44:38', '2026-05-13 23:44:38', '', 1);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录IP',
  `login_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地址',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作系统',
  `login_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录方式',
  `status` tinyint NOT NULL COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提示消息',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4636 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (4543, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:48:49');
INSERT INTO `sys_login_log` VALUES (4544, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:48:53');
INSERT INTO `sys_login_log` VALUES (4545, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:49:16');
INSERT INTO `sys_login_log` VALUES (4546, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:18');
INSERT INTO `sys_login_log` VALUES (4547, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:20');
INSERT INTO `sys_login_log` VALUES (4548, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:20');
INSERT INTO `sys_login_log` VALUES (4549, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:21');
INSERT INTO `sys_login_log` VALUES (4550, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:21');
INSERT INTO `sys_login_log` VALUES (4551, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:21');
INSERT INTO `sys_login_log` VALUES (4552, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:21');
INSERT INTO `sys_login_log` VALUES (4553, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:22');
INSERT INTO `sys_login_log` VALUES (4554, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:50:22');
INSERT INTO `sys_login_log` VALUES (4555, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:51:04');
INSERT INTO `sys_login_log` VALUES (4556, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:51:05');
INSERT INTO `sys_login_log` VALUES (4557, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-23 22:53:13');
INSERT INTO `sys_login_log` VALUES (4558, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 16:25:49');
INSERT INTO `sys_login_log` VALUES (4559, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 16:32:05');
INSERT INTO `sys_login_log` VALUES (4560, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 17:21:30');
INSERT INTO `sys_login_log` VALUES (4561, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 17:30:51');
INSERT INTO `sys_login_log` VALUES (4562, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 17:37:35');
INSERT INTO `sys_login_log` VALUES (4563, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 17:43:28');
INSERT INTO `sys_login_log` VALUES (4564, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 17:43:37');
INSERT INTO `sys_login_log` VALUES (4565, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:04:43');
INSERT INTO `sys_login_log` VALUES (4566, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:05:29');
INSERT INTO `sys_login_log` VALUES (4567, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:06:58');
INSERT INTO `sys_login_log` VALUES (4568, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:07:33');
INSERT INTO `sys_login_log` VALUES (4569, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:07:52');
INSERT INTO `sys_login_log` VALUES (4570, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:09:52');
INSERT INTO `sys_login_log` VALUES (4571, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:16:42');
INSERT INTO `sys_login_log` VALUES (4572, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:17:37');
INSERT INTO `sys_login_log` VALUES (4573, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:28:01');
INSERT INTO `sys_login_log` VALUES (4574, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:29:31');
INSERT INTO `sys_login_log` VALUES (4575, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 18:47:04');
INSERT INTO `sys_login_log` VALUES (4576, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 19:23:35');
INSERT INTO `sys_login_log` VALUES (4577, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-24 19:35:54');
INSERT INTO `sys_login_log` VALUES (4578, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-28 22:07:28');
INSERT INTO `sys_login_log` VALUES (4579, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-28 23:03:55');
INSERT INTO `sys_login_log` VALUES (4580, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 12:11:49');
INSERT INTO `sys_login_log` VALUES (4581, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 12:18:00');
INSERT INTO `sys_login_log` VALUES (4582, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 12:28:59');
INSERT INTO `sys_login_log` VALUES (4583, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 12:39:38');
INSERT INTO `sys_login_log` VALUES (4584, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 18:08:23');
INSERT INTO `sys_login_log` VALUES (4585, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 18:15:39');
INSERT INTO `sys_login_log` VALUES (4586, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-04-30 18:56:52');
INSERT INTO `sys_login_log` VALUES (4587, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-07 16:27:47');
INSERT INTO `sys_login_log` VALUES (4588, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-07 16:34:23');
INSERT INTO `sys_login_log` VALUES (4589, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-07 16:35:19');
INSERT INTO `sys_login_log` VALUES (4590, NULL, 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 142.0.7444.265', 'Windows 10 or Windows Server 2016', 'password', 1, '账号或密码错误', '2026-05-07 16:38:30');
INSERT INTO `sys_login_log` VALUES (4591, NULL, 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 142.0.7444.265', 'Windows 10 or Windows Server 2016', 'password', 1, '账号或密码错误', '2026-05-07 16:38:38');
INSERT INTO `sys_login_log` VALUES (4592, NULL, 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 142.0.7444.265', 'Windows 10 or Windows Server 2016', 'password', 1, '账号或密码错误', '2026-05-07 16:38:47');
INSERT INTO `sys_login_log` VALUES (4593, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 142.0.7444.265', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-07 16:38:55');
INSERT INTO `sys_login_log` VALUES (4594, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-07 18:30:07');
INSERT INTO `sys_login_log` VALUES (4595, '01kpxd54g1s421n7bcg6bqqj85', '111', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-08 14:38:30');
INSERT INTO `sys_login_log` VALUES (4596, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 142.0.7444.265', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-08 14:39:12');
INSERT INTO `sys_login_log` VALUES (4597, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-08 15:22:30');
INSERT INTO `sys_login_log` VALUES (4598, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '192.168.2.39', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-13 13:21:31');
INSERT INTO `sys_login_log` VALUES (4599, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-13 23:43:50');
INSERT INTO `sys_login_log` VALUES (4600, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-13 23:52:26');
INSERT INTO `sys_login_log` VALUES (4601, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-13 23:58:04');
INSERT INTO `sys_login_log` VALUES (4602, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 00:25:43');
INSERT INTO `sys_login_log` VALUES (4603, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 00:29:25');
INSERT INTO `sys_login_log` VALUES (4604, NULL, 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Unknown null', 'Windows 10 or Windows Server 2016', 'password', 1, 'Cannot invoke \"java.lang.Boolean.booleanValue()\" because the return value of \"com.xddcodec.fs.system.domain.dto.LoginCmd.getIsRemember()\" is null', '2026-05-14 00:34:08');
INSERT INTO `sys_login_log` VALUES (4605, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Unknown null', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 00:34:18');
INSERT INTO `sys_login_log` VALUES (4606, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 00:42:25');
INSERT INTO `sys_login_log` VALUES (4607, '01kpxd54g1s421n7bcg6bqqj85', '111', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 01:29:38');
INSERT INTO `sys_login_log` VALUES (4608, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 01:36:27');
INSERT INTO `sys_login_log` VALUES (4609, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 01:43:25');
INSERT INTO `sys_login_log` VALUES (4610, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 02:02:10');
INSERT INTO `sys_login_log` VALUES (4611, '01kpxd54g1s421n7bcg6bqqj85', '111', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 02:26:57');
INSERT INTO `sys_login_log` VALUES (4612, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 02:27:47');
INSERT INTO `sys_login_log` VALUES (4613, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 02:30:26');
INSERT INTO `sys_login_log` VALUES (4614, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 02:38:24');
INSERT INTO `sys_login_log` VALUES (4615, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.206', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 03:01:20');
INSERT INTO `sys_login_log` VALUES (4616, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 22:59:07');
INSERT INTO `sys_login_log` VALUES (4617, '01kpxd54g1s421n7bcg6bqqj85', '111', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:07:20');
INSERT INTO `sys_login_log` VALUES (4618, '01kpxd54g1s421n7bcg6bqqj85', '111', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:20:53');
INSERT INTO `sys_login_log` VALUES (4619, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:24:49');
INSERT INTO `sys_login_log` VALUES (4620, '01kpxd54g1s421n7bcg6bqqj85', '111', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:25:20');
INSERT INTO `sys_login_log` VALUES (4621, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:25:44');
INSERT INTO `sys_login_log` VALUES (4622, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:47:24');
INSERT INTO `sys_login_log` VALUES (4623, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:48:24');
INSERT INTO `sys_login_log` VALUES (4624, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 147.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-14 23:57:49');
INSERT INTO `sys_login_log` VALUES (4625, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:04:54');
INSERT INTO `sys_login_log` VALUES (4626, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:04:56');
INSERT INTO `sys_login_log` VALUES (4627, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:04:57');
INSERT INTO `sys_login_log` VALUES (4628, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:05:28');
INSERT INTO `sys_login_log` VALUES (4629, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:17:06');
INSERT INTO `sys_login_log` VALUES (4630, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:27:17');
INSERT INTO `sys_login_log` VALUES (4631, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:31:02');
INSERT INTO `sys_login_log` VALUES (4632, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:37:22');
INSERT INTO `sys_login_log` VALUES (4633, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 01:47:49');
INSERT INTO `sys_login_log` VALUES (4634, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '10.160.30.137', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 02:00:02');
INSERT INTO `sys_login_log` VALUES (4635, '01jrvgs943q0f43h0aa5mjde0y', 'admin', '127.0.0.1', '0|0|内网IP|内网IP', 'Chrome 148.0.0.0', 'Windows 10 or Windows Server 2016', 'password', 0, '登录成功', '2026-05-15 02:05:40');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限编码，如 file:upload',
  `permission_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称，如 上传文件',
  `module` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属模块，如 文件管理',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_permission_code`(`permission_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 'file:read', '文件读取', '文件管理', '查看、预览、下载文件', 1, '2026-04-01 02:44:26', '2026-04-01 02:44:26');
INSERT INTO `sys_permission` VALUES (2, 'file:write', '文件编辑', '文件管理', '上传、创建文件夹、删除、移动、重命名、收藏、回收站操作', 2, '2026-04-01 02:44:26', '2026-04-01 02:44:26');
INSERT INTO `sys_permission` VALUES (3, 'file:share', '文件分享', '文件管理', '创建、管理、取消分享链接', 3, '2026-04-01 02:44:26', '2026-04-01 02:44:26');
INSERT INTO `sys_permission` VALUES (4, 'storage:manage', '存储管理', '存储管理', '存储源的增删改查及启用禁用', 4, '2026-04-01 02:44:26', '2026-04-01 02:44:26');
INSERT INTO `sys_permission` VALUES (5, 'member:manage', '成员管理', '系统管理', '邀请/移除成员、角色管理、权限查看', 5, '2026-04-01 02:44:26', '2026-04-01 02:44:26');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属工作空间ID',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '角色描述',
  `role_type` tinyint NOT NULL DEFAULT 1 COMMENT '0=系统预设 1=自定义',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_workspace_role_code`(`workspace_id` ASC, `role_code` ASC) USING BTREE,
  INDEX `idx_workspace_id`(`workspace_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100023 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (100015, '01kpq1bqzq1z99r0vd2xxqr3yk', 'admin', '系统管理员', '拥有系统全部权限，可管理所有用户、角色、权限及系统配置', 0, '2026-04-21 11:29:22', '2026-04-21 11:29:22');
INSERT INTO `sys_role` VALUES (100016, '01kpq1bqzq1z99r0vd2xxqr3yk', 'member', '普通员工', '可进行文件上传、下载、预览、分享等日常操作，可查看文件版本历史', 0, '2026-04-21 11:29:22', '2026-04-21 11:29:22');
INSERT INTO `sys_role` VALUES (100017, '01kpq1bqzq1z99r0vd2xxqr3yk', 'viewer', '受限成员', '仅可浏览、预览与下载', 0, '2026-04-21 11:29:23', '2026-04-21 11:29:23');
INSERT INTO `sys_role` VALUES (100018, '01kpxd9zxfkbceyfxdkyypx6ps', 'admin', '系统管理员', '拥有系统全部权限，可管理所有用户、角色、权限及系统配置', 0, '2026-04-23 22:53:35', '2026-04-23 22:53:35');
INSERT INTO `sys_role` VALUES (100019, '01kpxd9zxfkbceyfxdkyypx6ps', 'member', '普通员工', '可进行文件上传、下载、预览、分享等日常操作，可查看文件版本历史', 0, '2026-04-23 22:53:35', '2026-04-23 22:53:35');
INSERT INTO `sys_role` VALUES (100020, '01kpxd9zxfkbceyfxdkyypx6ps', 'viewer', '受限成员', '仅可浏览、预览与下载', 0, '2026-04-23 22:53:35', '2026-04-23 22:53:35');
INSERT INTO `sys_role` VALUES (100021, '01kpxd9zxfkbceyfxdkyypx6ps', 'department_admin', '部门管理员', '可管理本部门空间、成员权限、查看操作日志及存储空间', 0, '2026-05-14 23:04:23', '2026-05-14 23:04:23');
INSERT INTO `sys_role` VALUES (100022, '01kpq1bqzq1z99r0vd2xxqr3yk', 'department_admin', '部门管理员', '可管理本部门空间、成员权限、查看操作日志及存储空间', 0, '2026-05-14 23:04:23', '2026-05-14 23:04:23');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id` int NOT NULL COMMENT '角色ID',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编码',
  `permission_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_role_permission`(`role_id` ASC, `permission_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (49, 100015, 'admin', 'file:read');
INSERT INTO `sys_role_permission` VALUES (50, 100015, 'admin', 'file:write');
INSERT INTO `sys_role_permission` VALUES (51, 100015, 'admin', 'file:share');
INSERT INTO `sys_role_permission` VALUES (52, 100015, 'admin', 'storage:manage');
INSERT INTO `sys_role_permission` VALUES (53, 100015, 'admin', 'member:manage');
INSERT INTO `sys_role_permission` VALUES (54, 100016, 'member', 'file:read');
INSERT INTO `sys_role_permission` VALUES (55, 100016, 'member', 'file:write');
INSERT INTO `sys_role_permission` VALUES (56, 100016, 'member', 'file:share');
INSERT INTO `sys_role_permission` VALUES (57, 100017, 'viewer', 'file:read');
INSERT INTO `sys_role_permission` VALUES (58, 100018, 'admin', 'file:read');
INSERT INTO `sys_role_permission` VALUES (59, 100018, 'admin', 'file:write');
INSERT INTO `sys_role_permission` VALUES (60, 100018, 'admin', 'file:share');
INSERT INTO `sys_role_permission` VALUES (61, 100018, 'admin', 'storage:manage');
INSERT INTO `sys_role_permission` VALUES (62, 100018, 'admin', 'member:manage');
INSERT INTO `sys_role_permission` VALUES (63, 100019, 'member', 'file:read');
INSERT INTO `sys_role_permission` VALUES (64, 100019, 'member', 'file:write');
INSERT INTO `sys_role_permission` VALUES (65, 100019, 'member', 'file:share');
INSERT INTO `sys_role_permission` VALUES (66, 100020, 'viewer', 'file:read');
INSERT INTO `sys_role_permission` VALUES (67, 100021, 'department_admin', 'file:read');
INSERT INTO `sys_role_permission` VALUES (68, 100022, 'department_admin', 'file:read');
INSERT INTO `sys_role_permission` VALUES (69, 100021, 'department_admin', 'file:share');
INSERT INTO `sys_role_permission` VALUES (70, 100022, 'department_admin', 'file:share');
INSERT INTO `sys_role_permission` VALUES (71, 100021, 'department_admin', 'file:write');
INSERT INTO `sys_role_permission` VALUES (72, 100022, 'department_admin', 'file:write');
INSERT INTO `sys_role_permission` VALUES (73, 100021, 'department_admin', 'member:manage');
INSERT INTO `sys_role_permission` VALUES (74, 100022, 'department_admin', 'member:manage');
INSERT INTO `sys_role_permission` VALUES (75, 100021, 'department_admin', 'storage:manage');
INSERT INTO `sys_role_permission` VALUES (76, 100022, 'department_admin', 'storage:manage');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `nickname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `status` int NOT NULL DEFAULT 0 COMMENT '用户状态 0正常 1禁用',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `last_login_at` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('01jrvgs943q0f43h0aa5mjde0y', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '19127968190@163.com', '墨绿色的卫衣', 'http://localhost:8080/files/free-fs/avatar/01jrvgs943q0f43h0aa5mjde0y/01jrvgs943q0f43h0aa5mjde0y_1775094747262.png', 0, '2025-04-15 09:25:22', '2026-05-15 02:05:40', '2026-05-15 02:05:40');
INSERT INTO `sys_user` VALUES ('01kpxd54g1s421n7bcg6bqqj85', '111', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'nanfangguniang19@gmail.com', '南方', NULL, 0, '2026-04-23 22:50:55', '2026-05-14 23:25:20', '2026-05-14 23:25:20');

-- ----------------------------
-- Table structure for sys_user_transfer_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_transfer_setting`;
CREATE TABLE `sys_user_transfer_setting`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `download_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件下载位置',
  `is_default_download_location` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认该路径为下载路径，如果否则每次下载询问保存地址',
  `download_speed_limit` int NOT NULL DEFAULT 5 COMMENT '下载速率限制 单位：MB/S',
  `concurrent_upload_quantity` int NOT NULL DEFAULT 1 COMMENT '并发上传数量',
  `concurrent_download_quantity` int NOT NULL DEFAULT 1 COMMENT '并发下载数量',
  `chunk_size` bigint NOT NULL COMMENT '分片大小',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id` ASC) USING BTREE COMMENT '用户ID唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户传输设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_transfer_setting
-- ----------------------------
INSERT INTO `sys_user_transfer_setting` VALUES (1, '01jrvgs943q0f43h0aa5mjde0y', 'C:\\Users\\insentek\\Downloads', 1, -1, 3, 3, 5242880, '2025-11-11 14:45:27', '2026-04-03 11:19:24');
INSERT INTO `sys_user_transfer_setting` VALUES (6, '01kpxd54g1s421n7bcg6bqqj85', 'D:\\APPLICATION\\文件下载测试文档', 1, -1, 3, 3, 5242880, '2026-04-23 22:50:55', '2026-04-24 17:39:07');

-- ----------------------------
-- Table structure for sys_workspace
-- ----------------------------
DROP TABLE IF EXISTS `sys_workspace`;
CREATE TABLE `sys_workspace`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作空间ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作空间名称',
  `slug` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'URL友好的唯一标识',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作空间描述',
  `owner_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者/拥有者用户ID',
  `member_count` int NOT NULL DEFAULT 1 COMMENT '成员数量（冗余字段，便于列表展示）',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_slug`(`slug` ASC) USING BTREE,
  INDEX `idx_owner_id`(`owner_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作空间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_workspace
-- ----------------------------
INSERT INTO `sys_workspace` VALUES ('01kpq1bqzq1z99r0vd2xxqr3yk', '墨绿色的卫衣的工作空间', 'xddcode-ws', NULL, '01jrvgs943q0f43h0aa5mjde0y', 2, '2026-04-21 11:29:22', '2026-04-24 19:31:59');
INSERT INTO `sys_workspace` VALUES ('01kpxd9zxfkbceyfxdkyypx6ps', '南方的工作空间', '-ws', 'cs', '01kpxd54g1s421n7bcg6bqqj85', 1, '2026-04-23 22:53:35', '2026-04-23 22:53:35');

-- ----------------------------
-- Table structure for sys_workspace_invitation
-- ----------------------------
DROP TABLE IF EXISTS `sys_workspace_invitation`;
CREATE TABLE `sys_workspace_invitation`  (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请ID',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作空间ID',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '被邀请人邮箱',
  `role_id` int NOT NULL COMMENT '分配的角色ID',
  `invited_by` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请人用户ID',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请令牌（用于注册链接）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '0-待接受 1-已接受 2-已过期 3-已取消',
  `expires_at` datetime NOT NULL COMMENT '邀请过期时间',
  `accepted_at` datetime NULL DEFAULT NULL COMMENT '接受时间',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_token`(`token` ASC) USING BTREE,
  INDEX `idx_workspace_id`(`workspace_id` ASC) USING BTREE,
  INDEX `idx_email_status`(`email` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作空间邀请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_workspace_invitation
-- ----------------------------
INSERT INTO `sys_workspace_invitation` VALUES ('01kpzfbbbqgqs83vrt6e61h1fj', '01kpq1bqzq1z99r0vd2xxqr3yk', 'nanfangguniang19@gmail.com', 100015, '01jrvgs943q0f43h0aa5mjde0y', 'abec96e56c4c42b5917bc3a25b976990', 3, '2026-04-27 18:07:45', NULL, '2026-04-24 18:07:45', '2026-04-24 18:10:02');
INSERT INTO `sys_workspace_invitation` VALUES ('01kpzfftvmpye6fcrh3k6kzdwx', '01kpq1bqzq1z99r0vd2xxqr3yk', 'nanfangguniang19@gmail.com', 100016, '01jrvgs943q0f43h0aa5mjde0y', '49122f3424894e2c909d4abb58178a90', 1, '2026-04-27 18:10:12', '2026-04-24 18:16:44', '2026-04-24 18:10:12', '2026-04-24 18:16:44');

-- ----------------------------
-- Table structure for sys_workspace_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_workspace_member`;
CREATE TABLE `sys_workspace_member`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `workspace_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作空间ID',
  `user_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` int NOT NULL COMMENT '该成员在此工作空间的角色ID',
  `joined_at` datetime NOT NULL COMMENT '加入时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_workspace_user`(`workspace_id` ASC, `user_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工作空间成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_workspace_member
-- ----------------------------
INSERT INTO `sys_workspace_member` VALUES (8, '01kpq1bqzq1z99r0vd2xxqr3yk', '01jrvgs943q0f43h0aa5mjde0y', 100015, '2026-04-21 11:29:23', '2026-04-21 11:29:23');
INSERT INTO `sys_workspace_member` VALUES (9, '01kpxd9zxfkbceyfxdkyypx6ps', '01kpxd54g1s421n7bcg6bqqj85', 100018, '2026-04-23 22:53:35', '2026-04-23 22:53:35');
INSERT INTO `sys_workspace_member` VALUES (10, '01kpq1bqzq1z99r0vd2xxqr3yk', '01kpxd54g1s421n7bcg6bqqj85', 100022, '2026-04-24 18:16:44', '2026-04-24 18:16:44');

SET FOREIGN_KEY_CHECKS = 1;
