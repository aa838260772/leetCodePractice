/*
* @Author: aa838260772
* @Date:   2016-08-18 14:45:50
* @Last Modified by:   aa838260772
* @Last Modified time: 2016-08-20 23:40:49
*/

##先创建Users表
use leetcode;

CREATE TABLE `Users` (
  `Users_Id` int(8) NOT NULL DEFAULT '0',
  `Banned` varchar(8) NOT NULL DEFAULT '',
  `Role` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Users_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

Create Table: CREATE TABLE `Trips` (
  `Id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `Client_Id` int(8) NOT NULL DEFAULT '0',
  `Driver_Id` int(8) NOT NULL DEFAULT '0',
  `City_Id` int(8) NOT NULL DEFAULT '0',
  `Status` varchar(20) NOT NULL DEFAULT '',
  `Request_at` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `client` (`Client_Id`),
  KEY `driver` (`Driver_Id`),
  CONSTRAINT `client` FOREIGN KEY (`Client_Id`) REFERENCES `Users` (`Users_Id`),
  CONSTRAINT `driver` FOREIGN KEY (`Driver_Id`) REFERENCES `Users` (`Users_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8

#数据插入(Users)
insert into `Users` values(1,'No','client'),(2,'yes','client'),(3,'No','client'),(4,'No','client'),(10,'No','driver'),(11,'No','driver'),(12,'No','driver'),(13,'No','driver');

insert into `Trips` values(1,1,10,1,'completed','2013-10-01'),(2,2,11,1,'cancelled_by_driver','2013-10-01'),(3,3,12,6,'completed','2013-10-01'),(4,4,13,6,'cancelled_by_client','2013-10-01'),(5,1,10,1,'completed','2013-10-02'),(6,2,11,6,'completed','2013-10-02'),(7,3,12,6,'completed','2013-10-02'),(8,2,12,12,'completed','2013-10-03'),(9,3,10,12,'completed','2013-10-03'),(10,4,13,12,'cancelled_by_driver','2013-10-03');
#数据插入(Trips)

##插入数据时候建立触发器(没设置Request_at时默认当天)
delimiter //
create trigger `trigger_date`
before insert on `Trips`
for each row
begin
	if new.Request_at is null then
    set new.Request_at=curdate();
 	end if;
end;
//
delimiter ;

