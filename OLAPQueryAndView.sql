
-----------------------------------------------------------------------------------------------------
------------QUERIES AND VIEWS FOR SEMINAR 3----------------------------------------------------------
-----------------------------------------------------------------------------------------------------

-----------------------------------------------
--Extracts the month part from the date and count the 
--number of timeslots(total number of lessons)
--with the condition to only show a specified year
-----------------------------------------------
SELECT EXTRACT(month from date_slot) AS month,
COUNT(*) as TotalLessons from timeslot where extract(year from date_slot)='2023'
group by month;

-------------------------------------------------------------------------------
--Extracts the month part from the date and counts the
--number of lessons, inner join removes all lessons that
--are not grouplessons, Condition set to a specified year 
-------------------------------------------------------------------------------
SELECT EXTRACT(month from date_slot) AS month,
COUNT(group_id) as GroupLessons from timeslot 
inner join group_lesson ON timeslot_id = time_id
where extract(year from date_slot)='2022'
group by month;

SELECT EXTRACT(month from date_slot) AS month,
COUNT(ensemble_id) as Ensembles 
from timeslot inner join ensemble ON timeslot_id = time_id
where extract(year from date_slot)='2022'
group by month;

SELECT EXTRACT(month from date_slot) AS month,
COUNT(*) as PrivateLessons from (SELECT date_slot
FROM timeslot
inner join private_lesson on timeslot_id=time_id where extract(year from date_slot)='2022') as kkoooooo 
group by month;


-------------------------------------------------------
--Calculates the number of siblings each student have, will
--be used as subquery below
-------------------------------------------------------
SELECT COUNT(sibling.sibling_id) as siblingsss 
from student 
full join sibling on student.student_id = sibling.person_id 
GROUP BY student.student_id;

--------------------------------------------------------
--Uses the subquery above to count the number of students with the same
--amount of siblings and shows the number of students in one column and
--the number of siblings in the other.
------------------------------------------------------
CREATE VIEW sibling_counter AS
SELECT COUNT(siblingsss), siblingsss as numberofsiblings
from (SELECT COUNT(sibling.sibling_id) as siblingsss 
from student 
full join sibling on student.student_id = sibling.person_id 
GROUP BY student.student_id) as hopppp
--where hopppp.siblingsss between 0 and 2
GROUP BY siblingsss;

-------------------------------------------------------
--With the above view the query to show students and siblings.
--------------------------------------------------------
SELECT* from sibling_counter;


--------------------------------------------------------
--Set of queries to verify the amount of specific lesson a teacher
--The person_id is joined with instructor id and the amount of lessons are grouped
--by the instructors ssn.
-------------------------------------------------------
SELECT person.ssn, COUNT(private_lesson.private_id) as privateLesson from person
inner join private_lesson on private_lesson.instructor_id = person.person_id
GROUP BY person.ssn;
-------------------------------------------------------
SELECT person.ssn, COUNT(group_lesson.group_id) as Grouplesson from person
inner join group_lesson on group_lesson.instructor_id = person.person_id
GROUP BY person.ssn;
------------------------------------------------------------------
SELECT person.ssn, COUNT(ensemble.ensemble_id) as Ensemble from person
inner join ensemble on ensemble.instructor_id = person.person_id
GROUP BY person.ssn;
-----------------------------------------------------------------

-----------------------------------------------------------------
--The set of lessons id:s are grouped by UNION ALL to make room for doublets
--since the lessons id only is unique to its own table, The sum function calculates
--the total amount of lessons a teacher has.
-----------------------------------------------------------------
VACUUM ANALYZE;
EXPLAIN SELECT ssn, SUM(groupLessons) from (
SELECT person.ssn, COUNT(group_lesson.group_id) as groupLessons from person
inner join group_lesson on group_lesson.instructor_id = person.person_id
GROUP BY person.ssn
union all
SELECT person.ssn, COUNT(private_lesson.private_id) as PrivateLessons from person
inner join private_lesson on private_lesson.instructor_id = person.person_id
GROUP BY person.ssn
union all
SELECT person.ssn, COUNT(ensemble.ensemble_id) as Ensemble from person
inner join ensemble on ensemble.instructor_id = person.person_id

GROUP BY person.ssn) as hhheeee

group by ssn
having SUM(groupLessons) >6 --specifies the least amount of lessons shown
;
----------------------------------------------------------
----------------------------------------------------------
