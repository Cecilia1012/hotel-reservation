-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-12-24 14:37:58
-- 服务器版本： 5.7.24
-- PHP 版本： 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `hotel`
--

-- --------------------------------------------------------

--
-- 表的结构 `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `ID` int(11) NOT NULL COMMENT '酒店ID',
  `name` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '酒店名称',
  `city` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '所在城市',
  `address` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '酒店地址',
  `level` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '酒店级别',
  `phone` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '客服电话',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='酒店表';

--
-- 转存表中的数据 `hotel`
--

INSERT INTO `hotel` (`ID`, `name`, `city`, `address`, `level`, `phone`) VALUES
(1, '北京首都机场T3驿站', '北京', '北京 顺义区 岗山路42号10栋B座1-2层', '二星及以下/经济', '13671048204'),
(2, '北京A+麒寓酒店', '北京', '北京 朝阳区 双桥东路甲6号', '二星及以下/经济', '010-57143257'),
(3, '西湖茶墅酒店', '杭州', '杭州 西湖区 三台山路186号', '三星级/舒适', '0571-88224950'),
(4, '满月客栈(西湖灵隐店)', '杭州', '杭州 西湖区 天竺路107号', '二星及以下/经济', '13346165325'),
(5, '上海迪堡王国酒店', '上海', '上海 浦东新区 川图路300号30幢', '二星及以下/经济', '17721377697'),
(6, '上海迪漫酒店', '上海', '上海 浦东新区 川图路300号32栋', '二星及以下/经济', '18017550159'),
(7, '秋果酒店', '杭州', '余杭区五常街道荆长路768号6幢A区', '四星级/高档', '0571-88736688'),
(8, '杭州马可波罗假日酒店', '杭州', '杭州 上城区 平海路38号', '四星级/高档', '0571-87018888'),
(9, '杭州中维香溢大酒店', '杭州', '杭州 上城区 解放路108号', '五星级/豪华', '0571-87218899'),
(10, '浙江国际大酒店', '杭州', '杭州 下城区 体育场路221号', '五星级/豪华', '0571-85770088');

-- --------------------------------------------------------

--
-- 表的结构 `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `userID` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `password` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '密码',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='登录表';

--
-- 转存表中的数据 `login`
--

INSERT INTO `login` (`userID`, `password`) VALUES
('13566775514', '123456'),
('17376592394', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `order_table`
--

DROP TABLE IF EXISTS `order_table`;
CREATE TABLE IF NOT EXISTS `order_table` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `userID` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `orderTime` text COLLATE utf8_bin NOT NULL COMMENT '下单时间',
  `total_price` float NOT NULL COMMENT '总价',
  `state` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `in_time` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '入住时间',
  `out_time` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '退房时间',
  `idNum` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  `hotelname` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '酒店名称',
  `room_type` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '房间类型',
  `room_num` int(3) NOT NULL COMMENT '房间数量',
  `adult` int(3) NOT NULL COMMENT '成人数量',
  `children` int(3) NOT NULL COMMENT '儿童数量',
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

--
-- 转存表中的数据 `order_table`
--

INSERT INTO `order_table` (`orderID`, `userID`, `orderTime`, `total_price`, `state`, `in_time`, `out_time`, `idNum`, `hotelname`, `room_type`, `room_num`, `adult`, `children`) VALUES
(1, '17376592394', '2019-12-22 23:57:26', 1300, '已取消', '2019-12-23', '2019-12-24', '330702199810124426', '浙江国际大酒店', '大床', 1, 1, 0),
(2, '17376592394', '2019-12-23 00:06:40', 540, '已支付', '2019-12-25', '2019-12-27', '330702199810124426', '上海迪堡王国酒店', '单人床', 2, 2, 0),
(3, '17376592394', '2019-12-23 10:54:38', 3960, '已支付', '2019-12-26', '2019-12-26', '330702199810124426', '北京首都机场T3驿站', '多床', 2, 3, 1),
(4, '13566775514', '2019-12-24 14:43:56', 1080, '已取消', '2019-12-24', '2019-12-25', '330702199810124426', '北京A+麒寓酒店', '单人床', 4, 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userID` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户ID',
  `userName` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `nickName` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `sex` varchar(4) COLLATE utf8_bin NOT NULL COMMENT '性别',
  `idNum` varchar(25) COLLATE utf8_bin NOT NULL COMMENT '身份证号',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户基本信息表';

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`userID`, `userName`, `nickName`, `sex`, `idNum`) VALUES
('13566775514', '邵琦 ', 'Angel', '女', '330702199810124426'),
('17376592394', '邵琦  ', 'Cecilia', '女', '330702199810124426');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
