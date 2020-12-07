-- Oracle LiveSQL
-- Expect output: 100

create table Project( 
PID number, 
Step number, 
Status char, 
constraint pk_Project primary key (PID, Step) 
);

insert into Project (PID, Step, Status) values (100, 1, 'W');
insert into Project (PID, Step, Status) values (100, 2, 'W');
insert into Project (PID, Step, Status) values (201, 0, 'C');
insert into Project (PID, Step, Status) values (201, 1, 'C');
insert into Project (PID, Step, Status) values (333, 0, 'W');
insert into Project (PID, Step, Status) values (333, 1, 'W');
insert into Project (PID, Step, Status) values (333, 2, 'W');
insert into Project (PID, Step, Status) values (333, 3, 'W');
insert into Project (PID, Step, Status) values (100, 0, 'C');

select p1.PID  
from Project p1  
where p1.Step = 0  
and p1.Status = 'C' 
and 'W' = ALL(select p2.Status  
              from Project p2  
              where p2.Step <> 0  
              and p1.PID = p2.PID  
            )
;
