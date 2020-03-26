/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : onlinestudy

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-03-26 14:38:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add banner', '6', 'add_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can change banner', '6', 'change_banner');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete banner', '6', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('24', 'Can view banner', '6', 'view_banner');
INSERT INTO `auth_permission` VALUES ('25', 'Can add email verify recode', '7', 'add_emailverifyrecode');
INSERT INTO `auth_permission` VALUES ('26', 'Can change email verify recode', '7', 'change_emailverifyrecode');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete email verify recode', '7', 'delete_emailverifyrecode');
INSERT INTO `auth_permission` VALUES ('28', 'Can view email verify recode', '7', 'view_emailverifyrecode');
INSERT INTO `auth_permission` VALUES ('29', 'Can add user profile', '8', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('30', 'Can change user profile', '8', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete user profile', '8', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('32', 'Can view user profile', '8', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add course', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('34', 'Can change course', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete course', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can view course', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('37', 'Can add course type', '10', 'add_coursetype');
INSERT INTO `auth_permission` VALUES ('38', 'Can change course type', '10', 'change_coursetype');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete course type', '10', 'delete_coursetype');
INSERT INTO `auth_permission` VALUES ('40', 'Can view course type', '10', 'view_coursetype');
INSERT INTO `auth_permission` VALUES ('41', 'Can add lesson', '11', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('42', 'Can change lesson', '11', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete lesson', '11', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('44', 'Can view lesson', '11', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('45', 'Can add video', '12', 'add_video');
INSERT INTO `auth_permission` VALUES ('46', 'Can change video', '12', 'change_video');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete video', '12', 'delete_video');
INSERT INTO `auth_permission` VALUES ('48', 'Can view video', '12', 'view_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can add course resource', '13', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('50', 'Can change course resource', '13', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete course resource', '13', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('52', 'Can view course resource', '13', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('53', 'Can add city', '14', 'add_city');
INSERT INTO `auth_permission` VALUES ('54', 'Can change city', '14', 'change_city');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete city', '14', 'delete_city');
INSERT INTO `auth_permission` VALUES ('56', 'Can view city', '14', 'view_city');
INSERT INTO `auth_permission` VALUES ('57', 'Can add course org', '15', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('58', 'Can change course org', '15', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete course org', '15', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view course org', '15', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('61', 'Can add teacher', '16', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('62', 'Can change teacher', '16', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete teacher', '16', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('64', 'Can view teacher', '16', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('65', 'Can add course comments', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('66', 'Can change course comments', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete course comments', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('68', 'Can view course comments', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('69', 'Can add user ask', '18', 'add_userask');
INSERT INTO `auth_permission` VALUES ('70', 'Can change user ask', '18', 'change_userask');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete user ask', '18', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('72', 'Can view user ask', '18', 'view_userask');
INSERT INTO `auth_permission` VALUES ('73', 'Can add user course', '19', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('74', 'Can change user course', '19', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete user course', '19', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('76', 'Can view user course', '19', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('77', 'Can add user favorite', '20', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('78', 'Can change user favorite', '20', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete user favorite', '20', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('80', 'Can view user favorite', '20', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('81', 'Can add user message', '21', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('82', 'Can change user message', '21', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete user message', '21', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('84', 'Can view user message', '21', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('85', 'Can add User Widget', '22', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('86', 'Can change User Widget', '22', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete User Widget', '22', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can view User Widget', '22', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can add User Setting', '23', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('90', 'Can change User Setting', '23', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete User Setting', '23', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('92', 'Can view User Setting', '23', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('93', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('94', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('96', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('97', 'Can add Bookmark', '25', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('98', 'Can change Bookmark', '25', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete Bookmark', '25', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('100', 'Can view Bookmark', '25', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('101', 'Can add captcha store', '26', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('102', 'Can change captcha store', '26', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete captcha store', '26', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('104', 'Can view captcha store', '26', 'view_captchastore');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '微信小程序', 'banner/lunbo5.jpg', 'http://www.baidu.com', '5', '2020-03-24 20:02:12.487999');
INSERT INTO `banner` VALUES ('2', '智能建站', 'banner/lunbo4.jpg', 'http://www.baidu.com', '4', '2020-03-24 20:03:02.722327');
INSERT INTO `banner` VALUES ('3', '安卓专场', 'banner/lunbo6.jpg', 'http://www.qq.com', '6', '2020-03-24 20:03:59.117328');
INSERT INTO `banner` VALUES ('4', '大课堂', 'banner/lunbo3.jpg', 'http://www.google.com', '3', '2020-03-24 20:04:35.712384');
INSERT INTO `banner` VALUES ('5', '网页制作', 'banner/lunbo2.jpg', 'http://www.baidu.com', '2', '2020-03-24 20:05:02.280978');
INSERT INTO `banner` VALUES ('6', '电商设计', 'banner/lunbo1.jpg', 'http://www.baidu.com', '1', '2020-03-24 20:05:36.332164');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '北京市', '北京市', '2020-03-23 09:36:53.648859');
INSERT INTO `city` VALUES ('2', '深圳市', '深圳市', '2020-03-23 09:37:04.606709');
INSERT INTO `city` VALUES ('3', '上海市', '上海市', '2020-03-23 09:37:14.978121');
INSERT INTO `city` VALUES ('4', '广州市', '广州市', '2020-03-23 09:37:22.864672');
INSERT INTO `city` VALUES ('5', '成都市', '成都市', '2020-03-23 09:37:31.651173');
INSERT INTO `city` VALUES ('6', '重庆市', '重庆市', '2020-03-23 09:37:39.938705');
INSERT INTO `city` VALUES ('7', '天津市', '天津市', '2020-03-23 09:37:53.635925');
INSERT INTO `city` VALUES ('8', '南充市', '南充市', '2020-03-23 10:31:12.487498');
INSERT INTO `city` VALUES ('9', '三亚市', '三亚', '2020-03-23 10:53:06.830280');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desription` varchar(400) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(6) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `click_total` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `need_know` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `catory_id` int(11) NOT NULL,
  `courseorg_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_catory_id_315ebb9a_fk_coursetype_id` (`catory_id`),
  KEY `course_courseorg_id_b7f170c8_fk_courseorg_id` (`courseorg_id`),
  KEY `course_teacher_id_b694c4f5_fk_teacher_id` (`teacher_id`),
  CONSTRAINT `course_catory_id_315ebb9a_fk_coursetype_id` FOREIGN KEY (`catory_id`) REFERENCES `coursetype` (`id`),
  CONSTRAINT `course_courseorg_id_b7f170c8_fk_courseorg_id` FOREIGN KEY (`courseorg_id`) REFERENCES `courseorg` (`id`),
  CONSTRAINT `course_teacher_id_b694c4f5_fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'mysql入门', '数据库', '当前比较流行的数据库之一', 'cj', '1200', '300', '20', 'course/my.jpg', 'mysql，数据库', '2008', '2020-03-24 00:36:01.540181', '当前流行的数据库技术', '让你学习如何使用数据库和数据库的应用等', '2', '1', '2', '0');
INSERT INTO `course` VALUES ('2', 'Python编程快速上手', '入门书籍', '适合初学者学习', 'cj', '3400', '20', '12', 'course/python1.png', 'python', '24', '2020-03-24 01:03:03.967988', '能够教你使用它', '基础python以及应用', '1', '1', '2', '0');
INSERT INTO `course` VALUES ('3', '笨办法学Python', '基础python', '好书不用推荐', 'cj', '2800', '26', '20', 'course/python3.png', 'python', '100', '2020-03-23 12:27:44.903947', '这是什么，可以做什么', '如何使用，高级应用', '1', '4', '7', '0');
INSERT INTO `course` VALUES ('4', 'JAVA编程', 'java', 'java技术，一直不过时', 'zj', '1600', '120', '1000', 'course/java2.jpg', 'java', '1804', '2020-03-26 10:15:22.844493', 'java是什么，能做什么', '如果利用java高级编程实现', '3', '6', '6', '0');
INSERT INTO `course` VALUES ('5', '深入理解C#', '.NET', '.NET', 'zj', '1800', '200', '1001', 'course/net.jpg', '.net,C#', '1007', '2020-03-26 10:14:48.360968', '可以做什么', '轻松实现各种美化界面应用编程', '4', '5', '3', '0');
INSERT INTO `course` VALUES ('6', 'Django Web开发指南', 'Django教程', 'Django教程', 'cj', '1900', '205', '300', 'course/django.jpg', 'django python', '453', '2020-03-26 10:23:18.238978', '这是什么，能做什么', '轻松搭建django，让你实现全栈梦', '1', '1', '8', '0');
INSERT INTO `course` VALUES ('7', 'C++探秘', 'c++课程', 'c++课程', 'gj', '2500', '16', '10', 'course/c探秘.jpg', 'C++ C语言', '21', '2020-03-24 20:31:01.617732', '学习c++编程', '从入门到精通，到自己独立做项目', '5', '4', '7', '1');
INSERT INTO `course` VALUES ('8', 'C入门到精通', 'C语言', 'C语言', 'cj', '1600', '12', '13', 'course/c语言入门到精通.jpg', 'C C语言', '22', '2020-03-24 20:21:49.379430', 'C语言的认识和编程', 'C语言入门到精通', '6', '7', '9', '1');
INSERT INTO `course` VALUES ('9', 'Go语言入门', '号课程', '课程号，', 'zj', '2900', '30', '57', 'course/go语言编程入门.jpg', 'Go  GO go', '1000', '2020-03-24 20:25:31.166296', '认识GO语言，基础知识', '如何学号go语言，入门精通', '7', '8', '10', '1');
INSERT INTO `course` VALUES ('10', 'php专业项目开发', 'php实战项目研发', 'php实战项目研发', 'zj', '2000', '0', '0', 'course/php2.jpg', 'php 项目', '0', '2020-03-25 21:32:14.561689', '认识php和实战应用', '实战项目，手把手教学学会php', '8', '10', '11', '0');

-- ----------------------------
-- Table structure for coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `coursecomments`;
CREATE TABLE `coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(400) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coursecomments_course_id_3a5b62c9_fk_course_id` (`course_id`),
  KEY `coursecomments_user_id_8ecdafe5_fk_userprofile_id` (`user_id`),
  CONSTRAINT `coursecomments_course_id_3a5b62c9_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `coursecomments_user_id_8ecdafe5_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursecomments
-- ----------------------------

-- ----------------------------
-- Table structure for courseorg
-- ----------------------------
DROP TABLE IF EXISTS `courseorg`;
CREATE TABLE `courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext,
  `category` varchar(20) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `students` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `detail` longtext,
  PRIMARY KEY (`id`),
  KEY `courseorg_city_id_e58fd2c3_fk_city_id` (`city_id`),
  CONSTRAINT `courseorg_city_id_e58fd2c3_fk_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseorg
-- ----------------------------
INSERT INTO `courseorg` VALUES ('1', '中公教育集团', '中公教育集团创建于1999年，经过十余年潜心发展，中公教育已由一家北大毕业生自主创业的信息技术与教育服务机构，发展为教育服务业的综合性企业集团，成为集合面授教学培训、网校远程教育、图书教材及音像制品的出版发行于一体', 'pxjg', '1872', '1213', 'organ/zg_2NhirtR.jpg', '北京市海淀区学清路38号B座9层911室', '1200', '55', '2020-03-25 22:39:03.559125', '1', '<p>非常不错的培训机构，值得大家去体验，学习，提升自己</p><p><a href=\"‘http://www.ujiuye.com/’\">中公教育U就业官网</a><br/></p><table><tbody><tr class=\"firstRow\"><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">1</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">3</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">4</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">5</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">6</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">6</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8j</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jh</td></tr><tr><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhs</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhsa</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhsad</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhsadd</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhy</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">yu</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhsady</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">u8jhsa5</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">-98</td><td width=\"37\" valign=\"top\" style=\"word-break: break-all;\">ius</td></tr></tbody></table><p><br/></p>');
INSERT INTO `courseorg` VALUES ('2', '戴氏教育', '1989年,戴氏教育总裁,戴国斌先生毅然放弃赴美国深造机会,辞去公职,投身中国民办教育,自创DSE教学法并投入实践。不久,戴氏教育的前身,“戴氏家教”诞生。', 'pxjg', '1200', '100', 'organ/ds.jpg', '上海市外滩地区', '200', '28', '2020-03-23 10:40:14.333809', '3', '');
INSERT INTO `courseorg` VALUES ('3', '51CTO', '51CTO学院作为中国领先的IT职业在线教育及实战培训平台,秉承“学以致用”、 “因材施教”、“有教无类”的教育理念,提供辅导式“微职位”和自学式“视频课程”', 'gx', '45701', '23000', 'organ/51TO.jpg', '广州市番禺区', '3600', '35', '2020-03-24 00:36:07.228876', '4', '');
INSERT INTO `courseorg` VALUES ('4', '千峰集团', '锋教育隶属于北京千锋互联科技有限公司,一直秉承“用良心做教育”的理念,是中国IT职业教育领先品牌,全力打造互联网技术型研发人才服务优质平台。', 'pxjg', '2500', '390', 'organ/qf.jpg', '北京市朝阳区', '2300', '45', '2020-03-23 10:42:34.706832', '1', '');
INSERT INTO `courseorg` VALUES ('5', '清华大学', '是一所非常非常有名的学院，学习气氛浓厚，环境优美', 'gx', '59003', '23001', 'organ/qhd.jpg', '北京市好地方', '8900', '109', '2020-03-26 10:15:05.942137', '1', '');
INSERT INTO `courseorg` VALUES ('6', '达内教育', '研发、设计计算机软硬件、网络技术和产品以及通信技术；提供技术转让、技术咨询、技术服务、计算机技术培训；销售自行开发的产品', 'pxjg', '1200', '100', 'organ/dn.jpg', '北京市海定区', '200', '55', '2020-03-23 10:46:01.384392', '1', '');
INSERT INTO `courseorg` VALUES ('7', '黑马程序员', '黑马程序员专注于IT培训,开设java培训、人工智能培训、python培训、大数据培训、PHP培训、web前端培训、软件测试培训、产品经理培训、智能机器人软件开发培训等', 'pxjg', '2033', '120', 'organ/hm.jpg', '重庆市渝北区', '3456', '3000', '2020-03-23 10:47:30.596845', '6', '');
INSERT INTO `courseorg` VALUES ('8', '北大青鸟集团', '北大青鸟APTECH成立于1999年。依托北京大学优质雄厚的教育资源和背景，秉承“教育改变生活”的发展理念，一直致力于培养中国IT技能型紧缺人才。北大青鸟以完善的标准化管理为依托实现了体系的规模化发展，200余家授权培训中心遍布全国60多个重要城市', 'pxjg', '34568', '34343', 'organ/bdqn_SaD2Rxh_iwgPqXS.jpg', '成都市锦江区', '5648', '80', '2020-03-25 23:03:44.895723', '5', '<p><img src=\"/media/course/ueditor/weixin_20200325230236_557.png\" title=\"\" alt=\"weixin.png\"/> </p><p>北大青鸟图片</p><p>啊发顺丰</p>');
INSERT INTO `courseorg` VALUES ('9', '莫凡', '个人家教中心，服务态度相当好，技术很厉害', 'gr', '1209', '101', 'organ/mf.jpg', '成都市成华区', '120', '10', '2020-03-23 10:50:23.897540', '5', '');
INSERT INTO `courseorg` VALUES ('10', '劲动科技', '是一家科技公司，服务态度一流，行业佼佼者，技术过硬', 'pxjg', '13232', '10097', 'organ/jd2.png', '成都市郫都区', '12000', '1', '2020-03-25 21:32:14.566690', '5', '');
INSERT INTO `courseorg` VALUES ('11', '海南大学', '高校培训，值得认可', 'gx', '12000', '100', 'organ/ha.jpg', '海南省三亚市', '1200', '56', '2020-03-23 10:54:20.736080', '9', '');
INSERT INTO `courseorg` VALUES ('12', '重庆大学', '重大（CQU），是教育部直属的全国重点大学，中共中央直管副部级，由教育部和重庆市共建，“建筑老八校”之一，是国家“世界一流大学建设高校（A类）”、“211工程”和”985工程”首批重点建设', 'gx', '6000', '500', 'organ/cd.jpg', '重庆市沙坪坝区沙坪坝正街174号', '5000', '60', '2020-03-23 11:21:50.785487', '6', '');

-- ----------------------------
-- Table structure for courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courseresource`;
CREATE TABLE `courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `download_num` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courseresource_course_id_cbd3f6f1_fk_course_id` (`course_id`),
  CONSTRAINT `courseresource_course_id_cbd3f6f1_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseresource
-- ----------------------------
INSERT INTO `courseresource` VALUES ('1', 'django+xadmin', 'up_file/resource/django_xadmin学习文档.docx', '0', '2020-03-26 10:22:26.307053', '6');

-- ----------------------------
-- Table structure for coursetype
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES ('1', 'python', 'python课程');
INSERT INTO `coursetype` VALUES ('2', '数据库技术', '数据库技术');
INSERT INTO `coursetype` VALUES ('3', 'JAVA技术', null);
INSERT INTO `coursetype` VALUES ('4', '.NET技术', null);
INSERT INTO `coursetype` VALUES ('5', 'C++', 'C++');
INSERT INTO `coursetype` VALUES ('6', 'C语言', null);
INSERT INTO `coursetype` VALUES ('7', 'Go语言', null);
INSERT INTO `coursetype` VALUES ('8', 'php', null);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('26', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('13', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'coursetype');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('21', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'city');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('16', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecode');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('25', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-03-23 09:18:31.933043');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-03-23 09:18:32.583957');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-03-23 09:18:33.177980');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-03-23 09:18:35.224807');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-03-23 09:18:35.253807');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-03-23 09:18:35.284808');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-03-23 09:18:35.320806');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-03-23 09:18:35.340850');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-03-23 09:18:35.368802');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-03-23 09:18:35.403798');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-03-23 09:18:35.435795');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-03-23 09:18:35.904770');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-03-23 09:18:35.934767');
INSERT INTO `django_migrations` VALUES ('14', 'users', '0001_initial', '2020-03-23 09:18:37.196744');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2020-03-23 09:18:39.563563');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2020-03-23 09:18:40.547507');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2020-03-23 09:18:40.580507');
INSERT INTO `django_migrations` VALUES ('18', 'captcha', '0001_initial', '2020-03-23 09:18:40.803490');
INSERT INTO `django_migrations` VALUES ('19', 'organization', '0001_initial', '2020-03-23 09:18:41.369488');
INSERT INTO `django_migrations` VALUES ('20', 'courses', '0001_initial', '2020-03-23 09:18:45.470225');
INSERT INTO `django_migrations` VALUES ('21', 'operation', '0001_initial', '2020-03-23 09:18:49.138045');
INSERT INTO `django_migrations` VALUES ('22', 'operation', '0002_auto_20200323_0918', '2020-03-23 09:18:50.730926');
INSERT INTO `django_migrations` VALUES ('23', 'sessions', '0001_initial', '2020-03-23 09:18:53.511768');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0001_initial', '2020-03-23 09:18:54.517711');
INSERT INTO `django_migrations` VALUES ('25', 'operation', '0003_usermessage_title', '2020-03-23 23:34:08.831037');
INSERT INTO `django_migrations` VALUES ('26', 'courses', '0002_course_is_banner', '2020-03-24 19:52:51.388616');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0002_auto_20200325_2228', '2020-03-25 22:28:40.095913');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('anh5utyh4rwxvvgkrqqujp0fmem19nqy', 'M2RmYWE5NWE1YjNhZGNmMzczM2VkOGQyMTQwZWVhNjJlYTgyZDljNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVhYzExNmEyOGYzYWJlOTAzYmU0NjdhMmZmMzJkNmU1OGQyYjUwOGEiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwidmlkZW8iXSwiX3JlbF9sZXNzb25fX2lkX19leGFjdD01Il0sImlkIjoyfQ==', '2020-04-06 14:14:43.918030');
INSERT INTO `django_session` VALUES ('l826w76qw1ytkvlhqhp0ohro4qkczaj4', 'NDk5YWJmZGY4NjBjNjJhNzRlNmI3ODYyZjAyZmI5NWQxMzUwOWFiNTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyYTAxMDQ2MmJjYjU4ZTkzZGU0NDQyNmMzNDMwZTM2N2U0ZDQ0N2UifQ==', '2020-04-09 13:58:05.611687');
INSERT INTO `django_session` VALUES ('pd5vumjfcw70ltayac4wx3axrl4cu23y', 'ZjhiZTdmYTg0ZGE0MGU3ZTM1MzlmMWY2ODFjNDk4ZTJjOTMxNGM5MTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjIyYTAxMDQ2MmJjYjU4ZTkzZGU0NDQyNmMzNDMwZTM2N2U0ZDQ0N2UiLCJpZCI6Mn0=', '2020-04-06 19:19:04.330537');

-- ----------------------------
-- Table structure for emailverifycode
-- ----------------------------
DROP TABLE IF EXISTS `emailverifycode`;
CREATE TABLE `emailverifycode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emailverifycode
-- ----------------------------
INSERT INTO `emailverifycode` VALUES ('2', 's23BiIzGOyvYw2nj', '3267230399@qq.com', 'register', '2020-03-25 17:45:27.611839');

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desription` varchar(400) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lesson_course_id_0cde9fbb_fk_course_id` (`course_id`),
  CONSTRAINT `lesson_course_id_0cde9fbb_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '基础知识', '认识django', '2020-03-23 12:43:42.507725', '6');
INSERT INTO `lesson` VALUES ('2', '第一个django搭建', '走通django流程', '2020-03-23 12:44:17.610730', '6');
INSERT INTO `lesson` VALUES ('3', '深入django知识', '高级应用', '2020-03-23 12:44:36.307668', '6');
INSERT INTO `lesson` VALUES ('4', '基础知识', null, '2020-03-23 13:32:19.897710', '1');
INSERT INTO `lesson` VALUES ('5', '深入mysql', null, '2020-03-23 13:45:23.333166', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_positon` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `points` varchar(50) NOT NULL,
  `tdetail` longtext,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `courseorg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_courseorg_id_168b1f06_fk_courseorg_id` (`courseorg_id`),
  CONSTRAINT `teacher_courseorg_id_168b1f06_fk_courseorg_id` FOREIGN KEY (`courseorg_id`) REFERENCES `courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '黄晓明', 'teacher/hxm.jpg', '10', '中公教育', '技术总监', '45', '1', '详细的知识点讲解', '', '1000', '306', '2020-03-23 11:34:16.418239', '1');
INSERT INTO `teacher` VALUES ('2', '林心如', 'teacher/lxr.jpg', '12', '中公集团', 'web技术总监', '40', '0', '温柔大方', '非常厉害的web高手', '5000', '690', '2020-03-23 11:42:07.660342', '1');
INSERT INTO `teacher` VALUES ('3', '潘长江', 'teacher/pcj.jpg', '20', '清华大学', '技术院院长', '50', '1', '幽默风趣', '', '6000', '2000', '2020-03-23 11:45:46.821401', '5');
INSERT INTO `teacher` VALUES ('4', '邱淑贞', 'teacher/qsz.jpg', '16', '戴氏集团', '高级技术经理', '39', '0', '狂野式教学', '', '8000', '7000', '2020-03-23 11:56:15.888333', '2');
INSERT INTO `teacher` VALUES ('5', '邓超', 'teacher/dc.jpg', '19', '重庆大学', '开发部总监', '42', '1', '幽默，才华出众', '', '3000', '10', '2020-03-23 11:57:30.477049', '12');
INSERT INTO `teacher` VALUES ('6', '李欣', 'teacher/lx.jpg', '8', '达内集团', '技术工程师', '28', '0', '漂亮的小妹妹', '', '6000', '5999', '2020-03-23 11:59:25.554507', '6');
INSERT INTO `teacher` VALUES ('7', '王晶', 'teacher/default.png', '22', '千峰集团', '技术总监', '58', '1', '段子手有明的', '', '4001', '200', '2020-03-26 10:15:38.494208', '4');
INSERT INTO `teacher` VALUES ('8', '温俊鹏', 'teacher/default.png', '10', '中公集团', '高级技术讲师', '30', '1', '幽默风趣不开车', '好教师的榜样，nb技术', '2000', '2000', '2020-03-23 12:39:27.862193', '1');
INSERT INTO `teacher` VALUES ('9', '陈欧', 'teacher/default.png', '15', '黑马科技', '软件工程师', '30', '1', '嘻嘻哈哈', '', '1', '2', '2020-03-24 20:20:47.857702', '7');
INSERT INTO `teacher` VALUES ('10', '明道', 'teacher/default.png', '10', '北大集团', '副总裁', '33', '1', '帅气大方，爷们', '', '100', '130', '2020-03-24 20:24:15.510319', '8');
INSERT INTO `teacher` VALUES ('11', '杨颖', 'teacher/default.png', '5', '劲动科技集团', '高级工程师', '28', '0', '温柔贤淑大大访', '好教师', '0', '0', '2020-03-25 21:31:11.280085', '10');

-- ----------------------------
-- Table structure for userask
-- ----------------------------
DROP TABLE IF EXISTS `userask`;
CREATE TABLE `userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userask
-- ----------------------------

-- ----------------------------
-- Table structure for usercourse
-- ----------------------------
DROP TABLE IF EXISTS `usercourse`;
CREATE TABLE `usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usercourse_course_id_b87281f9_fk_course_id` (`course_id`),
  KEY `usercourse_user_id_400ee691_fk_userprofile_id` (`user_id`),
  CONSTRAINT `usercourse_course_id_b87281f9_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `usercourse_user_id_400ee691_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usercourse
-- ----------------------------
INSERT INTO `usercourse` VALUES ('1', '2020-03-23 13:14:27.008915', '6', '2');
INSERT INTO `usercourse` VALUES ('2', '2020-03-23 13:46:31.026321', '1', '2');
INSERT INTO `usercourse` VALUES ('3', '2020-03-23 19:35:37.650739', '5', '2');

-- ----------------------------
-- Table structure for userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `userfavorite`;
CREATE TABLE `userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userfavorite_user_id_bb118a7a_fk_userprofile_id` (`user_id`),
  CONSTRAINT `userfavorite_user_id_bb118a7a_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userfavorite
-- ----------------------------
INSERT INTO `userfavorite` VALUES ('1', '4', '2', '2020-03-23 14:37:05.327297', '2');
INSERT INTO `userfavorite` VALUES ('10', '4', '3', '2020-03-23 22:33:31.505400', '2');

-- ----------------------------
-- Table structure for usermessage
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `Is_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usermessage
-- ----------------------------
INSERT INTO `usermessage` VALUES ('1', '2', '您注册了Jdong在线学习网', '1', '2020-03-22 23:34:53.000000', '注册信息');
INSERT INTO `usermessage` VALUES ('3', '4', '欢迎您,成功注册Jdong在线网,请牢记密码', '0', '2020-03-25 17:45:27.595839', '注册成功信息');

-- ----------------------------
-- Table structure for userprofile
-- ----------------------------
DROP TABLE IF EXISTS `userprofile`;
CREATE TABLE `userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(30) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `QQnum` varchar(15) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userprofile
-- ----------------------------
INSERT INTO `userprofile` VALUES ('1', 'pbkdf2_sha256$150000$BzqTQyfjO32r$gTn5lbHS7qqFI4qsGkDdFOCTC7h5S5XLZNYobq2/+J4=', '2020-03-26 10:16:48.405796', '1', 'admin', '', '', 'aiduhuihuang@163.com', '1', '1', '2020-03-23 09:23:27.391208', '', null, '0', '', '', null, 'image/default.png');
INSERT INTO `userprofile` VALUES ('2', 'pbkdf2_sha256$150000$rLdes82TFQ10$iPX8nQgHcPXYUIflALvZJAU45GTpGEymee2n72Yc8zY=', '2020-03-26 10:22:57.698515', '0', '972022747@qq.com', '', '', '972022747@qq.com', '0', '1', '2020-03-23 12:20:40.862043', 'disers', '1992-09-14', '1', '四川省成都市', '972022747', '15928696398', 'image/972022747@qq.com.jpg');
INSERT INTO `userprofile` VALUES ('4', 'pbkdf2_sha256$150000$Lc8JbdN74NBC$b5S0louvaQVEl5ppNoe8mkYU0lmpkel8S5BwBen+RaE=', '2020-03-25 18:46:00.000000', '0', '3267230399@qq.com', '', '', '3267230399@qq.com', '0', '1', '2020-03-25 17:45:00.000000', 'dddlss', '1990-02-01', '1', 'safafas', '232347644', '1212322334', 'image/wj_qxcrkeG.jpg');

-- ----------------------------
-- Table structure for userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `userprofile_groups`;
CREATE TABLE `userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_groups_userprofile_id_group_id_850640d8_uniq` (`userprofile_id`,`group_id`),
  KEY `userprofile_groups_group_id_e25cf300_fk_auth_group_id` (`group_id`),
  CONSTRAINT `userprofile_groups_group_id_e25cf300_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `userprofile_groups_userprofile_id_ffc3c019_fk_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `userprofile_user_permissions`;
CREATE TABLE `userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_user_permiss_userprofile_id_permissio_b528d16d_uniq` (`userprofile_id`,`permission_id`),
  KEY `userprofile_user_per_permission_id_7fd54787_fk_auth_perm` (`permission_id`),
  CONSTRAINT `userprofile_user_per_permission_id_7fd54787_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `userprofile_user_per_userprofile_id_50a5dd7d_fk_userprofi` FOREIGN KEY (`userprofile_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userprofile_user_permissions
-- ----------------------------
INSERT INTO `userprofile_user_permissions` VALUES ('2', '4', '33');
INSERT INTO `userprofile_user_permissions` VALUES ('3', '4', '34');
INSERT INTO `userprofile_user_permissions` VALUES ('4', '4', '35');
INSERT INTO `userprofile_user_permissions` VALUES ('5', '4', '36');
INSERT INTO `userprofile_user_permissions` VALUES ('6', '4', '53');
INSERT INTO `userprofile_user_permissions` VALUES ('7', '4', '54');
INSERT INTO `userprofile_user_permissions` VALUES ('8', '4', '55');
INSERT INTO `userprofile_user_permissions` VALUES ('9', '4', '56');
INSERT INTO `userprofile_user_permissions` VALUES ('10', '4', '61');
INSERT INTO `userprofile_user_permissions` VALUES ('11', '4', '62');
INSERT INTO `userprofile_user_permissions` VALUES ('12', '4', '63');
INSERT INTO `userprofile_user_permissions` VALUES ('1', '4', '64');

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pathaddress` varchar(300) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `desription` varchar(400) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `video_lesson_id_43319a4d_fk_lesson_id` (`lesson_id`),
  CONSTRAINT `video_lesson_id_43319a4d_fk_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', '基础知识一', 'http://q7h7sgykl.bkt.clouddn.com/3.17-01-%E8%AF%BE%E7%A8%8B%E5%9B%9E%E9%A1%BE.mp4', '11', '基础知识', '2020-03-23 13:11:41.782305', '1');
INSERT INTO `video` VALUES ('2', '基础作业讲解', 'http://q7h7sgykl.bkt.clouddn.com/3.17-07-%E4%BD%9C%E4%B8%9A.mp4', '20', null, '2020-03-23 13:12:36.200210', '1');
INSERT INTO `video` VALUES ('3', '蓝图讲解', 'http://q7h7sgykl.bkt.clouddn.com/3.19-05-%E8%93%9D%E5%9B%BE%E4%B8%AD%E4%BD%BF%E7%94%A8restful.mp4', '7', null, '2020-03-23 13:13:00.957834', '2');
INSERT INTO `video` VALUES ('4', '深入知识讲解', 'http://q7h7sgykl.bkt.clouddn.com/3.19-05-%E8%93%9D%E5%9B%BE%E4%B8%AD%E4%BD%BF%E7%94%A8restful.mp4', '7', null, '2020-03-23 13:13:36.278800', '3');
INSERT INTO `video` VALUES ('5', '作业讲解', 'http://q7h7sgykl.bkt.clouddn.com/3.17-07-%E4%BD%9C%E4%B8%9A.mp4', '20', null, '2020-03-23 13:13:57.877570', '3');
INSERT INTO `video` VALUES ('6', 'mysql简介', 'http://q7h7sgykl.bkt.clouddn.com/%E7%AC%AC%E4%B8%80%E7%AB%A01-4.mp4', '14', '数据库知识', '2020-03-23 13:43:55.547155', '4');
INSERT INTO `video` VALUES ('7', '语法讲解', 'http://q7h7sgykl.bkt.clouddn.com/%E7%AC%AC%E4%B8%80%E7%AB%A05-7.mp4', '16', 'mysql语法', '2020-03-23 13:44:21.298716', '4');
INSERT INTO `video` VALUES ('8', '深入学习', 'http://q7h7sgykl.bkt.clouddn.com/%E7%AC%AC%E5%9B%9B%E7%AB%A01-3.mp4', '35', null, '2020-03-23 14:14:43.015081', '5');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2020-03-23 09:36:53.650809', '127.0.0.1', '1', '北京市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2020-03-23 09:37:04.609711', '127.0.0.1', '2', '深圳市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2020-03-23 09:37:14.982123', '127.0.0.1', '3', '上海市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2020-03-23 09:37:22.866672', '127.0.0.1', '4', '广州市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2020-03-23 09:37:31.652173', '127.0.0.1', '5', '成都市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2020-03-23 09:37:39.940703', '127.0.0.1', '6', '重庆市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2020-03-23 09:37:53.637924', '127.0.0.1', '7', '天津市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2020-03-23 10:31:12.490498', '127.0.0.1', '8', '南充市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2020-03-23 10:38:23.357301', '127.0.0.1', '1', '中公教育集团', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2020-03-23 10:40:14.336808', '127.0.0.1', '2', '戴氏教育', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2020-03-23 10:41:31.891403', '127.0.0.1', '3', '51CTO', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2020-03-23 10:42:34.709832', '127.0.0.1', '4', '千峰集团', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2020-03-23 10:44:41.174433', '127.0.0.1', '5', '清华大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2020-03-23 10:46:01.395391', '127.0.0.1', '6', '达内教育', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2020-03-23 10:47:30.598845', '127.0.0.1', '7', '黑马程序员', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2020-03-23 10:49:16.896348', '127.0.0.1', '8', '北大青鸟集团', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2020-03-23 10:50:23.901539', '127.0.0.1', '9', '莫凡', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2020-03-23 10:52:22.105824', '127.0.0.1', '10', '劲动科技', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2020-03-23 10:53:06.831282', '127.0.0.1', '9', '三亚市', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2020-03-23 10:54:20.738080', '127.0.0.1', '11', '海南大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2020-03-23 11:21:50.786516', '127.0.0.1', '12', '重庆大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2020-03-23 11:34:16.421239', '127.0.0.1', '1', '黄晓明(中公教育集团)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2020-03-23 11:42:07.661341', '127.0.0.1', '2', '林心如(中公教育集团)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2020-03-23 11:45:46.824402', '127.0.0.1', '3', '潘长江(清华大学)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2020-03-23 11:56:15.891286', '127.0.0.1', '4', '邱淑贞(戴氏教育)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2020-03-23 11:57:30.479050', '127.0.0.1', '5', '邓超(重庆大学)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2020-03-23 11:59:25.555508', '127.0.0.1', '6', '李欣(达内教育)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2020-03-23 12:15:17.888396', '127.0.0.1', '1', 'python', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2020-03-23 12:15:30.014706', '127.0.0.1', '2', '数据库技术', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2020-03-23 12:19:41.442420', '127.0.0.1', '1', 'mysql入门(中公教育集团)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2020-03-23 12:24:01.297653', '127.0.0.1', '2', 'Python编程快速上手(中公教育集团)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2020-03-23 12:26:36.460836', '127.0.0.1', '7', '王晶(千峰集团)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2020-03-23 12:27:44.907950', '127.0.0.1', '3', '笨办法学Python(千峰集团)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2020-03-23 12:27:57.929210', '127.0.0.1', '3', 'JAVA技术', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2020-03-23 12:30:04.234030', '127.0.0.1', '4', 'JAVA编程(达内教育)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2020-03-23 12:30:49.497462', '127.0.0.1', '4', '.NET技术', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2020-03-23 12:32:22.310186', '127.0.0.1', '5', '深入理解C#(清华大学)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2020-03-23 12:39:27.864193', '127.0.0.1', '8', '温俊鹏(中公教育集团)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2020-03-23 12:40:51.521439', '127.0.0.1', '6', 'Django Web开发指南(中公教育集团)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2020-03-23 12:43:42.510725', '127.0.0.1', '1', '基础知识(Django Web开发指南(中公教育集团))', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2020-03-23 12:44:17.613729', '127.0.0.1', '2', '第一个django搭建(Django Web开发指南(中公教育集团))', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2020-03-23 12:44:36.310667', '127.0.0.1', '3', '深入django知识(Django Web开发指南(中公教育集团))', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2020-03-23 13:11:41.784305', '127.0.0.1', '1', '基础知识一', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2020-03-23 13:12:36.203212', '127.0.0.1', '2', '基础作业讲解', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2020-03-23 13:13:00.959806', '127.0.0.1', '3', '蓝图讲解', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2020-03-23 13:13:36.280827', '127.0.0.1', '4', '深入知识讲解', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2020-03-23 13:13:57.879572', '127.0.0.1', '5', '作业讲解', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2020-03-23 13:32:19.898709', '127.0.0.1', '4', '基础知识(mysql入门(中公教育集团))', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2020-03-23 13:43:55.548183', '127.0.0.1', '6', 'mysql简介', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2020-03-23 13:44:21.300692', '127.0.0.1', '7', '语法讲解', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2020-03-23 13:45:23.333166', '127.0.0.1', '5', '深入mysql(mysql入门(中公教育集团))', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2020-03-23 14:14:43.016081', '127.0.0.1', '8', '深入学习', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2020-03-24 20:02:12.490998', '127.0.0.1', '1', 'Banner object (1)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2020-03-24 20:03:02.725327', '127.0.0.1', '2', 'Banner object (2)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2020-03-24 20:03:59.118335', '127.0.0.1', '3', 'Banner object (3)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2020-03-24 20:04:35.716385', '127.0.0.1', '4', 'Banner object (4)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('57', '2020-03-24 20:05:02.283972', '127.0.0.1', '5', 'Banner object (5)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2020-03-24 20:05:36.334160', '127.0.0.1', '6', 'Banner object (6)', 'create', '已添加。', '6', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2020-03-24 20:17:46.312353', '127.0.0.1', '5', 'C++', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2020-03-24 20:19:18.593446', '127.0.0.1', '7', 'C++探秘(千峰集团)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2020-03-24 20:19:51.624693', '127.0.0.1', '6', 'C语言', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2020-03-24 20:20:47.874701', '127.0.0.1', '9', '陈欧(黑马程序员)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2020-03-24 20:21:49.382431', '127.0.0.1', '8', 'C入门到精通(黑马程序员)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2020-03-24 20:22:15.927020', '127.0.0.1', '7', 'Go语言', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2020-03-24 20:24:15.514319', '127.0.0.1', '10', '明道(北大青鸟集团)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2020-03-24 20:25:31.168295', '127.0.0.1', '9', 'Go语言入门(北大青鸟集团)', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2020-03-25 18:45:36.220385', '127.0.0.1', '4', '3267230399@qq.com', 'change', '修改 last_login，user_permissions，is_staff，nick_name，birthday，gender，address，QQnum，mobile 和 image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2020-03-25 18:47:09.454387', '127.0.0.1', '4', '3267230399@qq.com', 'change', '修改 last_login，is_staff 和 image', '8', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2020-03-25 21:28:43.082030', '127.0.0.1', '8', 'php', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('70', '2020-03-25 21:31:11.283084', '127.0.0.1', '11', '杨颖(劲动科技)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2020-03-25 22:37:32.245024', '127.0.0.1', '1', '中公教育集团', 'change', '修改 detail 和 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2020-03-25 22:41:05.738570', '127.0.0.1', '8', '北大青鸟集团', 'change', '修改 detail 和 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2020-03-25 23:03:11.909492', '127.0.0.1', '8', '北大青鸟集团', 'change', '修改 detail 和 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2020-03-25 23:03:11.932491', '127.0.0.1', '8', '北大青鸟集团', 'change', '修改 detail 和 image', '15', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2020-03-26 10:22:26.309052', '127.0.0.1', '1', 'CourseResource object (1)', 'create', '已添加。', '13', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'dashboard:home:pos', '', '4');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
