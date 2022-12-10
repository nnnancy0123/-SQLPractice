--1問題:各グループの中でFIFAランクが最も高い国と低い国のランキング番号を表示してください。
select
  group_name as グループ
  , min(ranking) as ランキング最上位
  , max(ranking) as 最下位ランキング 
from
  countries 
group by
  group_name 
order by
  group_name ASC                                  --意外と勘違いしやすいポイントとして、MIN()関数を使った方がランキング最上位、MAX()関数を使った方がランキング最下位となりますので注意
  --2問題：各国の平均身長を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
  select
  c.name as 国名
  , avg(p.height) as 平均身長 
from
  countries c 
  left join players p 
    on c.id = p.country_id 
group by
  c.name 
order by
  avg(p.height) desc                              --70問題：1980年生まれと、1981年生まれの選手が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
  select
  '1980' as 誕生年
  , count(id) 
from
  players 
WHERE
  birth BETWEEN '1980-1-1' AND '1980-12-31' 
union 
select
  '1981' as 誕生年
  , count(id) 
from
  players 
WHERE
  birth BETWEEN '1981-1-1' AND '1981-12-31'       --回答：‘描述'，是死的。用以描述BETWEEN '1981-1-1' AND '1981-12-31'?个方位的?
  
--3問題：各国の平均身長を高い方から順に表示してください。ただし、FROM句はcountriesテーブルとしてください。
  
  select
  c.name as 国名
  , avg(p.height) as 平均身長 
from
  countries c 
  left join players p 
    on c.id = p.country_id 
group by
  c.name
  ,c.id
order by avg(p.height) DESC

--3問題：各国の平均身長を高い方から順に表示してください。ただし、FROM句はplayersテーブルとして、テーブル結合を使わず副問合せを用いてください。

