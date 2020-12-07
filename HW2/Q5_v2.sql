-- Oracle LiveSQL
-- (ps. not sure whether this can be considered as another version or not LOL)
-- main idea: Division
-- the where condition 'where Subject IN (select Subject from Subject)' will select the insturctor
-- who teaches the class in the Subject table
-- and the group by + count condition will comepare whether the times which instructors show on the where
-- result is equal to the total number of classes in the Subject table


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


select Instructor 
from Teaching 
where Subject IN (select Subject from Subject) 
group by Instructor 
having count(*) = (select count(*) from Subject);
