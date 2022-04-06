--SELECT *
SELECT to_char(timestamp, 'dd/mm/yyyy hh24:mi:ss') as time, u.user_id,cm.COURSE_ID,cm.COURSE_NAME,u.firstname, u.lastname, u.email,u.system_role,aa.internal_handle, aa.event_type,aa.data, aa.status, aa.session_id 
FROM activity_accumulator aa
INNER JOIN course_main cm ON aa.course_pk1 = cm.pk1
INNER JOIN users u ON aa.user_pk1 = u.pk1
--INNER JOIN course_contents cc ON aa.content_pk1 = cc.pk1
--WHERE cm.course_id LIKE <INSERT COURSE ID>'
WHERE u.student_id IN ('') -- Enter Users Student ID, or
--where user_id IN ('') -- Enter Users' User ID
and (timestamp,timestamp) OVERLAPS ('2018-09-01'::DATE, '2020-09-01'::DATE);
ORDER BY time ASC;


-- BB5f0eeec577cec -> public
-- Data upto 6 months

-- BB5f0eeec577cec_stat -> public
-- For older/archived data