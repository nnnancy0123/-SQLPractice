
--51���F�S�ẴS�[�������o�͂��Ă��������B�������A�I�E���S�[���iplayer_id��NULL�̃f�[�^�j��CASE�֐����g�p����player_id���u9999�v�ƕ\�����Ă��������B
select  case  when player_id is null then 9999 else player_id end, goal_time from goals order by player_id des
 --case when **** then �ς�鐔�� else ���� end
	
--52���F�S�Ă̑I��̕��ϐg���A���ϑ̏d��\�����Ă��������B(�O���[�v�֐��iAVG�j)
select AVG(height)as ���ϐg��, AVG(weight)as ���ϑ̏d from players

--53���F���{�̑I��iplayer_id��714����736�j���グ���S�[������\�����Ă��������B
select count( id )as ���{�̃S�[���� from goals where 736 >= player_id and player_id >= 714
 --��?ID��?�Z����,count�p��?�Z����?�\���I�s��
 
--54���F�I�E���S�[���iplayer_id��NULL�j�ȊO�̑��S�[������\�����Ă��������B�������AWHERE��͎g�p���Ȃ��ł��������B
select count(player_id)as �I�E���S�[���ȊO�̃S�[���� from goals
 --��NULL?�I?�s��

--55���F�S�Ă̑I��̒��ōł������g���ƁA�ł��d���̏d��\�����Ă��������B
select MAX(height)as �ő�g��,  MAX(weight)as �ő�̏d from players

--56���FA�O���[�v��FIFA�����N�ŏ�ʂ�\�����Ă��������B
select MIN(ranking)as A�O���[�v��FIFA�����N�ŏ�� from countries where group_name = 'A';

--57���FC�O���[�v��FIFA�����N�̍��v�l��\�����Ă��������B
select SUM(ranking)as C�O���[�v��FIFA�����N���v�l from countries where group_name = 'C';

--58���F�S�Ă̑I��̏������Ɩ��O�A�w�ԍ���\�����Ă��������B
select c.name as name, p.name as playerName, p.uniform_num from countries c left join players p on p.country_id = c.id
select c.name as name, p.name as playerName, p.uniform_num from countries c join players p on p.country_id = c.id
 --JOIN��INNER JOIN�̏ȗ��`�ł��̂ŁA�ǂ�����g���Ă���肠��܂���

--59���F�S�Ă̎����̍����ƑI�薼�A���_���Ԃ�\�����Ă��������B�I�E���S�[���iplayer_id��NULL�j�͕\�����Ȃ��ł��������B
select c.name as name, p.name as playerName, g.goal_time from countries c inner join players p  on p.country_id = c.id inner join goals g on g.player_id = p.id	

--60���F�S�Ă̎����̃S�[�����ԂƑI�薼��\�����Ă��������B�����O���������g�p���ăI�E���S�[���iplayer_id��NULL�j���\�����Ă��������B
select g.goal_time, p.uniform_num , p.position, p.name from goals g left join players p  on p.id = g.player_id 

--61���F�S�Ă̎����̃S�[�����ԂƑI�薼��\�����Ă��������B�E���O���������g�p���ăI�E���S�[���iplayer_id��NULL�j���\�����Ă��������B
select g.goal_time, p.uniform_num , p.position, p.name from players p right join goals g  on p.id = g.player_id  

--62���F�S�Ă̎����̃S�[�����ԂƑI�薼�A������\�����Ă��������B�܂��A�I�E���S�[���iplayer_id��NULL�j���\�����Ă��������B
select c.name as country_name, g.goal_time,  p.position, p.name as players_name from goals g left join players p  on p.id = g.player_id left join countries c on c.id = p.country_id

--63���F�S�Ă̎����̃L�b�N�I�t���ԂƑΐ퍑�̍�����\�����Ă��������B���Ȍ���
select p.kickoff, c.name as my_country, d.name as enemy_country from pairings p inner join countries c on c.id = my_country_id inner join countries d on d.id = enemy_country_id
	--1,���̂悤�ɓ����e�[�u����2�x�ȏ�����Č������邱�Ƃ��ł��܂��Bpairings�e�[�u����my_country_id��enemy_country_id�͂ǂ����countries�e�[�u����PK���i�[���Ă���O���L�[�ɂȂ�܂��B
	--2,my_country��\�����邽�߂�enemy_country��\�����邽�߂�2��countries�e�[�u����ʁX��JOIN����K�v������܂��B

