-- Oracle LiveSQL
-- Assume the group only book for the room for next day used

CREATE TABLE ProjectRoomBookings (       
roomNum INTEGER NOT NULL,       
startTime INTEGER NOT NULL,       
endTime INTEGER NOT NULL,       
groupName CHAR(10) NOT NULL,       
overlaps number(1) default(0) check(overlaps = 0),    
constraint pk_ProjectRoomBookings primary key (roomNum, startTime),    
constraint roomNum_check check (1 <= roomNum AND roomNum <= 10),
constraint earliest_time check (7 <= startTime),  
constraint lastest_time check (endTime <= 18), 
constraint time_mistype check (startTime < endTime)     
);

create or replace trigger ProjectRoomBookings_trigger    
before insert on ProjectRoomBookings    
for each row    
begin    
update ProjectRoomBookings set overlaps = overlaps + 1    
where (   
    (:new.roomNum = roomNum)   
    and(   
        (:new.startTime >= startTime and :new.startTime < endTime)     
        or     
        (:new.endTime > startTime and :new.endTime < endTime)    
        or    
        (startTime >= :new.startTime and startTime < :new.endTime)    
    )    
);   
end;
/

-- general test case:
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 9, 12, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 9, 7, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 6, 8, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 13, 13, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(001, 17, 19, ’aaa');

-- Overlap Test Case
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 9, 12, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 10, 11, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 8, 9, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(007, 7, 10, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 7, 10, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 8, 9, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 10, 12, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 9, 11, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 8, 11, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 12, 14, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 11, 13, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 12, 14, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 16, 17, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 17, 18, ’aaa');
-- insert into ProjectRoomBookings (roomNum, startTime, endTime, groupName) values(006, 16, 18, ’aaa');





