
--70���F1980�N���܂�ƁA1981�N���܂�̑I�肪���l���邩���ׂĂ��������B�������A���t�֐��͎g�p�����AUNION����g�p���Ă��������B
select count(id) from players

select '1980'as �a���N, count(id) --'1980'?
from players 
WHERE birth BETWEEN '1980-1-1' AND '1980-12-31'
union
select '1981'as �a���N, count(id) 
from players 
WHERE birth BETWEEN '1981-1-1' AND '1981-12-31'

--71���F�g����195�p���傫�����A�̏d��95kg���傫���I��𒊏o���Ă��������B�������A�ȉ��̉摜�̂悤�ɁA�ǂ���̏����ɂ����v����ꍇ�ɂ�2�����̃f�[�^�Ƃ��Ē��o���Ă��������B�܂��A���ʂ�id�̏����Ƃ��Ă��������B
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
--72���FVIEW:--�E���G��SQL����View�Ƃ��Ē�`���邱�ƂŁA������͂���K�v���Ȃ��Ȃ�J�����������シ��
--�EView�𗘗p����Έ�ʃ��[�U�[�Ɍ��������Ȃ��f�[�^�ւ̃A�N�Z�X�𐧌����邱�Ƃ��ł���
--73���FVIEW�̍쐬
  CREATE VIEW teachers_view AS 
SELECT
  teacher_id
  , name
  , class_id 
FROM
  teachers; 

--SELECT �J������,(�J������,�c)FROM �r���[��;
SELECT
  * 
FROM
  teachers_view; 

--74���FALTER VIEW����age�J������ǉ����Ă݂܂��B(View�̕ύX�E�X�V
ALTER VIEW teachers_view AS 
SELECT
  teacher_id
  , name
  , class_id
  , age 
FROM
  teachers; 

--View�Ƃ��ĕ\��������̂�name,address,age�J������3�ɕύX���܂��B
CREATE 
OR REPLACE VIEW teachers_view AS 
SELECT
  name
  , address
  , age 
FROM
  teachers; 

--View�̍X�V:UPDATE��
UPDATE teachers_view 
SET
  name = '�V���E�^' 
WHERE
  teacher_id = 1; 

--75���FView�̍폜���s���ɂ́uDROP VIEW���v(View�̍폜

--�����͈ȉ��̒ʂ�ł�:DROP VIEW (IF EXISTS) View��;
--�s�v��View��DROP VIEW���ō폜�ł��܂�
DROP VIEW teachers_view; 
--���݂��Ȃ�View���폜���悤�Ƃ���ƃG���[�ɂȂ�܂��B
DROP VIEW class_view; 
--�폜����View�����݂��Ă��Ȃ��ꍇ�́AView�̍폜�������s��Ȃ��悤��DROP VIEW�̌��ɁuIF EXISTS�v���L�q���܂��B
--���݂��Ȃ�View���폜���悤�Ƃ��Ă��G���[�ɂȂ�Ȃ��B
DROP VIEW IF EXISTS teachers_view;

