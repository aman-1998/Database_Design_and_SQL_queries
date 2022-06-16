/* 1. Write SQL to find out students who attended school on their birthday from attendance_events and all_students tables. */
--Ans:
WITH students_with_birthday AS (
    SELECT
        als.student_id,
        als.school_id,
        als.grade_level,
        to_char(to_date(als.date_of_birth, 'dd-mm-yy'), 'dd-mm-yy') AS birthday,
        als.hometown,
        to_char(to_date(ae.date_event, 'dd-mm-yy'), 'dd-mm-yy') AS date_event,
        ae.attendance
    FROM
        all_students        als,
        attendance_events   ae
    WHERE
        als.student_id = ae.student_id
), dates_without_year AS (
    SELECT
        swb.*,
        substr(swb.birthday, 1, length(swb.birthday) - length(reverse(substr(reverse(swb.birthday), 1, instr(reverse(swb.birthday
        ), '-') - 1)))) AS birthday_without_year,
        substr(swb.date_event, 1, length(swb.date_event) - length(reverse(substr(reverse(swb.date_event), 1, instr(reverse(swb.date_event
        ), '-') - 1)))) AS date_event_without_year
    FROM
        students_with_birthday swb
)
SELECT
    dwy.student_id,
    dwy.school_id,
    dwy.grade_level,
    dwy.birthday,
    dwy.hometown
FROM
    dates_without_year dwy
WHERE
    dwy.birthday_without_year = dwy.date_event_without_year
    AND dwy.attendance = 'present'
	
--------------or,

WITH student_data_with_dates_without_year AS (
    SELECT
        als.student_id,
        als.school_id,
        als.grade_level,
        to_char(to_date(als.date_of_birth, 'dd-mm-yy'), 'dd')
        || '-'
        || to_char(to_date(als.date_of_birth, 'dd-mm-yy'), 'mm') AS birthday_without_year,
        als.hometown,
        to_char(to_date(ae.date_event, 'dd-mm-yy'), 'dd')
        || '-'
        || to_char(to_date(ae.date_event, 'dd-mm-yy'), 'mm') AS date_event_without_year,
        ae.attendance
    FROM
        all_students        als,
        attendance_events   ae
    WHERE
        als.student_id = ae.student_id
)
SELECT DISTINCT
    *
FROM
    student_data_with_dates_without_year sdwdwy
WHERE
    sdwdwy.birthday_without_year = sdwdwy.date_event_without_year
    AND sdwdwy.attendance = 'present'
	
----------------------------------------------------------------------------------------------------------------------------------------------
/* 2. Write SQL to find out percentage of students who attended school on their birthday from attendance_events and all_students tables. */
--Ans:
WITH student_data_with_dates_without_year AS (
    SELECT
        als.student_id,
        als.school_id,
        als.grade_level,
        to_char(to_date(als.date_of_birth, 'dd-mm-yy'), 'dd')
        || '-'
        || to_char(to_date(als.date_of_birth, 'dd-mm-yy'), 'mm') AS birthday_without_year,
        als.hometown,
        to_char(to_date(ae.date_event, 'dd-mm-yy'), 'dd')
        || '-'
        || to_char(to_date(ae.date_event, 'dd-mm-yy'), 'mm') AS date_event_without_year,
        ae.attendance
    FROM
        all_students        als,
        attendance_events   ae
    WHERE
        als.student_id = ae.student_id
), students_attended_schools_on_birthday AS (
    SELECT DISTINCT
        COUNT(*) AS no_of_students_attended_schools_on_birthday
    FROM
        student_data_with_dates_without_year sdwdwy
    WHERE
        sdwdwy.birthday_without_year = sdwdwy.date_event_without_year
        AND sdwdwy.attendance = 'present'
), total_students AS (
    SELECT
        COUNT(als.school_id) AS total_no_of_students
    FROM
        all_students als
)
SELECT
    ( sasob.no_of_students_attended_schools_on_birthday * 100 ) / ts.total_no_of_students AS percentage
FROM
    students_attended_schools_on_birthday sasob,
    total_students ts
	
--------------------------------------------------------------------------------------------------
/* 3.  */