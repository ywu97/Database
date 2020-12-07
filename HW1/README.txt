######################################################################################################################################################


The objective of the Design: 
Design a database for a small 'STEM' organization that is interested in offering programming courses in their community, during summer vacation.


Entities and Attributes:
==========================


1.CODING COURSE
=================
This entity is used to record some basic information based on each coding course.
Assume that the system has different kinds of coding courses(Java, Python, C, Cpp, etc.) and each course can have many classes that can be taught by different instructors.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
CRS_CODE(PK)

Other Attributes:
--------------------------
CRS_DESCRIPTION, AVG-RATING


2.CLASS
========
CLASS_CODE for each class is unique.
Assume there is no conflict that different CLASS_CODE but same CLASS_TIME, CLASS_DATE, and CLASSROOM_CODE.
------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
CLASS_CODE(PK), CLASS_TIME, CLASS_DATE, CRS_CODE(FK), CLASSROOM_CODE(FK), PROF_ID(FK)

Other Attributes:
--------------------------
PROF_LNAME, PROF_FNAME, PROF_EMAIL




3.PROJECT
==========
Each class will have many projects.
For each project-group their PROJ_CODE is unique.
Each PROJ_CODE can have at most 4 students.
Assume each PROJECT starts at the same time as the related class, so the DEADLINE OF THE PROJECT = 1 week + START_DATE
------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
CLASS_CODE(PK, FK), CONTR_CODE(PK), PROJ_CODE(PK), TABLE_CODE(FK), PROJ_ROOM_CODE(FK), FLAT_FEE, START_DATE

Other Attributes:
--------------------------
PROJ_NAME, HWR_CODE(FK), AVG_RATING


4.STUDENT
=========
BALANCE = FLAT_FEE(in PROJECT) + *DAMAGE FEE(in PART) + *Late_Fee(in BOOK_ORDER)(NOTE: '*' = IF APPLICABLE)
STU_ID for each student is unique
------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
STU_ID(PK), STU_LNAME, STU_FNAME, STU_EMAIL, BALANCE

Other Attributes:
--------------------------
HIGH_SCHOOL


5.ROOM_FOR_CLASS
====================
CLASSROOM_CODE is unique
------------------------------------------------

Require Attribute:
-------------------------
CLASSROOM_CODE(PK),CLASS_TIME(PK, FK), CLASS_DATE(PK, FK),CLASS_CODE(FK)

Other Attributes:
--------------------------
CAPACITY


6.TABLE
=======
Assume the PROJ_ROOM_CODE and TABLE_CODE are assigned for each project, and they are project-based. If the students sign up for the project, they will get the 
room and table for the project also.
TABLE_CODE is unique for each table.
----------------------------------------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
TABLE_CODE(PK), PROJ_ROOM_CODE(FK), TIME(PK), DATE(PK), PROJ_CODE(FK)

Other Attributes:
--------------------------


7.ROOM_FOR_PROJECT
========================
ROOM_CAPACITY: # of tables in this room
PROJ_ROOM_CODE is unique
-----------------------------------------------------------

Require Attribute:
-------------------------
PROJ_ROOM_CODE(PK)

Other Attributes:
--------------------------
CAPACITY

 
8.MICROCONTROLLER
=====================
CONTR_CODE is unique.
------------------------------

Require Attribute:
-------------------------
CONTR_CODE(PK), CONTR_NAME

Other Attributes:
--------------------------


9.PARTS
=======
In this table, we can clearly see each part that a specific microcontroller contains.
Assume there is one and only one supplier for each part
Assume a controller won't contain two same PART_CODE parts.
Assume different controllers won't contain the same PART_CODE part.
Each microcontroller contains at most 4 parts.
--------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
PART_CODE(PK), PART_SUPP_CODE(PK, FK), CONTR_CODE(PK,FK), DAMAGE_CHARGE

Other Attributes:
--------------------------
PART_NAME


10. HARDWARE
=============
This table is used to place an order from each HARDWARE supplier
Assume there is one and only one supplier for each hardware and the supplier cannot also produce PARTS.
the quantity attribute = the sum of the same HWR_CODE show in the HARDWARE table 
------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
HWR_CODE(PK), HWR_SUPP_CODE(PK), HWR_NAME, HWR_SUPP_NAME, RETAIL_PRICE, QUANTITY

Other Attributes:
--------------------------


11.PARTS_SUPPLIER
===========
This table is used to place an order from each PART supplier
the quantity attribute = the sum of the same CONTR_CODE (which contains this part) show in the PROJECT table 
------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
PART_SUPP_CODE(PK), RETAIL_PRICE, QUANTITY, PART_SUPP_NAME, PART_CODE(PK, FK)

Other Attributes:
--------------------------


12.REVIEW
=========
The input number of rate should in a range(1~5)
--------------------------------------------------------------------------------

Require Attribute:
-------------------------
STU_ID(PK, FK), PROF_ID(PK, FK), CLASS_CODE(PK, FK), PROJ_CODE(PK, FK), RATE_PROF, RATE_CLASS, RATE_PROJ

Other Attributes:
--------------------------


13.LIBRARY
==========
Require Attribute:
-------------------------
ISBN(PK), AUTHOR_NAME, BOOK_NAME, EDITION, QUANTITY

Other Attributes:
--------------------------


14.INSTRUCTOR
==============
Assume each instructor only works 8hr/day * 20 DAYS = 160 HR
PROJ_HR = 160HR - TEACH_HR
Assume each instructor only focuses on the project which is under one of his or her classes.
---------------------------------------------------------------------------------------

Require Attribute:
-------------------------
PROF_ID(PK), PROF_LNAME, PROF_FNAME, PROF_EMAIL, TEACH_HR, PROJ_HR

Other Attributes:
--------------------------
AVG_RATING




Composite Entities: 
=====================


1.ENROLL_CLASS_AND_PROJECT
=============================
NOTE: The combination of PROJ_CODE+CLASS_CODE should not exist more than 4 times(we can have a maximum of 4 students in the same group)
Assume the student should enroll the PROJ_CODE should depend on the CLASS_CODE in PROJECT table.
(i.e. The same  combination of CLASS_CODE + PROJ_CODE should also exists in PROJECT table.)
-------------------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
CLASS_CODE(PK, FK), STU_ID(PK, FK), PROJ_CODE(PK, FK)

Other Attributes:
--------------------------
ENROLL_DATE


2.STUDENT_PARTS
=================

Require Attribute:
-------------------------
STU_ID(PK, FK), PART_CODE(PK, FK)

Other Attributes:
--------------------------


3.BOOK_ORDER
===============
NOTE: If the same STU_ID's QUANTITY > 4 this student cannot borrow any book until the student return at least one book.
The student should return the book in two weeks since the ORDER_DATE, if the RETURN_DATE - ORDER_DATE > 14 the Late_fee($5/day) will apply to the student's balance
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Require Attribute:
-------------------------
STU_ID(PK, FK), ISBN(PK, FK), ORDER_DATE, RETURN_DATE, QUANTITY

Other Attributes:
--------------------------


4.TEXTBOOK_LIST
================
Require Attribute:
-------------------------
CLASS_CODE(PK, FK), ISBN(PK, FK), PROF_ID(FK), BOOK_NAME, AUTHOR_NAME, EDITION

Other Attributes:
--------------------------


######################################################################################################################################################