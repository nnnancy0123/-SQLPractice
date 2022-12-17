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
  group_name ASC                                 
 --意外と勘違いしやすいポイントとして、MIN()関数を使った方がランキング最上位、MAX()関数を使った方がランキング最下位となりますので注意
 
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
  avg(p.height) desc                              

--70問題：1980年生まれと、1981年生まれの選手が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
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
  birth BETWEEN '1981-1-1' AND '1981-12-31'       
--回答：‘描述'，是死的。用以描述BETWEEN '1981-1-1' AND '1981-12-31'?个方位的?
  
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

--4問題：各国の平均身長を高い方から順に表示してください。ただし、FROM句はplayersテーブルとして、テーブル結合を使わず副問合せを用いてください。
 
 select
 (select c.name from countries c where c.id = p.country_id)as 国名 
 ,avg(p.height) as 平均身長
from 
  players p
  group by
  p.country_id
order by avg(p.height) DESC

--5問題：キックオフ日時と対戦国の国名をキックオフ日時の早いものから順に表示してください。
select
  p.kickoff as キックオフ日時
  , c2.name as 国名
  , c1.name as 敵国 
from
  pairings p 
  left join countries c1 
    on c1.id = p.my_country_id 
  left join countries c2 
    on c2.id = p.enemy_country_id 
order by
  kickoff
  
--6問題：すべての選手を対象として選手ごとの得点ランキングを表示してください。（SELECT句で副問合せを使うこと）
select
  p.name as 名前
  , p.position as ポジション
  , p.club as 所属クラブ
  , ( 
    select
      count(id) 
    from
      goals g 
    where
      g.player_id = p.id
  ) as ゴール数 
from
  players p 
order by
 ゴール数 desc
 
--7問題：すべての選手を対象として選手ごとの得点ランキングを表示してください。（テーブル結合を使うこと）
select
  p.name as 名前
  , p.position as ポジション
  , p.club as 所属クラブ
  , count(g.id) as ゴール数 
from
  players p 
  left join goals g 
    on g.player_id = p.id 
group by
  p.id
  , p.name
  , p.position
  , p.club 
order by
  ゴール数 desc

--8問題：各ポジションごとの総得点を表示してください。
select
  p.position as ポジション
  , count(g.id) as ゴール数 
from
  players p 
  left join goals g 
    on g.player_id = p.id 
group by
 p.position
order by
 ゴール数 desc
 
--9問題：ワールドカップ開催当時（2014-06-13）の年齢をプレイヤー毎に表示する。
select
  p.birth
  , age('2014-06-13', p.birth) as age
  , p.name
  , p.position 
from
  players p 
order by
  age desc

--10問題：オウンゴールの回数を表示する
--（オウンゴールはgoalsテーブルのplayer_id列がNULLのものになります）
