SELECT
	distinct cm.pk1,
	cm.course_id,
	cm.course_name,
	cm.start_date,
	cm.end_date,
	STRING_AGG(u.firstname || ' ' || u.lastname, ', ') instructors,
	cm.allow_guest_ind AS guest_access,
	cm.available_ind AS available,
CASE
	cm.row_status
WHEN 0 THEN 'ENABLED'
WHEN 2 THEN 'DISABLED'
END AS row_status
FROM
	course_main cm,
	course_users cu,
	users u
WHERE
	cm.pk1 = cu.crsmain_pk1
	AND u.pk1 = cu.users_pk1
	AND cm.row_status = 0
	AND cm.available_ind = 'Y'
	AND cu.role = 'P'
	AND u.system_role IN ('N', 'SAS', 'SANDPIT_C_SYSROLE')
AND (SUBSTRING(cm.course_id,7,4)) IN ('MATS')
AND (SUBSTRING(cm.course_id,18,4)) IN ('1201')
	
GROUP BY cm.pk1, cm.ALLOW_GUEST_IND, cm.COURSE_ID, cm.COURSE_NAME ,cm.START_DATE, cm.END_DATE, cm.AVAILABLE_IND, cm.ROW_STATUS
order by cm.course_id,cm.start_date