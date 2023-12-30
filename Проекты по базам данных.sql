--2.1 проект--

--Упр.1--
create table if not exists arena
	(id int primary key,
	name varchar(50),
	size int);
	

create table if not exists team
	(id int primary key,
	city varchar,
	name varchar(50),
	coach_name varchar,
	arena_id int);
select*from arena;
	
create table if not exists player 
	(id int primary key,
	name varchar(50),
	position varchar,
	height numeric,
	weight numeric,
	salary numeric,
	team_id int);


--Упр.2--
alter table arena 
alter column name set not null;

alter table arena 
alter column size set not null;

alter table arena 
alter column size set default (100);



alter table team 
alter column name set not null;

alter table team 
alter column city set not null;

alter table team 
alter column coach_name set not null;

alter table team 
alter column arena_id set not null;



alter table player 
alter column name set not null;

alter table player 
alter column position set not null;

alter table player 
alter column height set not null;

alter table player 
alter column weight set not null;

alter table player 
alter column salary set not null;

alter table player 
alter column team_id set not null;



alter table player
add constraint check_height check (height>0);

alter table player
drop constraint check_height;



alter table player
add constraint check_weight check (weight>0);

alter table player
drop constraint check_weight;



alter table player
add constraint check_salary check (salary>0);

alter table player 
drop constraint check_salary;


--Упр.3--
alter table arena
add constraint uniq_name unique (name);

alter table team
add constraint uniq_name unique (name);
add constraint uniq_name unique (coach_name);

alter table player
add constraint uniq_name unique (name);

alter table team
add foreign key (arena_id) references arena(id)
on update cascade 
on delete restrict;

alter table player
add foreign key (team_id) references team(id)
on update cascade 
on delete restrict;

--Упр.4 и упр.5--
create table if not exists game
(
	ID int primary key,
	owner_team_id int not null,
	guest_team_id int not null,
	game_date date,
	winner_team_id int not null,
	owner_score int default 0 not null,
	check (owner_score>=0),
	guest_score int default 0 not null, 
	check (guest_score>=0),
	arena_id int not null,
	foreign key (owner_team_id) references team(ID)
	on update cascade
	on delete cascade,
	foreign key (guest_team_id) references team(ID)
	on update cascade
	on delete cascade,
	foreign key (winner_team_id) references team(ID)
	on update cascade
	on delete cascade,
	foreign key (arena_id) references arena(ID)
	on update cascade
	on delete cascade
);

DELETE FROM arena 
WHERE id = '10'

DELETE FROM arena 
WHERE id = '20'

DELETE FROM arena 
WHERE id = '30'

DELETE FROM arena 
WHERE id = '40'

DELETE FROM arena 
WHERE id = '50'

DELETE FROM arena 
WHERE id = '21'

DELETE FROM arena 
WHERE id = '31'

DELETE FROM arena 
WHERE id = '41'

DELETE FROM arena 
WHERE id = '51'

--2.2 проект--


--Упражнение 1--
insert into arena (ID, name, size)
values (10,	'Палау Блауграна', 8250),
       (20,	'Визинк-Центр - Паласио де Депортес', 15500),
	   (30,	'УСК ЦСКА им. А.Я. Гомельского', 5000),
       (40,	'Пис энд Френдшип Стадиум',	12000),
       (50,	'СИБУР Арена', 7140);
select*from arena;


insert into team (ID, city, name, coach_name, arena_id)
values (10,	'Барселона', 'Барселона', 'Шарунас Ясикявичюс', (select ID from arena where "name" = 'Палау Блауграна')),
	   (20,	'Мадрид', 'Реал Мадрид', 'Пабло Ласо', (select ID from arena where "name" = 'Визинк-Центр - Паласио де Депортес')),
       (30,	'Москва', 'ЦСКА', 'Димитрис Итудис', (select ID from arena where "name" = 'УСК ЦСКА им. А.Я. Гомельского')), 
       (40,	'Пирей', 'Олимпиакос', 'Георгиос Барцокас', (select ID from arena where "name" = 'Пис энд Френдшип Стадиум')),
       (50,	'Санкт-Петербург', 'Зенит',	'Хавьер Паскуаль', (select ID from arena where "name" = 'СИБУР Арена'));
select*from team;



insert into player (ID, name, position, height, weight, salary, team_id)
 values (10, 'Рафа Вильяр', 'защитник',	188, 85, 100000, (select ID from team where "name" = 'Барселона')),
		(20, 'Кайл Курич', 'защитник', 193,	85,	100000, (select ID from team where "name" = 'Барселона')),
		(30, 'Ибу Дьянко Баджи', 'центровой', 211, 103,	200000, (select ID from team where "name" = 'Барселона')),
		(40, 'Ник Калатес',	'разыгрывающий', 198, 97, 150000, (select ID from team where "name" = 'Барселона')),
		(50, 'Никола Миротич', 'форвард', 208, 107, 175000, (select ID from team where "name" = 'Барселона')),
		(60, 'Джейси Кэрролл', 'защитник', 188,	82,	175000, (select ID from team where "name" = 'Реал Мадрид')),
		(70, 'Эли Джон Ндиайе',	'центровой', 203, 110, 275000, (select ID from team where "name" = 'Реал Мадрид')),
		(80, 'Уолтер Тавареш',	'центровой', 220, 120, 273000,	(select ID from team where "name" = 'Реал Мадрид')),
		(90, 'Томас Давид Эртель', 'разыгрывающий',	189, 88, 173000, (select ID from team where "name" = 'Реал Мадрид')),
		(100, 'Гершон Ябуселе',	'форвард', 203,	118, 99000, (select ID from team where "name" = 'Реал Мадрид')),
		(110, 'Габриэль Иффе Лундберг',	'защитник',	193, 96, 101000, (select ID from team where "name" = 'ЦСКА')),
		(120, 'Юрий Умрихин', 'защитник', 190, 75, 251000, (select ID from team where "name" = 'ЦСКА')),
		(130, 'Иван Анатольевич Ухов', 'разыгрывающий',	193, 77, 175000, (select ID from team where "name" = 'ЦСКА')),
		(140, 'Александр Хоменко',	'разыгрывающий', 192, 85, 375000, (select ID from team where "name" = 'ЦСКА')),
		(150, 'Андрей Лопатин',	'лёгкий форвард', 208, 92, 205000, (select ID from team where "name" = 'ЦСКА')),
		(160, 'Тайлер Дорси', 'защитник', 193, 83, 205000, (select ID from team where "name" = 'Олимпиакос')),
		(170, 'Яннулис Ларенцакис',	'защитник',	196, 87, 75000,	(select ID from team where "name" = 'Олимпиакос')),
		(180, 'Хассан Мартин', 'центровой', 201, 107, 375000, (select ID from team where "name" = 'Олимпиакос')),
		(190, 'Михалис Лунцис',	'разыгрывающий', 195, 90, 475000, (select ID from team where "name" = 'Олимпиакос')),
		(200, 'Георгиос Принтезис',	'форвард', 205,	104, 105000, (select ID from team where "name" = 'Олимпиакос')),
		(210, 'Билли Джеймс Бэрон',	'защитник',	188, 88, 75000,	(select ID from team where "name" = 'Зенит')),
		(220, 'Артурас Гудайтис', 'центровой',	208, 99, 165000, (select ID from team where "name" = 'Зенит')),
		(230, 'Денис Захаров',	'разыгрывающий', 192, 88, 163000, (select ID from team where "name" = 'Зенит')),
		(240, 'Миндаугас Кузминскас', 'лёгкий форвард',	204, 93, 295000, (select ID from team where "name" = 'Зенит')),
		(250, 'Алекс Пойтресс',	'форвард', 201,	108, 247000, (select ID from team where "name" = 'Зенит'));
select*from player;

--Упражнение 2--
insert into game (ID, owner_team_id, guest_team_id, game_date, winner_team_id, owner_score, guest_score, arena_id) values 
(10, (select ID from team where "name" = 'Барселона'), (select ID from team where "name" = 'Зенит'), '2021-10-22', (select ID from team where "name" = 'Барселона'), 84, 58, (select ID from arena where "name" = 'Палау Блауграна')),
(20, (select ID from team where "name" = 'Барселона'), (select ID from team where "name" = 'ЦСКА'), '2021-11-17', (select ID from team where "name" = 'Барселона'), 81, 73, (select ID from arena where "name" = 'Палау Блауграна')),	
(30, (select ID from team where "name" = 'Барселона'), (select ID from team where "name" = 'Реал Мадрид'), '2021-10-12', (select ID from team where "name" = 'Барселона'), 93, 80, (select ID from arena where "name" = 'Палау Блауграна')), 
(40, (select ID from team where "name" = 'Барселона'), (select ID from team where "name" = 'Олимпиакос'), '2021-10-15', (select ID from team where "name" = 'Барселона'), 83, 68, (select ID from arena where "name" = 'Палау Блауграна')),	
(50, (select ID from team where "name" = 'Зенит'), (select ID from team where "name" = 'Реал Мадрид'), '2022-12-15', (select ID from team where "name" = 'Реал Мадрид'), 68, 75, (select ID from arena where "name" = 'СИБУР Арена')),
(60, (select ID from team where "name" = 'Зенит'), (select ID from team where "name" = 'ЦСКА'), '2022-01-15', (select ID from team where "name" = 'ЦСКА'), 67, 77, (select ID from arena where "name" = 'СИБУР Арена')), 
(70, (select ID from team where "name" = 'Зенит'), (select ID from team where "name" = 'Олимпиакос'), '2022-10-20', (select ID from team where "name" = 'Зенит'), 84, 78, (select ID from arena where "name" = 'СИБУР Арена')),
(80, (select ID from team where "name" = 'Реал Мадрид'), (select ID from team where "name" = 'ЦСКА'), '2021-10-28', (select ID from team where "name" = 'Реал Мадрид'), 71, 65, (select ID from arena where "name" = 'Визинк-Центр - Паласио де Депортес')),
(90, (select ID from team where "name" = 'Реал Мадрид'), (select ID from team where "name" = 'Олимпиакос'), '2022-02-01', (select ID from team where "name" = 'Реал Мадрид'), 75, 67, (select ID from arena where "name" = 'Визинк-Центр - Паласио де Депортес')),
(100, (select ID from team where "name" = 'ЦСКА'), (select ID from team where "name" = 'Олимпиакос'), '2022-02-02', (select ID from team where "name" = 'ЦСКА'), 79, 78, (select ID from arena where "name" = 'УСК ЦСКА им. А.Я. Гомельского'));
select*from arena;
select*from game;

--Упражнение 3--
select name 
from arena
where size > 9000
order by name asc;

--Упражнение 4--
select name
from player
where position = 'защитник' or position = 'форвард'
order by name desc;

--Упражнение 5--
select name 
from player
where height > 215 or weight > 120
order by name asc;
select*from player;

--Проект 2.3--

--Упр.1--
select player, position
FROM player
where height between 188 and 200
and salary between 100000 and 150000
order by player desc


--Упр.2--
select 'город: ' || city || '; команда: ' || name || '; тренер: ' ||  coach_name as "полная информация" 
from team
order by "полная информация"

--Упр.3--
select arena, size 
from arena
where id in (10, 30, 50)
order by size, arena

--Упр.4--
select arena, size 
from arena
where id not in (10, 30, 50)
order by size, arena

--Упр.5--
select player, position
from player
where height between 188 and 220 and 
position in ('защитник', 'центровой')
order by position desc, name desc

--Проект 2.4--

--Упр.1--
select name 
from arena
union 
select name 
from team 
order by name desc;

--Упр.2--
select name, 'стадион' as object_type
from arena
union
select name, 'команда' as object_type
from team
order by object_type desc, name;

--Упр.3--
select name, salary
from player
order by case when salary=475000 then 0 else 1 end, salary
limit 5;

--Упр.4--
select id
from player
except 
select id
from team 
order by id
limit 10;

--Упр.5--
(select id
from arena
except 
select id
from game)
union 
(select id
from game
except 
select id 
from arena)
order by 1;

select*from player; 



	