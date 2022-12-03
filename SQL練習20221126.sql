
--51問題：全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はCASE関数を使用してplayer_idを「9999」と表示してください。
select  case  when player_id is null then 9999 else player_id end, goal_time from goals order by player_id des
 --case when **** then 変わる数字 else 正常 end
	
--52問題：全ての選手の平均身長、平均体重を表示してください。(グループ関数（AVG）)
select AVG(height)as 平均身長, AVG(weight)as 平均体重 from players

--53問題：日本の選手（player_idが714から736）が上げたゴール数を表示してください。
select count( id )as 日本のゴール数 from goals where 736 >= player_id and player_id >= 714
 --通?ID来?算个数,count用于?算数据?表中的行数
 
--54問題：オウンゴール（player_idがNULL）以外の総ゴール数を表示してください。ただし、WHERE句は使用しないでください。
select count(player_id)as オウンゴール以外のゴール数 from goals
 --去NULL?的?行数

--55問題：全ての選手の中で最も高い身長と、最も重い体重を表示してください。
select MAX(height)as 最大身長,  MAX(weight)as 最大体重 from players

--56問題：AグループのFIFAランク最上位を表示してください。
select MIN(ranking)as AグループのFIFAランク最上位 from countries where group_name = 'A';

--57問題：CグループのFIFAランクの合計値を表示してください。
select SUM(ranking)as CグループのFIFAランク合計値 from countries where group_name = 'C';

--58問題：全ての選手の所属国と名前、背番号を表示してください。
select c.name as name, p.name as playerName, p.uniform_num from countries c left join players p on p.country_id = c.id
select c.name as name, p.name as playerName, p.uniform_num from countries c join players p on p.country_id = c.id
 --JOINはINNER JOINの省略形ですので、どちらを使っても問題ありません

--59問題：全ての試合の国名と選手名、得点時間を表示してください。オウンゴール（player_idがNULL）は表示しないでください。
select c.name as name, p.name as playerName, g.goal_time from countries c inner join players p  on p.country_id = c.id inner join goals g on g.player_id = p.id	

--60問題：全ての試合のゴール時間と選手名を表示してください。左側外部結合を使用してオウンゴール（player_idがNULL）も表示してください。
select g.goal_time, p.uniform_num , p.position, p.name from goals g left join players p  on p.id = g.player_id 

--61問題：全ての試合のゴール時間と選手名を表示してください。右側外部結合を使用してオウンゴール（player_idがNULL）も表示してください。
select g.goal_time, p.uniform_num , p.position, p.name from players p right join goals g  on p.id = g.player_id  

--62問題：全ての試合のゴール時間と選手名、国名を表示してください。また、オウンゴール（player_idがNULL）も表示してください。
select c.name as country_name, g.goal_time,  p.position, p.name as players_name from goals g left join players p  on p.id = g.player_id left join countries c on c.id = p.country_id

--63問題：全ての試合のキックオフ時間と対戦国の国名を表示してください。自己結合
select p.kickoff, c.name as my_country, d.name as enemy_country from pairings p inner join countries c on c.id = my_country_id inner join countries d on d.id = enemy_country_id
	--1,このように同じテーブルを2度以上つかって結合することもできます。pairingsテーブルのmy_country_idとenemy_country_idはどちらもcountriesテーブルのPKを格納している外部キーになります。
	--2,my_countryを表示するためとenemy_countryを表示するために2つのcountriesテーブルを別々にJOINする必要があります。

