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
select * from countries

select * from players



--70���F1980�N���܂�ƁA1981�N���܂�̑I�肪���l���邩���ׂĂ��������B�������A���t�֐��͎g�p�����AUNION����g�p���Ă��������B

select '1980'as �a���N, count(id) 
from players 
WHERE birth BETWEEN '1980-1-1' AND '1980-12-31'
union
select '1981'as �a���N, count(id) 
from players 
WHERE birth BETWEEN '1981-1-1' AND '1981-12-31'
--�񓚁F�e�`�q'�C�����I�B�p�ȕ`�qBETWEEN '1981-1-1' AND '1981-12-31'?�����ʓI?
