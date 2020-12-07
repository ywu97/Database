-- Oracle LiveSQL
-- Assume we have two following table:
-- Class(S_ID, instructor_id, class_id)
-- Instructor(instructor_id, hourly_rate)
-- Instructor's hourly_rate can be identical or unique depended on each instructor_id
-- instructor_id = 1 hourly_rate = 10 teaches class_id = 001: 1 students
-- instructor_id = 2 hourly_rate = 10 teaches class_id = 002 and 004: 4 students
-- instructor_id = 3 hourly_rate = 10 teaches class_id = 003 and 005: 7 students



create table Instructor(   
instructor_id    number not null,   
hourly_rate      number not null,   
constraint pk_Instructor primary key(instructor_id)   
);

create table Class(   
S_ID               number not null,   
instructor_id      number not null,   
Class_id           number not null,   
constraint pk_Class primary key(S_ID, Class_id),   
constraint fk_Class foreign key(instructor_id) references Instructor (instructor_id)     
)
;

insert into Instructor (instructor_id, hourly_rate) values (001, 10);
insert into Instructor (instructor_id, hourly_rate) values (002, 10);
insert into Instructor (instructor_id, hourly_rate) values (003, 10);

insert into Class (S_ID, instructor_id, Class_id) values(123, 001, 001);
insert into Class (S_ID, instructor_id, Class_id) values(123, 003, 003);
insert into Class (S_ID, instructor_id, Class_id) values(662, 002, 004);
insert into Class (S_ID, instructor_id, Class_id) values(662, 002, 002);
insert into Class (S_ID, instructor_id, Class_id) values(662, 003, 005);
insert into Class (S_ID, instructor_id, Class_id) values(662, 003, 003);
insert into Class (S_ID, instructor_id, Class_id) values(345, 003, 003);
insert into Class (S_ID, instructor_id, Class_id) values(345, 003, 005);
insert into Class (S_ID, instructor_id, Class_id) values(345, 002, 002);
insert into Class (S_ID, instructor_id, Class_id) values(555, 002, 002);
insert into Class (S_ID, instructor_id, Class_id) values(555, 003, 005);
insert into Class (S_ID, instructor_id, Class_id) values(213, 003, 005);


select MAX (0.1 * hourly_rate * total) AS Highest_bones  
from instructor i1 inner join (select instructor_id, Count(*) As total     
                                from Class    
                                Group by instructor_id) i2  
on i1.instructor_id = i2.instructor_id
;

