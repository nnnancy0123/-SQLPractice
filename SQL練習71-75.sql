
--70問題：1980年生まれと、1981年生まれの選手が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
select count(id) from players

select '1980'as 誕生年, count(id) --'1980'?
from players 
WHERE birth BETWEEN '1980-1-1' AND '1980-12-31'
union
select '1981'as 誕生年, count(id) 
from players 
WHERE birth BETWEEN '1981-1-1' AND '1981-12-31'

--71問題：身長が195㎝より大きいか、体重が95kgより大きい選手を抽出してください。ただし、以下の画像のように、どちらの条件にも合致する場合には2件分のデータとして抽出してください。また、結果はidの昇順としてください。
select
  id
  , position
  , name
  , height
  , weight 
from
  players 
where
  height > 195 
UNION ALL 
select
  id
  , position
  , name
  , height
  , weight 
from
  players 
where
  weight > 95 
order by
  id 
--72問題：VIEW:--・複雑なSQL文をViewとして定義することで、毎回入力する必要がなくなり開発効率が向上する
--・Viewを利用すれば一般ユーザーに見せたくないデータへのアクセスを制限することができる
--73問題：VIEWの作成
  CREATE VIEW teachers_view AS 
SELECT
  teacher_id
  , name
  , class_id 
FROM
  teachers; 

--SELECT カラム名,(カラム名,…)FROM ビュー名;
SELECT
  * 
FROM
  teachers_view; 

--74問題：ALTER VIEW文でageカラムを追加してみます。(Viewの変更・更新
ALTER VIEW teachers_view AS 
SELECT
  teacher_id
  , name
  , class_id
  , age 
FROM
  teachers; 

--Viewとして表示するものをname,address,ageカラムの3つに変更します。
CREATE 
OR REPLACE VIEW teachers_view AS 
SELECT
  name
  , address
  , age 
FROM
  teachers; 

--Viewの更新:UPDATE文
UPDATE teachers_view 
SET
  name = 'シュウタ' 
WHERE
  teacher_id = 1; 

--75問題：Viewの削除を行うには「DROP VIEW文」(Viewの削除

--書式は以下の通りです:DROP VIEW (IF EXISTS) View名;
--不要なViewはDROP VIEW文で削除できます
DROP VIEW teachers_view; 
--存在しないViewを削除しようとするとエラーになります。
DROP VIEW class_view; 
--削除するViewが存在していない場合は、Viewの削除処理を行わないようにDROP VIEWの後ろに「IF EXISTS」を記述します。
--存在しないViewを削除しようとしてもエラーにならない。
DROP VIEW IF EXISTS teachers_view;

