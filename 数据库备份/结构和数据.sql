/*
 Navicat Premium Data Transfer

 Source Server         : springBootVue
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : qing

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 07/05/2022 21:53:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pet_id` int(0) NULL DEFAULT NULL COMMENT '宠物ID',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `doctor_id` bigint(0) NULL DEFAULT NULL COMMENT '医生ID',
  `appl_time` datetime(0) NULL DEFAULT NULL COMMENT '预约时间',
  `appl_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1498530959870451714 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (37, 37, 33, 33, '2022-05-07 08:17:08', '打疫苗', '2022-05-07 16:17:10', '已完成', '15678841387', '南宁');
INSERT INTO `appointment` VALUES (38, 38, 33, 33, '2022-06-23 09:02:38', '驱虫', '2022-05-07 17:02:44', '已完成', '18963453721', '广西民族大学');
INSERT INTO `appointment` VALUES (39, 39, 33, 33, '2022-06-21 16:19:00', '慢性肠炎', '2022-05-07 16:15:44', '已完成', '14777413849', '南宁市');
INSERT INTO `appointment` VALUES (40, 40, 33, 33, '2022-06-22 16:16:00', '驱虫', '2022-05-07 17:02:12', '已完成', '15678843745', '广州市天河区');
INSERT INTO `appointment` VALUES (41, 41, 33, 33, '2022-05-07 09:01:39', '疫苗', '2022-05-07 17:01:42', '申请中', '1556873721', '南宁市');
INSERT INTO `appointment` VALUES (42, 42, 33, 33, '2022-05-07 11:22:07', '疫苗', '2022-05-07 19:22:09', '申请中', '15678893487', '南宁市');
INSERT INTO `appointment` VALUES (43, 43, 33, 33, '2022-05-26 16:19:00', '急性肠炎', '2022-05-07 16:14:43', '已完成', '15674413846', '南宁市兴宁区');
INSERT INTO `appointment` VALUES (44, 44, 33, 33, '2022-05-25 16:11:00', '驱虫', '2022-05-07 16:14:00', '不通过', '13756843721', '广西民族大学');
INSERT INTO `appointment` VALUES (46, 46, 33, 33, '2022-05-27 16:16:00', '驱虫', '2022-05-07 16:13:21', '申请中', '18963453721', '西乡塘区');
INSERT INTO `appointment` VALUES (47, 47, 33, 33, '2022-06-22 16:08:00', '便秘', '2022-05-07 16:12:04', '已完成', '17889453721', '南宁武鸣区');
INSERT INTO `appointment` VALUES (49, 49, 33, 33, '2022-05-07 08:11:19', '肠炎', '2022-05-07 16:11:22', '申请中', '15777413752', '广州市天河区');
INSERT INTO `appointment` VALUES (50, 50, 33, 33, '2022-05-19 16:06:00', '驱虫', '2022-05-07 16:09:47', '不通过', '156788424945', '深圳市南山区');
INSERT INTO `appointment` VALUES (51, 51, 33, 33, '2022-05-25 16:14:00', '打疫苗', '2022-05-07 16:09:14', '已完成', '18963421948', '西乡塘区');
INSERT INTO `appointment` VALUES (55, 55, 33, 33, '2022-05-26 16:14:02', '驱虫', '2022-05-07 16:08:27', '已完成', '15678823702', '南宁青秀区');
INSERT INTO `appointment` VALUES (57, 57, 33, 33, '2022-05-12 16:02:00', '打疫苗', '2022-05-07 16:07:25', '已完成', '15678893214', '广西民族大学大学东路188号');

-- ----------------------------
-- Table structure for diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `diagnosis`;
CREATE TABLE `diagnosis`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pet_id` int(0) NULL DEFAULT NULL COMMENT '宠物ID',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `doctor_id` int(0) NULL DEFAULT NULL COMMENT '医生ID',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊断类型',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of diagnosis
-- ----------------------------
INSERT INTO `diagnosis` VALUES (37, 37, 34, 34, '驱虫完成', '驱虫', '较重', '2022-05-07 16:17:10');
INSERT INTO `diagnosis` VALUES (38, 38, 34, 34, '驱虫', '驱虫', '较重', '2022-05-07 17:02:44');
INSERT INTO `diagnosis` VALUES (39, 39, 34, 34, '注射疫苗正常', '注射疫苗', '正常', '2022-05-07 16:15:44');
INSERT INTO `diagnosis` VALUES (40, 40, 34, 34, '正常', '注射疫苗', '正常', '2022-05-07 17:02:12');
INSERT INTO `diagnosis` VALUES (41, 41, 34, 34, '驱虫成功', '驱虫', '正常', '2022-05-07 16:18:42');
INSERT INTO `diagnosis` VALUES (43, 43, 34, 34, '正常就医', '驱虫', '正常', '2022-05-07 16:14:43');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctor_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '医生主键ID',
  `doctor_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `doctor_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `doctor_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  `doctor_post` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属科室',
  `doctor_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件',
  `doctor_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `doctor_age` int(0) NULL DEFAULT NULL COMMENT '年龄',
  `doctor_gender` int(0) NULL DEFAULT NULL COMMENT '性别',
  `doctor_level` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `doctor_demo1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介1',
  `doctor_demo2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介2',
  `doctor_demo3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介3',
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `doctor_name`(`doctor_name`) USING BTREE,
  INDEX `doctor_number`(`doctor_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (1, '511478', '王啦啦', NULL, '骨科', '1766722034@qq.com', '13734010086', 21, 1, '主任', '中国中医科学院主任医师，1939年2月起从事中医临床工作，为全国老中医药专家学术经验继承工作指导老师、“首都国医名师”，国家级非物质文化遗产传统医药项目代表性传承人。擅长中医内科、针灸，对妇科、儿科等亦很有深造诣', NULL, NULL);
INSERT INTO `doctor` VALUES (2, '361744', '吕小布', NULL, '骨科', 'wzy000302@qq.com', '13945687432', 30, 1, '医生', '皖南医学院附属弋矶山医院主任医师、终身教授。首届“国医大师”、首批“全国500名老中医”、首批国家名老中医学术经验继承人指导老师、首批中国百年百名中医临床家、首批国务院特殊津贴获得者。精擅内、妇科疑难杂症，尤擅痹病、痿病、肿瘤等顽疾治疗，有《济仁医录》等专著10余部，论文百余篇，并参编《内经》、《中医基础理论》等高等学校规划教材。', NULL, NULL);
INSERT INTO `doctor` VALUES (3, '817423', '唐玉浩', NULL, '泌尿科', 'ty3307@qq.com', '17558471422', 20, 0, '护士', '与汪逢春、萧龙友、施今墨并称北京四大名医。学自家传。早年任北京外城官医院医官。1929年被选为全国医药团体联合会临时主席，率请愿团赴南京，迫使国民党政府收回“取缔中医”的成命。后与萧龙友合办北京国医学院并任院长。建国后，任卫生部顾问、中华医学会中西医学术交流委员会副主任。是第二届全国政协委员。学术上，主张病必求其本，临证注重湿与热。以善治温病著名，更以善用石膏一药，为医林所景仰。著有《时斋医话》、《传染病八种证治晰疑》。有《孔伯华医集》。', NULL, NULL);
INSERT INTO `doctor` VALUES (4, '844713', '王世英', NULL, '肛门科', '1161001321@qq.com', '15753589632', 20, 0, '实习护士', '著名肝胆外科专家，中国科学院院士，中国肝脏外科的开拓者和主要创始人之一，李庄同济医院终身名誉院长，被誉为“中国肝胆外科之父”和有可能获得诺贝尔生理学或医学奖的中国大陆学者之一。皖南医学院附属弋矶', NULL, NULL);
INSERT INTO `doctor` VALUES (5, '336871', '王鑫', NULL, '毛发科', '1373628651@qq.com', '15154226321', 20, 1, '实习医生', '1997年学成回国创办国际合作生物信号转导研究中心和综合治疗病区，形成基础与临床结合的创新基地。在分子诊断方面，研发了新的肝癌诊断标志物及血清检测单克隆抗体，获国家专利；克隆新的肝癌相关基因4个并阐明功能；首次发现新的抑制性受体对肝癌细胞生长、凋亡的调控机制和癌基因P28在肝癌的异常信号通路，为肝癌防治提供了新的靶标；分离新的磷酸酶3种，提出新的酶分类法；发现了磷酸酶PCP-2调控β-catenin介导的肿瘤信号通路，与同行合作提出新的抑制性受体调控机制在多器官存在的新概念。', NULL, NULL);
INSERT INTO `doctor` VALUES (6, '358774', '杨思琦', NULL, '毛发科', '12679962@qq.com', '198442876', 20, 0, '医生助理', '著名医学家、 [1-2]  中国现代普通外科的主要开拓者、肝胆外科和器官移植外科的主要创始人和奠基人之一、晚期血吸虫病外科治疗的开创者、中国科学院资深院士，被誉为“中国外科之父”。其刀法以精准见长，被医学界称为“裘氏刀法”。', NULL, NULL);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父ID',
  `foreign_id` int(0) NULL DEFAULT 0 COMMENT '关联id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '留言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (20, '哈哈哈', 'admin', '2021-05-22 10:48:55', NULL, 0);
INSERT INTO `message` VALUES (21, '哦豁', 'admin', '2021-05-22 10:49:48', NULL, 0);
INSERT INTO `message` VALUES (22, '老弟', 'admin', '2021-05-22 10:51:07', 21, 0);
INSERT INTO `message` VALUES (23, '哈哈哈', 'zhang', '2021-05-24 17:13:45', 22, 0);
INSERT INTO `message` VALUES (24, '我们都爱吃大西瓜', 'zhang', '2021-05-24 17:13:58', NULL, 0);
INSERT INTO `message` VALUES (25, '1232', 'admin', '2021-10-31 16:46:39', NULL, 0);
INSERT INTO `message` VALUES (26, '2345', 'admin', '2021-10-31 16:47:00', 25, 0);
INSERT INTO `message` VALUES (27, '11111', 'admin', '2021-10-31 16:52:09', 26, 0);
INSERT INTO `message` VALUES (28, '3333', 'admin', '2021-10-31 16:55:28', 27, 0);
INSERT INTO `message` VALUES (29, 'jjj', 'admin', '2022-01-17 14:23:32', NULL, 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `view_count` int(0) NULL DEFAULT NULL COMMENT '查看次数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (22, '<p>狗狗大些才能打狂犬疫苗，每年打一次。而且必须在狗狗熟悉了新环境，身体健康的情况下才能打，疫苗期间不能洗澡。狗狗还要定期驱虫，吃驱虫药就行。驱虫和疫苗不要同时进行，间隔一两个礼拜比较好。驱虫幼犬隔3个月一次，成年犬隔半年一次。</p><p>如果确定要给狗狗打疫苗，那每年注射是必要的，而且一般来说次年的疫苗应该比上一年的注射时间提早半个月到一个月，避免在疫苗快要失效的时候发生意外。</p>', 2, '2022-04-29 14:43:45', '宠物预防针多久打一次', '医生');
INSERT INTO `notice` VALUES (23, '<p>请填写文字内容</p><p>如果你的小狗已经出现了一定情况的问题，那么请先从自己／现有环境的身上找原因——毕竟养狗行为课程，其实最重要的不是小狗，而是小狗的主人。</p><p>我们对待小狗的方式，就是我们对待小孩，或者说是童年的自己的方式。是选择恐吓训斥，让他们永远失去好奇心，对周围充满恐惧？还是选择给小孩以积极尊重，探索周边，予以互动？培养小狗的自信心和成就感，也是重要的课程内容。</p><p>&nbsp;</p>', 2, '2022-04-29 14:44:02', '养犬最重要的是什么？', '医生');
INSERT INTO `notice` VALUES (24, '<p><b>每年至少给你的犬只或猫咪做一次兽医检查。</b></p><p>这是帮助它们尽可能长寿的关键。不要以为在室内生活的猫咪不需要每年进行检查，或者一只看起来健康的宠物可以一年时间不生病——动物非常善于隐藏疼痛和疾病。此外，对于上了年龄的犬只和猫咪，时间似乎过的更快，如果每半年进行一次检查，将获益颇多，帮助它们保持健康。<br/></p>', 3, '2022-05-07 17:06:08', '多久给宠物做一次检查？', '医生');
INSERT INTO `notice` VALUES (25, '<p>家中的猫砂盆、狗狗厕所要即时清理，避免宠物排泄物的堆积造成细菌隐患，洁净的“如厕”环境也会缓解宠物的身心健康，利于宠物顺畅排便。猫砂可以选择京东宠物上热卖的pidan的膨润土豆腐混合猫砂，高效结团，遇水溶解可以冲厕所，极大减少了养宠的时间成本，方便养宠人即时清理。<br/></p>', 4, '2022-05-07 17:07:56', '如何注意宠物的卫生？', '医生');
INSERT INTO `notice` VALUES (26, '<p><b>宠物主们一定要记住安全的消毒方法</b>：</p><p>宠物食盆消毒可用56°以上热水浸泡30分钟或75%酒精喷洒，再用清水擦拭。</p><p>宠物小物件如玩具等，可用75%的医用酒精浸泡或擦拭消毒，但75%的医用酒精浓度过高，需要避免直接接触到宠物眼睛、口鼻处和体表。酒精属于易燃物，使用前一定远离火源！<br/></p>', 3, '2022-05-07 17:09:18', '如何做到科学消毒？', '医生');
INSERT INTO `notice` VALUES (27, '<p><b>除了体表和日用品的消毒，给宠物定期做驱虫也是非常必要的。</b></p><p><span style=\"font-size: 14px;\">有些猫猫家长可能会说，猫猫从未出门不需要驱虫，其实这种观念是错误的。我们从外面回来时，鞋底有可能带有虫卵，猫猫可能会感染耳螨、蛔虫等等寄生虫，所以一定要防患于未然，每月定期驱虫。</span><b></b><br/></p>', 6, '2022-05-07 17:10:33', '如何做到体外驱虫？', '医生');
INSERT INTO `notice` VALUES (28, '<p>如果猫猫不打疫苗，可能会感染猫瘟、猫鼻支等等，而狗狗则面临狂犬病毒的风险。内外驱虫+疫苗双重防护，才能保证宠物的强健体魄。疫苗推荐辉瑞硕腾进口疫苗，增强免疫，抵抗病毒，帮助宠物无忧成长。<br/></p>', 3, '2022-05-07 17:11:07', '如何做好宠物疫苗防护？', '医生');
INSERT INTO `notice` VALUES (29, '<p>&nbsp; &nbsp; &nbsp; 1、乌贼、贝壳类，香菇、等不易消化的食品，可能造成腹泻或者呕吐。</p><p>　　2、姜、咖喱粉、辣椒等刺激性香料，太过于刺激肠胃。</p><p>　　3、洋葱含有溶解红血球的毒性、摄食后易造成血尿或者贫血等中毒症状。</p><p>　　4、巧克力，也可能会产生有毒物质而引起尿失禁、痉挛、羊癜疯等病状。</p><p>　　5、小的猪骨、鸡骨和鱼骨尖锐且硬，容易刺伤口腔及消化器官，也不可以喂食。</p><p>　　6、有些狗一喝牛奶就会造成腹泻，最好都不要给狗狗喂牛奶。</p><p>　　7、幼犬切忌喂食火腿肠，香肠，尤鱼丝等含防腐剂、色素等食物。</p>', 7, '2022-05-07 17:12:15', '狗狗不能吃的食物', '医生');

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物名',
  `weight` double NULL DEFAULT NULL COMMENT '体重',
  `height` double NULL DEFAULT NULL COMMENT '身长',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宠物所属类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '出生时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES (37, 34, '樱桃', 10, 50, '犬科', '2022-04-29 14:32:47');
INSERT INTO `pet` VALUES (38, 33, '洛洛', 12, 28, '猫科', '2022-05-07 15:32:02');
INSERT INTO `pet` VALUES (39, 33, '毛毛', 8, 34, '猫科', '2022-05-07 15:32:18');
INSERT INTO `pet` VALUES (40, 33, '悠悠', 8, 29, '猫科', '2022-05-07 15:32:35');
INSERT INTO `pet` VALUES (41, 33, '安妮', 18, 45, '犬科', '2022-05-07 15:33:03');
INSERT INTO `pet` VALUES (42, 33, '豆豆', 24, 42, '犬科', '2022-05-07 15:33:40');
INSERT INTO `pet` VALUES (43, 33, '爱贝', 34, 45, '犬科', '2022-05-07 15:34:40');
INSERT INTO `pet` VALUES (44, 33, '肥肥', 25, 35, '犬科', '2022-05-07 15:35:00');
INSERT INTO `pet` VALUES (45, 33, '当当', 15, 27, '犬科', '2022-05-07 15:35:26');
INSERT INTO `pet` VALUES (46, 33, '琪琪', 8, 18, '猫科', '2022-05-07 15:36:47');
INSERT INTO `pet` VALUES (47, 33, '崽崽', 5, 17, '猫科', '2022-05-07 15:37:04');
INSERT INTO `pet` VALUES (48, 33, '旺财', 7, 21, '猫科', '2022-05-07 15:37:35');
INSERT INTO `pet` VALUES (49, 33, '安妮', 21, 43, '犬科', '2022-05-07 15:37:53');
INSERT INTO `pet` VALUES (50, 33, '哈里', 40, 69, '犬科', '2022-05-07 15:38:23');
INSERT INTO `pet` VALUES (51, 33, '花花', 5, 23, '猫科', '2022-05-07 15:38:40');
INSERT INTO `pet` VALUES (52, 33, '棉花糖', 3, 14, '猫科', '2022-05-07 15:39:04');
INSERT INTO `pet` VALUES (53, 33, '娜娜', 7, 31, '猫科', '2022-05-07 15:41:31');
INSERT INTO `pet` VALUES (54, 33, '小乖', 29, 52, '犬科', '2022-05-07 15:41:47');
INSERT INTO `pet` VALUES (55, 33, '维维安', 4, 17, '猫科', '2022-05-07 15:42:06');
INSERT INTO `pet` VALUES (56, 33, '乐乐', 2, 12, '猫科', '2022-05-07 15:42:33');
INSERT INTO `pet` VALUES (57, 33, '叮叮', 7, 18, '猫科', '2022-05-07 15:44:31');

-- ----------------------------
-- Table structure for pet_daily
-- ----------------------------
DROP TABLE IF EXISTS `pet_daily`;
CREATE TABLE `pet_daily`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pet_id` bigint(0) NULL DEFAULT NULL COMMENT '宠物ID',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
  `temperature` double(10, 2) NULL DEFAULT NULL COMMENT '体温',
  `weight` double(10, 2) NULL DEFAULT NULL COMMENT '体重',
  `height` double(10, 2) NULL DEFAULT NULL COMMENT '身长',
  `appetite` double(10, 2) NULL DEFAULT NULL COMMENT '饭量',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet_daily
-- ----------------------------
INSERT INTO `pet_daily` VALUES (55, 37, 34, 38.00, 32.00, 62.00, 70.00, '正常', '2022-05-06 15:45:38');
INSERT INTO `pet_daily` VALUES (56, 56, 33, 37.50, 7.00, 24.00, 70.00, '正常', '2022-05-07 16:26:06');
INSERT INTO `pet_daily` VALUES (57, 55, 33, 39.20, 8.00, 26.00, 38.00, '生病', '2022-05-07 16:32:07');
INSERT INTO `pet_daily` VALUES (58, 53, 33, 36.50, 28.00, 46.00, 20.00, '异常', '2022-05-07 16:32:42');
INSERT INTO `pet_daily` VALUES (59, 52, 33, 38.00, 32.00, 56.00, 90.00, '正常', '2022-05-07 16:33:07');
INSERT INTO `pet_daily` VALUES (60, 51, 33, 37.80, 39.00, 67.00, 330.00, '正常', '2022-05-07 16:33:48');
INSERT INTO `pet_daily` VALUES (61, 49, 33, 37.50, 24.00, 43.00, 341.00, '正常', '2022-05-07 16:34:07');
INSERT INTO `pet_daily` VALUES (62, 57, 33, 38.90, 34.00, 76.00, 333.00, '异常', '2022-05-07 16:35:08');
INSERT INTO `pet_daily` VALUES (63, 50, 33, 37.00, 23.00, 44.00, 400.00, '正常', '2022-05-07 16:35:27');
INSERT INTO `pet_daily` VALUES (64, 48, 33, 37.20, 7.00, 25.00, 123.00, '正常', '2022-05-07 16:35:50');
INSERT INTO `pet_daily` VALUES (65, 49, 33, 39.20, 5.00, 14.00, 23.00, '生病', '2022-05-07 16:36:22');
INSERT INTO `pet_daily` VALUES (66, 40, 33, 38.90, 8.00, 32.00, 32.00, '生病', '2022-05-07 16:36:47');
INSERT INTO `pet_daily` VALUES (67, 42, 33, 36.10, 23.00, 45.00, 123.00, '异常', '2022-05-07 16:37:20');
INSERT INTO `pet_daily` VALUES (68, 46, 33, 37.50, 12.00, 34.00, 143.00, '正常', '2022-05-07 16:38:33');

-- ----------------------------
-- Table structure for standard
-- ----------------------------
DROP TABLE IF EXISTS `standard`;
CREATE TABLE `standard`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `age_min` int(0) NULL DEFAULT NULL COMMENT '开始年龄',
  `age_max` int(0) NULL DEFAULT NULL COMMENT '结束年龄',
  `temp_min` double(10, 2) NULL DEFAULT NULL COMMENT '体温最小值',
  `temp_max` double(10, 2) NULL DEFAULT NULL COMMENT '体温最大值',
  `weight_min` double(10, 2) NULL DEFAULT NULL COMMENT '体重最小值',
  `weight_max` double(10, 2) NULL DEFAULT NULL COMMENT '体温最大值',
  `height_min` double(10, 2) NULL DEFAULT NULL COMMENT '身长最小值',
  `height_max` double(10, 2) NULL DEFAULT NULL COMMENT '身长最大值',
  `appetite_min` double(10, 2) NULL DEFAULT NULL COMMENT '饭量最小值',
  `appetite_max` double(10, 2) NULL DEFAULT NULL COMMENT '饭量最大值',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of standard
-- ----------------------------
INSERT INTO `standard` VALUES (17, 1, 21, 38.00, 39.50, 3.00, 10.00, 25.00, 45.00, 30.00, 180.00, '猫科', '正常');
INSERT INTO `standard` VALUES (18, 1, 18, 37.50, 38.50, 0.80, 45.00, 18.00, 80.00, 35.00, 420.00, '犬科', '正常');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (16, 'cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (17, '649002da71c8473db39892b4a758f875.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 0);
INSERT INTO `sys_file` VALUES (18, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 0);
INSERT INTO `sys_file` VALUES (19, 'Java3年经验开发个人简历模板.doc', 'doc', 47, 'http://localhost:9090/file/0e020e1337474a93ba3b43a75b2890ee.doc', '9ace4fac24420f85c753aa663009edb4', 1, 1);
INSERT INTO `sys_file` VALUES (20, '1626102561055-2.jpg', 'jpg', 24, 'http://localhost:9090/file/cd379f381364482aaad0d6ffb7209d3d.jpg', 'adb0481b283645af3809e3d8a1bdb294', 0, 1);
INSERT INTO `sys_file` VALUES (21, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (22, '1622536738094-7.jpg', 'jpg', 12, 'http://localhost:9090/file/ad5946fe27c14508ac796115f6465826.jpg', '35977e7dc2159a734f3c81de460e4b8d', 0, 1);
INSERT INTO `sys_file` VALUES (23, '用户信息 (1).xlsx', 'xlsx', 3, 'http://localhost:9090/file/02f70e07e69045c38b4748283ffeeabb.xlsx', '687f150737c967e74cfd6fa9ec981589', 0, 1);
INSERT INTO `sys_file` VALUES (24, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (25, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (26, '6.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 0, 1);
INSERT INTO `sys_file` VALUES (27, '9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 0, 1);
INSERT INTO `sys_file` VALUES (28, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (29, '1641024983532cf (1).png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (30, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (31, '22届秋招.pdf', 'pdf', 271, 'http://localhost:9090/file/6b0db579f91545e5b4329a74ed2ae54f.pdf', 'e096c7232933a5eddbe710ae520a5c6d', 0, 1);
INSERT INTO `sys_file` VALUES (32, 'Snipaste_2022-04-29_16-44-07.png', 'png', 216, 'http://localhost:9090/file/ed5868732ae948fd9b9faea22387e894.png', '42eee402956fafd516ba15e93f28e1f5', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, '数据报表', '/dashbord', 'el-icon-s-marketing', '11', NULL, 'Dashbord', 100);
INSERT INTO `sys_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` VALUES (9, '请作者喝杯咖啡', '/donate', 'el-icon-coffee\r\n', NULL, NULL, 'Donate', 200);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (11, '宠物列表', '/pet', NULL, NULL, 4, 'Pet', NULL);
INSERT INTO `sys_menu` VALUES (12, '健康指南', '/notice', NULL, NULL, 4, 'Notice', NULL);
INSERT INTO `sys_menu` VALUES (14, '宠物日志', '/daily', NULL, NULL, 4, 'Daily', NULL);
INSERT INTO `sys_menu` VALUES (16, '健康标准', '/standard', NULL, NULL, 4, 'Standard', NULL);
INSERT INTO `sys_menu` VALUES (17, '预约列表', '/appointment', NULL, NULL, 4, 'Appointment', NULL);
INSERT INTO `sys_menu` VALUES (18, '宠物健康史', '/diagnosis', NULL, '宠物健康史，以往病例', 4, 'Diagnosis', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', 'ROLE_USER');
INSERT INTO `sys_role` VALUES (4, '医生', '医生', 'ROLE_DOCTOR');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `menu_id` int(0) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 12);
INSERT INTO `sys_role_menu` VALUES (2, 14);
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 17);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (4, 11);
INSERT INTO `sys_role_menu` VALUES (4, 12);
INSERT INTO `sys_role_menu` VALUES (4, 14);
INSERT INTO `sys_role_menu` VALUES (4, 16);
INSERT INTO `sys_role_menu` VALUES (4, 17);
INSERT INTO `sys_role_menu` VALUES (4, 18);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '程序员墨枫', 'admin@qq.com', '13988997788', '安徽合肥', '2022-01-22 21:10:27', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (16, '韦鸿', NULL, '甄姬', '15678842847@qq.com', '15674413487', '河南省', '2022-02-26 22:10:14', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (17, '梁秀秀', '123', '秀秀', '14578893487@qq.com', '15647724567', '广州', '2022-02-26 22:10:18', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (18, '梁龙龙', '123', '哪吒', '156788497514@qq.com', '15648873498', '河池市', '2022-03-29 16:59:44', '', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (19, '韦德', '123', '亚瑟', '14578892548@qq.com', '14875563814', '深圳市', '2022-04-29 16:59:44', '', 'ROLE_DOCTOR');
INSERT INTO `sys_user` VALUES (20, '郑茜茜', '123', '李信', '13474183485@qq.com', '15674423846', '南宁市', '2022-05-29 17:12:04', '2', 'ROLE_DOCTOR');
INSERT INTO `sys_user` VALUES (25, '王洪洪', '123', '安琪拉', '15678842485@qq.com', '15789973487', '佛山市', '2022-06-08 17:00:47', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (26, '赵红', NULL, '妲己', '15678843548@qq.com', '15647786842', '湖南省', '2022-07-08 17:20:01', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (28, '王德', '123', '王德', '18963453748@qq.com', '13478893642', '广州市天河区', '2022-11-09 10:41:07', '', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (29, '李芳芳', '123', '李芳芳', '2435301804@qq.com', '17896433725', '南宁市青秀区', '2022-12-10 11:53:31', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (33, 'user', '123', '普通用户', '1252129494@qq.com', '15678893721', '深圳市南山区', '2022-04-26 21:32:48', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (34, 'doctor', '123', '医生', '123454445@qq.com', '15678843721', '广西民族大学', '2022-04-26 21:34:23', 'http://localhost:9090/file/ed5868732ae948fd9b9faea22387e894.png', 'ROLE_DOCTOR');
INSERT INTO `sys_user` VALUES (35, '张峰', '123', '32', '1252129402@qq.com', '15678893714', '广西民族大学大学东路188号', '2022-04-28 10:50:09', NULL, 'ROLE_DOCTOR');

SET FOREIGN_KEY_CHECKS = 1;
