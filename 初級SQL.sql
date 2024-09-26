--01電子カルテシステム
--新しい患者の登録(INSERT INTO)
insert 
into patients( 
    patient_id
    , name
    , gender
    , date_of_birth
    , address
    , contact_number
    , emergency_contact
    , del_flag
    , created_at
    , updated_at
) 
values ( 
    '102'
    , '田中二郎'
    , '女性'
    , '19920515'
    , '大阪府大阪市北区'
    , '090-1234-5678'
    , '080-8765-4321'
    , 0
    , current_timestamp
    , current_timestamp
); 

--在庫数追加
ALTER TABLE medicines ADD stock_quantity INT default 0 NOT NULL;

--説明の定義を変更
ALTER TABLE medicines ALTER COLUMN description 
SET
    NOT NULL;

--薬品テーブル削除
DROP TABLE IF EXISTS medicines;

--患者テーブルからの限定情報抽出
select
    patient_id
    , name
    , gender
    , date_of_birth
    , address
    , contact_number 
from
    patients;

--特定患者の情報抽出
select
    * 
from
    patients 
where
    address = '東京都渋谷区';

--特定条件の患者情報抽出
select * from patients where date_of_birth <= '1990-01-01' AND gender='女';

--複数条件での患者情報抽出
select * from patients WHERE address = '東京都渋谷区' OR address ='神奈川県横浜市';

--条件指定と並び替えによる患者情報抽出
SELECT name,date_of_birth FROM patients WHERE gender ='男性' ORDER BY date_of_birth DESC;

--患者情報更新
UPDATE patients SET emergency_contact='080-1122-3344' WHERE name = '山田太郎';

--患者情報物理削除
DELETE FROM patients where name = '山田太郎';

--患者情報論理削除
UPDATE patients SET del_flag = '1' WHERE name='鈴木一郎' AND del_flag = '0';

--患者情報のトップレコード選択
SELECT name,date_of_birth FROM patients ORDER BY date_of_birth DESC LIMIT 1;

--部分一致で患者情報を検索
SELECT * FROM patients WHERE name LIKE '%太郎%';

--特定のパターンに基づく患者情報検索
SELECT * FROM patients WHERE contact_number LIKE '080-%';

--指定された条件の患者情報抽出
SELECT * FROM patients WHERE patient_id IN ('1','3','5');

--特定期間の患者情報抽出
SELECT * FROM patients WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

--患者情報のエイリアス表示
SELECT patient_id AS "患者ID",name AS "患者名" FROM patients;

--検査結果と患者情報の結合
SELECT p.name AS "患者名",er.examination_date AS "検査日",er.examination_type AS "検査種類",er.examination_result AS "検査結果" FROM patients p INNER JOIN examination_results er ON p.patient_id = er.patient_id WHERE er.examination_result = '正常';

--検査結果を含む患者情報の抽出(LEFT JOIN)
SELECT p.name AS "患者名",er.examination_result AS "検査結果" FROM patients p LEFT JOIN examination_results er ON p.patient_id = er.patient_id ;

--検査結果を持つ患者情報の限定表示
select p.name AS "患者名",er.examination_date AS "検査日",er.examination_type AS "検査種類",er.examination_result AS "検査結果" FROM examination_results er RIGHT JOIN patients p ON p.patient_id = er.patient_id ;

--特定年に生まれた患者の名前の統合
SELECT name AS "患者名"
FROM patients
WHERE date_of_birth BETWEEN '1985-01-01' AND '1985-12-31'
UNION
SELECT name AS "患者名"
FROM patients
WHERE date_of_birth BETWEEN '1990-01-01' AND '1990-12-31';

--連絡先番号が登録されている患者情報の抽出
SELECT name AS "患者名",contact_number AS "連絡先番号" FROM patients WHERE contact_number IS NOT NULL;

--未登録の連絡先情報を持つ患者の抽出
SELECT * FROM patients WHERE contact_number IS NULL;

--特定条件を満たす患者の情報削除
DELETE FROM patients WHERE date_of_birth <='1990-12-31';

--性別ごとの患者数集計
SELECT gender AS "性別",COUNT(gender) AS "患者数" FROM patients WHERE gender IS NOT NULL  GROUP BY gender;

--特定の経験年数以上の医師を集計する
SELECT specialty AS "専門分野",COUNT (*) AS "医師数" FROM doctor WHERE years_of_experience >= 10 GROUP BY specialty HAVING COUNT (*) >=3;

--02不動産システム
--価格が5000万円以上の物件を検索する
SELECT DISTINCT property_name AS "物件名",address AS "住所",price AS "価格",area AS "面積" FROM properties WHERE price >= 50000000 ORDER BY price DESC;

--居住中の入居者の情報を検索する
select
    name AS "入居者名"
    , contact_number AS "連絡先"
    , address AS "住所" 
FROM
    tenants 
WHERE
    status = '居住中' 
ORDER BY
    name ASC
;

--面積が80平米以上の物件を検索する
SELECT DISTINCT property_name AS "物件名",area AS "面積" from properties WHERE area >= 80 ORDER BY area DESC;

--新しい物件を追加する
--インサート文を作成
INSERT 
INTO properties( 
    property_name
    , address
    , price
    , area
    , property_type
    , year_built
    , status
    , del_flag
    , created_at
    , updated_at
) 
VALUES ( 
    'ブルースカイハウス'
    , '東京都中央区'
    , 60000000
    , 85
    , '一戸建て'
    , 2008
    , '販売中'
    , '0'
    , CURRENT_TIMESTAMP
    , CURRENT_TIMESTAMP
) ;

--この物件のクエリを検索する
SELECT DISTINCT  * FROM properties WHERE property_name = 'ブルースカイハウス'; 

--物件の価格を更新する
--情報更新する
UPDATE properties SET price = '55000000',updated_at = CURRENT_TIMESTAMP WHERE property_name = 'グリーンハウス';

--情報確認する（SELECT）
SELECT DISTINCT * FROM properties WHERE property_name = 'グリーンハウス';

--物件の状態を更新する
 UPDATE properties SET status = '売却済み',updated_at = CURRENT_TIMESTAMP WHERE property_name = 'スカイタワー';
 SELECT property_name,status FROM properties WHERE property_name = 'スカイタワー';
 
--退去済みの入居者を削除する
 DELETE FROM tenants WHERE status = '退去済み';
 SELECT name,status FROM tenants
 
--物件と契約を結合して入居者の情報を表示する
SELECT
    p.property_name AS "物件名",
    t.name AS "入居者",
    l.start_date AS "契約開始日"
FROM
    properties p
INNER JOIN leases l ON l.property_id = p.property_id
INNER JOIN tenants t ON l.tenant_id = t.tenant_id
ORDER BY
    l.start_date ASC;

--物件と契約を結合して入居者の情報を表示する
SELECT
    p.property_name AS "物件名"
    , l.start_date AS "支払日"
    , ph.payment_amount AS "支払額"
    , ph.payment_method AS "支払方法"
    , ph.payment_date AS "支払日" 
FROM
    properties p 
    INNER JOIN leases l 
        ON l.property_id = p.property_id 
    INNER JOIN payment_histories ph 
        ON ph.lease_id = l.lease_id
WHERE p.property_name='サンシャインマンション'
ORDER BY
    l.start_date ASC;

--入居者と物件を結合して居住情報を表示する
SELECT
    t.name AS "入居者名"
    , p.property_name AS "物件名"
    , p.address AS "住所" 
FROM
    tenants t 
    INNER JOIN leases l 
        ON l.tenant_id = t.tenant_id 
    INNER JOIN properties p 
        ON l.property_id = p.property_id 
ORDER BY
    t.name ASC;
    
--物件種別ごとの物件数をカウントする
SELECT
    property_type AS "物件種別"
    , COUNT(*) AS "物件数" 
FROM
    properties 
GROUP BY
    property_type 
ORDER BY
    property_type ASC;
    
--状態ごとに入居者の人数をカウントする
SELECT
    status AS "入居者状態"
    , COUNT(*) AS "人数" 
FROM
    tenants 
GROUP BY
    status 
ORDER BY
    status ASC;

--物件の平均価格を計算する
SELECT
    ROUND(AVG(price), 2) 
FROM
    properties;

--特定の期間内に行われた支払いの合計金額を計算する
SELECT
    ROUND(SUM(payment_amount), 2) AS "合計金額" 
FROM
    payment_histories 
WHERE
    payment_date >= '2022-04-01' 
    AND payment_date <= '2022-09-30';
    
--物件の中で最も高い価格と最も低い価格を表示する
SELECT
    MAX(price) AS "高い価格"
    , MIN(price) AS "低い価格" 
FROM
    properties

--入居者が居住している物件の平均面積を計算する
SELECT
    ROUND(AVG(p.area),2) AS "平均面積" 
FROM
    tenants t 
    INNER JOIN leases l 
        on l.tenant_id = t.tenant_id 
    INNER JOIN properties p 
        ON p.property_id = l.property_id 
WHERE
    t.status = '居住中' ;
    
--住所に「東京」を含む物件を検索する
SELECT
    property_name AS "物件名"
    , address AS "住所" 
FROM
    properties 
WHERE
    address LIKE '%東京%' 
ORDER BY
    property_name ASC;
    
--価格が5000万円から6000万円の間の物件を検索する
SELECT
    property_name AS "物件名"
    , price AS "価格"
    , address AS "住所" 
FROM
    properties 
WHERE
    price BETWEEN 50000000 AND 60000000 
ORDER BY
    price ASC;
    
--名前が「山」で始まる入居者を検索する
SELECT
    name AS "入居者"
    , contact_number AS "連絡先"
    , address AS "住所" 
FROM
    tenants
WHERE 
    name LIKE '山%'
ORDER BY 
    name ASC;
    
--異なる物件種別をリストアップする
SELECT DISTINCT
    property_type AS "物件種別" 
FROM
    properties 
ORDER BY
    property_type ASC;

--特定の物件IDのリストに含まれる物件を表示する
SELECT
    property_name AS "物件名"
    , price AS "価格"
    , address AS "住所" 
FROM
    properties 
WHERE
    property_id IN (1, 3, 5) 
ORDER BY
    property_id ASC;
    
--特定の地域にない物件を検索する
SELECT
    property_name AS "物件名"
    , address AS "住所"
    , price AS "価格" 
FROM
    properties 
WHERE
    address NOT IN ('東京都中央区') 
ORDER BY
    price DESC;

--価格が高い順に上位5件の物件を表示する
SELECT
    property_name AS "物件名"
    , address AS "住所"
    , price AS "価格" 
FROM
    properties 
ORDER BY
    price DESC 
LIMIT
    5;

--物件リストのうち、10件目から20件目までの物件を表示する
SELECT
    property_name AS "物件名"
    , address AS "住所"
    , price AS "価格" 
FROM
    properties 
ORDER BY
    property_id ASC 
LIMIT
    10 OFFSET 9;

--契約の開始日が古い順に並べた契約リストを表示する
SELECT
    l.lease_id AS "契約ID"
    , p.property_name AS "物件名"
    , t.name AS "入居者名"
    , l.start_date AS "契約開始日" 
FROM
    leases l 
    INNER JOIN properties p 
        ON l.property_id = p.property_id 
    INNER JOIN tenants t 
        ON t.tenant_id = l.tenant_id 
ORDER BY
    l.start_date ASC;

--入居者の名前を降順に並べ、そのリストを表示する
SELECT
    name AS "名前"
    , contact_number AS "連絡先"
    , address AS "住所" 
FROM
    tenants 
ORDER BY
    name DESC;
    
--住所が未登録の入居者を検索する
SELECT
    name AS "名前",
    contact_number AS "連絡先",
    address AS "住所"
FROM
    tenants
WHERE
    address IS NULL;
    
--建築年が登録されている物件を検索する
SELECT
    property_name AS "物件名"
    , address AS "住所"
    , price AS "価格"
    , year_built AS "建築年" 
FROM
    properties 
WHERE
    year_built IS NOT NULL 
ORDER BY
    year_built DESC;

--物件に関連するすべての契約情報を表示する
SELECT
    p.property_name AS "物件名"
    , l.lease_id AS "契約ID"
    , t.name AS "入居者名"
    , l.start_date AS "契約開始日"
    , l.end_date AS "契約終了日" 
FROM
    properties p 
    LEFT JOIN leases l 
        ON l.property_id = p.property_id 
    LEFT JOIN tenants t 
        ON t.tenant_id = l.tenant_id
    ORDER BY p.property_name ASC;

--すべての契約とその関連する物件情報を表示する
SELECT
    l.lease_id AS " 契約ID "
    , t.name AS " 入居者名 "
    , p.property_name AS "物件名"
    , l.start_date AS " 契約開始日 " 
FROM
    properties p
    RIGHT JOIN leases l 
        ON l.property_id = p.property_id 
    RIGHT JOIN tenants t 
        ON t.tenant_id = l.tenant_id 
ORDER BY
    l.lease_id ASC;


