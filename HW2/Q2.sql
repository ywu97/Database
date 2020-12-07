-- Oracle LiveSQL
-- Expect output:

-- | ClassName  | Total |
--   ----------- -------
-- | Python     |  4    |
-- | JavaScript |  4    |
-- | Scratch    |  3    |  
-- | Processing |  1    |
-- | Java       |  1    |

create table enrollment (   
  StuID        number not null,   
  ClassName    varchar2(50) not null,   
  Grade        char,   
  constraint pk_enrollment primary key (StuID, ClassName)   
);

insert into enrollment (StuID, ClassName, Grade) values (123,'Processing', 'A');
insert into enrollment (StuID, ClassName, Grade) values (123,'Python', 'B');
insert into enrollment (StuID, ClassName, Grade) values (123,'Scratch', 'B');
insert into enrollment (StuID, ClassName, Grade) values (662,'Java', 'B');
insert into enrollment (StuID, ClassName, Grade) values (662,'Python', 'A');
insert into enrollment (StuID, ClassName, Grade) values (662,'JavaScript', 'A');
insert into enrollment (StuID, ClassName, Grade) values (345,'Scratch', 'A');
insert into enrollment (StuID, ClassName, Grade) values (345,'JavaScript', 'B');
insert into enrollment (StuID, ClassName, Grade) values (345,'Python', 'A');
insert into enrollment (StuID, ClassName, Grade) values (555,'Python', 'B');
insert into enrollment (StuID, ClassName, Grade) values (555,'JavaScript', 'B');
insert into enrollment (StuID, ClassName, Grade) values (213,'JavaScript', 'A');
insert into enrollment (StuID, ClassName, Grade) values  (662,'Scratch', 'B');

select ClassName, Count(*) AS Total  
from enrollment  
Group by ClassName  
Order by Total DESC;