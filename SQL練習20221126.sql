--25���F�S�I��̈ȉ��̃f�[�^�𒊏o���Ă��������B
select uniform_num,name,club from players;

--26���F�O���[�vC�ɏ������鍑�����ׂĒ��o���Ă��������B
select * from countries where group_name = 'C';

--27���F�O���[�vC�ȊO�ɏ������鍑�����ׂĒ��o���Ă��������B
select * from countries where group_name != 'C';
select * from countries where group_name <>'C';

--28���F2016�N1��13�����݂�40�Έȏ�̑I��𒊏o���Ă��������B�i�a�����̐l���܂߂Ă��������B�j
select* from players where birth <= '1976-1-13' ;

--29���F�g����170cm�����̑I��𒊏o���Ă��������B
select * from players where height < '170';

--30���:FIFA�����N�����{�i46�ʁj�̑O��10�ʂɊY�����鍑�i36�ʁ`56�ʁj�𒊏o���Ă��������B�������ABETWEEN���p���Ă��������B
select * from countries where ranking between 36 and 56;

--31���:�I��̃|�W�V������GK�ADF�AMF�ɊY������I������ׂĒ��o���Ă��������B�������AIN���p���Ă��������B
select * from players where  position in ('GK', 'DF', 'MF');

--32���:�I�E���S�[���ƂȂ����S�[���𒊏o���Ă��������Bgoals�e�[�u����player_id�J������NULL���i�[����Ă���f�[�^���I�E���S�[����\���Ă��܂��B
select * from goals where player_id is null;  --is null

--33���F�I�E���S�[���ȊO�̃S�[���𒊏o���Ă��������Bgoals�e�[�u����player_id�J������NULL���i�[����Ă���f�[�^���I�E���S�[����\���Ă��܂��B
select * from goals where player_id is not null; --is not null

--34���F���O�̖������u�j���v�ŏI���v���C���[�𒊏o���Ă��������B
select * from  players where name like '%�j��'; --like '%X' or like'_X'/�I���iLIKE�O��or����j
select * from  players where name like '_�j��_';

--35���F���O�̖������u�j���v�ŏI���v���C���[�𒊏o���Ă��������B
select * from players where name like '%�j��%'; --�I���iLIKE�O��or����j
select * from players where name like '__�j��%';

--36���F�O���[�vA�ȊO�ɏ������鍑�����ׂĒ��o���Ă��������B�������A�u!=�v��u<>�v���g�킸�ɁA�uNOT�v���g�p���Ă��������B
select * from countries where group_name not like 'A';
select * from countries where not group_name = 'A' ;

--37���F�S�I��̒���BMI�l��20��̑I��𒊏o���Ă��������BBMI�͈ȉ��̎��ŋ��߂邱�Ƃ��ł��܂��B
select * from players where weight / POW(height / 100.00, 2)>=20 and weight / POW(height / 100.00, 2)<21; --int?��float?�^

--38���F�S�I��̒����珬���ȑI��i�g����165cm�������A�̏d��60kg�����j�𒊏o���Ă��������B
select* from players where height < 165 or weight < 60; --OR���Z�q

--39���FFW��MF�̒���170�����̑I��𒊏o���Ă��������B�������AOR��AND���g�p���Ă��������B
select * from players where (position =' FW' or position = 'MF' )and height < 170;
--select * from players where position = 'FW' or position = 'MF' and height < 170  error�����uFW�̑I��A��������MF��170cm�����̑I��v

--40���F�|�W�V�����̈ꗗ��\�����Ă��������B�O���[�v���͎g�p���Ȃ��ł��������BDISTINCT
select distinct position from players; --�p�������d???�C��?��B��I??

--41���F�S�I��̐g���Ƒ̏d�𑫂����l��\�����Ă��������B���킹�đI��̖��O�A�I��̏����N���u���\�����Ă��������B�Z�p���Z�q�iSELECT��j
select name, club, height + weight from players;

--42���F�I�薼�ƃ|�W�V�������ȉ��̌`���ŏo�͂��Ă��������B�V���O���N�H�[�g�ɒ��ӂ��Ă��������B�����񌋍��A�G�X�P�[�v�V�[�P���X
select concat(name,'�I��̃|�W�V������',position,'�ł�') from players; 

--43���F�S�I��̐g���Ƒ̏d�𑫂����l���J�������u�̗͎w���v�Ƃ��ĕ\�����Ă��������B���킹�đI��̖��O�A�I��̏����N���u���\�����Ă��������B�񌩏o��
select name, club, (height + weight)as �̗͎w�� from players;

--44���:FIFA�����N�̍��������珇�ɂ��ׂĂ̍�����\�����Ă��������B
select * from countries order by ranking; --�\�[�g�i�P��J�����j

--45���:�S�Ă̑I���N��̒Ⴂ���ɕ\�����Ă��������B�Ȃ��A�N����v�Z����K�v�͂���܂���B
select * from players order by birth desc; --�\�[�g�i�~���j

--46���F�S�Ă̑I���g���̑傫�����ɕ\�����Ă��������B�����g���̑I��͑̏d�̏d�����ɕ\�����Ă��������B�\�[�g�i�����J�����j
select * from players order by height desc , weight desc;

--47���F�S�Ă̑I��̃|�W�V������1�����ځiGK�ł����G�AFW�ł����F�j���o�͂��Ă��������B�P��s�֐��i������֐��j
select id, country_id, uniform_num, SUBSTRING(position,1,1),name from players; --1st 1 characters of position

--48���F�o�ꍑ�̍������������̂��珇�ɏo�͂��Ă��������B�P��s�֐��i������֐��j
select name,length(name) from countries order by length(name) desc ;

--49���F�S�I��̒a�������u2017�N04��30���v�̃t�H�[�}�b�g�ŏo�͂��Ă��������B
select name, to_char(cast(birth as date), 'IYYY�NI��I��') as birthday from players;  -- to_char(time,'YYYY')

--50���F�S�ẴS�[�������o�͂��Ă��������B�������A�I�E���S�[���iplayer_id��NULL�̃f�[�^�j��IFNULL�֐����g�p����player_id���u9999�v�ƕ\�����Ă��������B�P��s�֐��iIFNULL�j
select COALESCE(player_id,9999), goal_time  from goals order by player_id desc --COALESCE(�e�[�u���̒l, 'input�l')=IFNULL

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
	
