-- Oracle LiveSQL
-- the right outer join will give us the table for each teacher who teach the 
-- class in the Subject list(the class not in the Subject table will not show on the result).  
-- Then we use group by and count(*) to select the teacher who teach the same amount 
-- of classes in the result table as in the Subject table.

create table Subject( 
Subject varchar(20) not null, 
constraint pk_Subject primary key(Subject) 
);

create table Teaching( 
Instructor     varchar(20) not null, 
Subject        varchar(20) not null, 
constraint pk_teaching primary key(Instructor, Subject) 
);

insert into Teaching (Instructor, Subject) values ('Aleph','Scratch');
insert into Teaching (Instructor, Subject) values ('Aleph','Java');
insert into Teaching (Instructor, Subject) values ('Aleph','Processing');
insert into Teaching (Instructor, Subject) values ('Bit','Python');
insert into Teaching (Instructor, Subject) values ('Bit','JavaScript');
insert into Teaching (Instructor, Subject) values ('Bit','Java');
insert into Teaching (Instructor, Subject) values ('CRC','Python');
insert into Teaching (Instructor, Subject) values ('CRC','JavaScript');
insert into Teaching (Instructor, Subject) values ('Dat','Scratch');
insert into Teaching (Instructor, Subject) values ('Dat','Python');
insert into Teaching (Instructor, Subject) values ('Dat','JavaScript');
insert into Teaching (Instructor, Subject) values ('Emscr','Scratch');
insert into Teaching (Instructor, Subject) values ('Emscr','Processing');
insert into Teaching (Instructor, Subject) values ('Emscr','JavaScript');
insert into Teaching (Instructor, Subject) values ('Emscr','Python');
insert into Subject (Subject) values ('JavaScript');
insert into Subject (Subject) values ('Scratch');
insert into Subject (Subject) values ('Python');


select t1.Instructor 
from Teaching t1 right outer join Subject s1  
on t1.Subject = s1.Subject 
group by t1.Instructor 
having count(*) = (select count(*) from Subject)
;
