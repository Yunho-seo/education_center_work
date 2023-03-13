-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- bbk 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `bbk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bbk`;

-- 테이블 bbk.buytbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `buytbl` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` char(8) DEFAULT NULL,
  `gCode` varchar(20) DEFAULT NULL,
  `amount` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  KEY `gCode` (`gCode`) USING BTREE,
  CONSTRAINT `FK_goods` FOREIGN KEY (`gCode`) REFERENCES `goods` (`gCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_usertbl` FOREIGN KEY (`userID`) REFERENCES `usertbl` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 bbk.buytbl:~0 rows (대략적) 내보내기
INSERT INTO `buytbl` (`num`, `userID`, `gCode`, `amount`) VALUES
	(1, 'KBS', 'A1', 2),
	(2, 'KBS', 'A2', 1),
	(3, 'JYP', 'A3', 1),
	(4, 'BBK', 'A3', 5),
	(5, 'KBS', 'A4', 3),
	(6, 'BBK', 'A5', 10),
	(7, 'SSK', 'A6', 5),
	(8, 'EJW', 'A6', 2),
	(9, 'EJW', 'A4', 1),
	(10, 'BBK', 'A1', 2),
	(11, 'EJW', 'A6', 1),
	(12, 'BBK', 'A1', 2);

-- 테이블 bbk.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `gCode` varchar(20) NOT NULL,
  `groupName` varchar(20) DEFAULT NULL,
  `prodName` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`gCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 bbk.goods:~0 rows (대략적) 내보내기
INSERT INTO `goods` (`gCode`, `groupName`, `prodName`, `price`) VALUES
	('A1', '의류', '운동화', 30),
	('A2', '전자', '노트북', 1000),
	('A3', '전자', '모니터', 200),
	('A4', '의류', '청바지', 50),
	('A5', '전자', '메모리', 80),
	('A6', '서적', '책', 15);

-- 테이블 bbk.usertbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `usertbl` (
  `userID` char(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthYear` int(11) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `mobile1` char(3) DEFAULT NULL,
  `mobile2` char(8) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 bbk.usertbl:~10 rows (대략적) 내보내기
INSERT INTO `usertbl` (`userID`, `name`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-05-05'),
	('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-03-03'),
	('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10'),
	('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-04-04'),
	('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-04-04'),
	('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-07-07'),
	('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-09-09'),
	('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-08-08'),
	('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12'),
	('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-05-05');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
