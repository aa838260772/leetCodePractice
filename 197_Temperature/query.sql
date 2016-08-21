/*
* @Author: aa838260772
* @Date:   2016-08-18 19:20:58
* @Last Modified by:   aa838260772
* @Last Modified time: 2016-08-18 19:29:27
*/
#查找比前一天温度高的并是输出Id
select w1.Id from Weather w1,Weather w2 where w1.Temperature > w2.Temperature and to_days(w1.Date)-to_days(w2.Date)=1

#查询每个日期前面有多少天是温度比当日低的
select w1.Date,sum(if(w1.Temperature<w2.Temperature,null,1))+1 from Weather w1,Weather w2 where w2.Date<w1.Date  group by w1.Date;


