CREATE TABLE all_students (
    "STUDENT_ID"      NUMBER(6, 0) NOT NULL,
    "SCHOOL_ID"       NUMBER(3, 0) NOT NULL,
    "GRADE_LEVEL"     NUMBER(1, 0) NOT NULL,
    "DATE_OF_BIRTH"   DATE NOT NULL,
    "HOMETOWN"        VARCHAR2(25) NOT NULL,
    CONSTRAINT "STUDENT_ID_PK" PRIMARY KEY ( "STUDENT_ID" )
);

CREATE TABLE attendance_events (
    "DATE_EVENT"   DATE NOT NULL,
    "STUDENT_ID"   NUMBER(6, 0) NOT NULL,
    "ATTENDANCE"   VARCHAR2(20) NOT NULL,
    CONSTRAINT "STUDENT_ID_FK" FOREIGN KEY ( "STUDENT_ID" )
        REFERENCES all_students ( "STUDENT_ID" )
            ON DELETE CASCADE
);


INSERT INTO all_students(student_id, school_id, grade_level, date_of_birth, hometown) VALUES (110111, 205, 1, '10-JAN-2013', 'Pleasanton');
INSERT INTO all_students(student_id, school_id, grade_level, date_of_birth, hometown) VALUES (110115, 205, 1, '15-MAR-2013', 'Dublin');
INSERT INTO all_students(student_id, school_id, grade_level, date_of_birth, hometown) VALUES (110119, 205, 2, '13-FEB-2012', 'San Ramon');
INSERT INTO all_students(student_id, school_id, grade_level, date_of_birth, hometown) VALUES (110121, 205, 3, '13-JAN-2011', 'Dublin');
INSERT INTO all_students(student_id, school_id, grade_level, date_of_birth, hometown) VALUES (110125, 205, 2, '25-APR-2012','Dublin');
INSERT INTO all_students(student_id, school_id, grade_level, date_of_birth, hometown) VALUES (110129, 205, 3, '22-FEB-2011', 'San Ramon');


INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('10-JAN-2018', 110111, 'present');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('10-JAN-2018', 110121, 'present' );
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('12-JAN-2018', 110115, 'absent');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('13-JAN-2018', 110119, 'absent');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('13-JAN-2018', 110121, 'present');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('14-JAN-2018', 110125, 'present');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('05-FEB-2018', 110111, 'absent');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('17-FEB-2018', 110115, 'present');
INSERT INTO attendance_events (date_event, student_id, attendance) VALUES ('22-FEB-2018', 110129, 'absent');
