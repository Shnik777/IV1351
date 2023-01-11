
-----------------------------------------------------------------------------------------------------
------------QUERIES AND VIEWS FOR SEMINAR 3----------------------------------------------------------
-----------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--Extracts the month part from the date and counts the
--number of lessons, inner join removes all lessons that
--are not grouplessons, Condition set to a specified year 
-------------------------------------------------------------------------------
SELECT EXTRACT(month from date_slot) AS month,
COUNT(group_id) as GroupLessons from timeslot 
inner join group_lesson ON timeslot_id = time_id
where extract(year from date_slot)='2023'
group by month;

SELECT EXTRACT(month from date_slot) AS month,
COUNT(ensemble_id) as Ensembles 
from timeslot inner join ensemble ON timeslot_id = time_id
where extract(year from date_slot)='2023'
group by month;

SELECT EXTRACT(month from date_slot) AS month,
COUNT(*) as PrivateLessons from (SELECT date_slot
FROM timeslot
inner join private_lesson on timeslot_id=time_id where extract(year from date_slot)='2023') as kkoooooo 
group by month;
----------------------------------------------------------------------------------------------------
--takes the sum of the above queries to get the total number of lessons
----------------------------------------------------------------------------------------------------
SELECT month, SUM(groupLessons) from (
SELECT EXTRACT(month from date_slot) as month, COUNT(group_lesson.group_id) as groupLessons from group_lesson
inner join timeslot on timeslot_id = time_id
where  extract(year from date_slot)='2022' -----Sets the year and month to be checked
GROUP BY month
union all

SELECT EXTRACT(month from date_slot) as month, COUNT(private_lesson.private_id) as PrivateLessons from private_lesson

inner join timeslot on timeslot_id = time_id
where extract(year from date_slot)='2022' -----Sets the year and month to be checked
GROUP BY month
union all

SELECT EXTRACT(month from date_slot) as month, COUNT(ensemble.ensemble_id) as Ensemble from ensemble

inner join timeslot on timeslot_id = time_id
where extract(year from date_slot)='2022' -----Sets the year and month to be checked

GROUP BY month) as hhheeee

group by month
ORDER BY SUM ASC	--Order by the amount of lessons in descending order
;
-------------------------------------------------------------------------------------------------
--Calculates the number of siblings each student have, will
--be used as subquery below
-----------------------------------------------------------------------------------------------
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
--Set of queries to verify the amount of specific lessons a teacher has.
--The person_id is joined with instructor id and the amount of lessons are grouped
--by the instructors ssn.
-------------------------------------------------------
SELECT person.ssn, COUNT(private_lesson.private_id) as privateLesson from person
inner join private_lesson on private_lesson.instructor_id = person.person_id
inner join timeslot on timeslot_id = time_id
where EXTRACT(month from date_slot) = '12' and extract(year from date_slot)='2022'
GROUP BY person.ssn;
-------------------------------------------------------
SELECT person.ssn, COUNT(group_lesson.group_id) as Grouplesson from person
inner join group_lesson on group_lesson.instructor_id = person.person_id
inner join timeslot on timeslot_id = time_id
where EXTRACT(month from date_slot) = '12' and extract(year from date_slot)='2022'
GROUP BY person.ssn;
------------------------------------------------------------------
SELECT person.ssn, COUNT(ensemble.ensemble_id) as Ensemble from person
inner join ensemble on ensemble.instructor_id = person.person_id
inner join timeslot on timeslot_id = time_id
where EXTRACT(month from date_slot) = '12' and extract(year from date_slot)='2022'
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
inner join timeslot on timeslot_id = time_id
where EXTRACT(month from date_slot) = '12' and extract(year from date_slot)='2022' -----Sets the year and month to be checked
GROUP BY person.ssn
union all

SELECT person.ssn, COUNT(private_lesson.private_id) as PrivateLessons from person
inner join private_lesson on private_lesson.instructor_id = person.person_id
inner join timeslot on timeslot_id = time_id
where EXTRACT(month from date_slot) = '12' and extract(year from date_slot)='2022' -----Sets the year and month to be checked
GROUP BY person.ssn
union all

SELECT person.ssn, COUNT(ensemble.ensemble_id) as Ensemble from person
inner join ensemble on ensemble.instructor_id = person.person_id
inner join timeslot on timeslot_id = time_id
where EXTRACT(month from date_slot) = '12' and extract(year from date_slot)='2022' -----Sets the year and month to be checked

GROUP BY person.ssn) as hhheeee

group by ssn
having SUM(groupLessons) >1 --specifies the least amount of lessons shown
ORDER BY SUM DESC	--Order by the amount of lessons in descending order
;
----------------------------------------------------------
--Shows all ensembles for a specified week along with the number of available seats
--The query counts the number of attending students and compares it with the maximum 
--number of allowed students. The case statement separates the answer depending on
--the number of available seats.
----------------------------------------------------------
SELECT genre, timeslot.time_slot, EXTRACT(day from date_slot) as day_of_the_week, 
(CASE WHEN (COUNT(student_ensemble.ensemble_id)) = max_students
	  THEN 'full'
	  WHEN (max_students - (COUNT(student_ensemble.ensemble_id))) between 1 and 2
	  THEN '1-2 spots'
	  ELSE '3+'
	  END)
	  AS seats 

 from ensemble
 
inner join timeslot on timeslot_id=time_id
inner join student_ensemble on student_ensemble.ensemble_id=ensemble.ensemble_id
where date_slot between '2023-01-07' and '2023-01-14'	--Sets the week to be shown
GROUP BY timeslot.time_slot, ensemble.genre, timeslot.date_slot, max_students
ORDER BY day_of_the_week ASC, genre ;		-- Orders it by the day of the week first and secondary ordering it with genre.