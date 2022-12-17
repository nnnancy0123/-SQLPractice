--1���:�e�O���[�v�̒���FIFA�����N���ł��������ƒႢ���̃����L���O�ԍ���\�����Ă��������B
select
  group_name as �O���[�v
  , min(ranking) as �����L���O�ŏ��
  , max(ranking) as �ŉ��ʃ����L���O 
from
  countries 
group by
  group_name 
order by
  group_name ASC                                 
 --�ӊO�Ɗ��Ⴂ���₷���|�C���g�Ƃ��āAMIN()�֐����g�������������L���O�ŏ�ʁAMAX()�֐����g�������������L���O�ŉ��ʂƂȂ�܂��̂Œ���
 
 --2���F�e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���countries�e�[�u���Ƃ��Ă��������B
  select
  c.name as ����
  , avg(p.height) as ���ϐg�� 
from
  countries c 
  left join players p 
    on c.id = p.country_id 
group by
  c.name 
order by
  avg(p.height) desc                              

--70���F1980�N���܂�ƁA1981�N���܂�̑I�肪���l���邩���ׂĂ��������B�������A���t�֐��͎g�p�����AUNION����g�p���Ă��������B
  select
  '1980' as �a���N
  , count(id) 
from
  players 
WHERE
  birth BETWEEN '1980-1-1' AND '1980-12-31' 
union 
select
  '1981' as �a���N
  , count(id) 
from
  players 
WHERE
  birth BETWEEN '1981-1-1' AND '1981-12-31'       
--�񓚁F�e�`�q'�C�����I�B�p�ȕ`�qBETWEEN '1981-1-1' AND '1981-12-31'?�����ʓI?
  
--3���F�e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���countries�e�[�u���Ƃ��Ă��������B
  
  select
  c.name as ����
  , avg(p.height) as ���ϐg�� 
from
  countries c 
  left join players p 
    on c.id = p.country_id 
group by
  c.name
  ,c.id
order by avg(p.height) DESC

--4���F�e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���players�e�[�u���Ƃ��āA�e�[�u���������g�킸���⍇����p���Ă��������B
 
 select
 (select c.name from countries c where c.id = p.country_id)as ���� 
 ,avg(p.height) as ���ϐg��
from 
  players p
  group by
  p.country_id
order by avg(p.height) DESC

--5���F�L�b�N�I�t�����Ƒΐ퍑�̍������L�b�N�I�t�����̑������̂��珇�ɕ\�����Ă��������B
select
  p.kickoff as �L�b�N�I�t����
  , c2.name as ����
  , c1.name as �G�� 
from
  pairings p 
  left join countries c1 
    on c1.id = p.my_country_id 
  left join countries c2 
    on c2.id = p.enemy_country_id 
order by
  kickoff
  
--6���F���ׂĂ̑I���ΏۂƂ��đI�育�Ƃ̓��_�����L���O��\�����Ă��������B�iSELECT��ŕ��⍇�����g�����Ɓj
select
  p.name as ���O
  , p.position as �|�W�V����
  , p.club as �����N���u
  , ( 
    select
      count(id) 
    from
      goals g 
    where
      g.player_id = p.id
  ) as �S�[���� 
from
  players p 
order by
 �S�[���� desc
 
--7���F���ׂĂ̑I���ΏۂƂ��đI�育�Ƃ̓��_�����L���O��\�����Ă��������B�i�e�[�u���������g�����Ɓj
select
  p.name as ���O
  , p.position as �|�W�V����
  , p.club as �����N���u
  , count(g.id) as �S�[���� 
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
  �S�[���� desc

--8���F�e�|�W�V�������Ƃ̑����_��\�����Ă��������B
select
  p.position as �|�W�V����
  , count(g.id) as �S�[���� 
from
  players p 
  left join goals g 
    on g.player_id = p.id 
group by
 p.position
order by
 �S�[���� desc
 
--9���F���[���h�J�b�v�J�Ó����i2014-06-13�j�̔N����v���C���[���ɕ\������B
select
  p.birth
  , age('2014-06-13', p.birth) as age
  , p.name
  , p.position 
from
  players p 
order by
  age desc

--10���F�I�E���S�[���̉񐔂�\������
--�i�I�E���S�[����goals�e�[�u����player_id��NULL�̂��̂ɂȂ�܂��j
