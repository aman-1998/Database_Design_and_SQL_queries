CREATE TABLE login_info (
    "USER_ID"      NUMBER(1, 0) NOT NULL,
    "LOGIN_TIME"   TIMESTAMP(0) NOT NULL
);


INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-10 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (2, TIMESTAMP '2017-08-11 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (3, TIMESTAMP '2017-08-11 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (2, TIMESTAMP '2017-08-13 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (3, TIMESTAMP '2017-08-14 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (4, TIMESTAMP '2017-08-15 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (5, TIMESTAMP '2017-08-12 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (2, TIMESTAMP '2017-08-18 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-11 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-12 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-13 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-14 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-15 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-16 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (1, TIMESTAMP '2017-08-17 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (3, TIMESTAMP '2017-08-20 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (5, TIMESTAMP '2017-08-16 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (2, TIMESTAMP '2017-08-21 14:32:25');
INSERT INTO login_info (user_id, login_time) VALUES (3, TIMESTAMP '2017-08-22 14:32:25');

-------------or,

INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('10-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (2, TO_TIMESTAMP('11-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (3, TO_TIMESTAMP('11-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (2, TO_TIMESTAMP('13-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (3, TO_TIMESTAMP('14-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (4, TO_TIMESTAMP('15-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (5, TO_TIMESTAMP('12-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (2, TO_TIMESTAMP('18-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('11-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('12-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('13-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('14-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('15-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('16-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (1, TO_TIMESTAMP('17-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (3, TO_TIMESTAMP('20-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (5, TO_TIMESTAMP('16-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (2, TO_TIMESTAMP('21-AUG-17 02:32:25 PM'));
INSERT INTO login_info (user_id, login_time) VALUES (3, TO_TIMESTAMP('22-AUG-17 02:32:25 PM'));