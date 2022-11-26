--25問題：全選手の以下のデータを抽出してください。
select uniform_num,name,club from players;

--26問題：グループCに所属する国をすべて抽出してください。
select * from countries where group_name = 'C';

--27問題：グループC以外に所属する国をすべて抽出してください。
select * from countries where group_name != 'C';
select * from countries where group_name <>'C';

--28問題：2016年1月13日現在で40歳以上の選手を抽出してください。（誕生日の人を含めてください。）
select* from players where birth <= '1976-1-13' ;

--29問題：身長が170cm未満の選手を抽出してください。
select * from players where height < '170';

--30問題:FIFAランクが日本（46位）の前後10位に該当する国（36位～56位）を抽出してください。ただし、BETWEEN句を用いてください。
select * from countries where ranking between 36 and 56;

--31問題:選手のポジションがGK、DF、MFに該当する選手をすべて抽出してください。ただし、IN句を用いてください。
select * from players where  position in ('GK', 'DF', 'MF');

--32問題:オウンゴールとなったゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
select * from goals where player_id is null;  --is null

--33問題：オウンゴール以外のゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
select * from goals where player_id is not null; --is not null

--34問題：名前の末尾が「ニョ」で終わるプレイヤーを抽出してください。
select * from  players where name like '%ニョ'; --like '%X' or like'_X'/選択（LIKE前方or後方）
select * from  players where name like '_ニョ_';

--35問題：名前の末尾が「ニョ」で終わるプレイヤーを抽出してください。
select * from players where name like '%ニョ%'; --選択（LIKE前方or後方）
select * from players where name like '__ニョ%';

--36問題：グループA以外に所属する国をすべて抽出してください。ただし、「!=」や「<>」を使わずに、「NOT」を使用してください。
select * from countries where group_name not like 'A';
select * from countries where not group_name = 'A' ;

--37問題：全選手の中でBMI値が20台の選手を抽出してください。BMIは以下の式で求めることができます。
select * from players where weight / POW(height / 100.00, 2)>=20 and weight / POW(height / 100.00, 2)<21; --int?成float?型

--38問題：全選手の中から小柄な選手（身長が165cm未満か、体重が60kg未満）を抽出してください。
select* from players where height < 165 or weight < 60; --OR演算子

--39問題：FWかMFの中で170未満の選手を抽出してください。ただし、ORとANDを使用してください。
select * from players where (position =' FW' or position = 'MF' )and height < 170;
--select * from players where position = 'FW' or position = 'MF' and height < 170  error解決「FWの選手、もしくはMFで170cm未満の選手」

--40問題：ポジションの一覧を表示してください。グループ化は使用しないでください。DISTINCT
select distinct position from players; --用于去除重???，只?取唯一的??

--41問題：全選手の身長と体重を足した値を表示してください。合わせて選手の名前、選手の所属クラブも表示してください。算術演算子（SELECT句）
select name, club, height + weight from players;

--42問題：選手名とポジションを以下の形式で出力してください。シングルクォートに注意してください。文字列結合、エスケープシーケンス
select concat(name,'選手のポジションは',position,'です') from players; 

--43問題：全選手の身長と体重を足した値をカラム名「体力指数」として表示してください。合わせて選手の名前、選手の所属クラブも表示してください。列見出し
select name, club, (height + weight)as 体力指数 from players;

--44問題:FIFAランクの高い国から順にすべての国名を表示してください。
select * from countries order by ranking; --ソート（単一カラム）

--45問題:全ての選手を年齢の低い順に表示してください。なお、年齢を計算する必要はありません。
select * from players order by birth desc; --ソート（降順）

--46問題：全ての選手を身長の大きい順に表示してください。同じ身長の選手は体重の重い順に表示してください。ソート（複数カラム）
select * from players order by height desc , weight desc;

--47問題：全ての選手のポジションの1文字目（GKであればG、FWであればF）を出力してください。単一行関数（文字列関数）
select id, country_id, uniform_num, SUBSTRING(position,1,1),name from players; --1st 1 characters of position

--48問題：出場国の国名が長いものから順に出力してください。単一行関数（文字列関数）
select name,length(name) from countries order by length(name) desc ;

--49問題：全選手の誕生日を「2017年04月30日」のフォーマットで出力してください。
select name, to_char(cast(birth as date), 'IYYY年I月I日') as birthday from players;  -- to_char(time,'YYYY')

--50問題：全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はIFNULL関数を使用してplayer_idを「9999」と表示してください。単一行関数（IFNULL）
select COALESCE(player_id,9999), goal_time  from goals order by player_id desc --COALESCE(テーブルの値, 'input値')=IFNULL

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
	
