select cm.course_id as "EXTERNAL_COURSE_KEY",
u.student_id AS "EXTERNAL_PERSON_KEY",
cu.role as "ROLE",
cu.available_ind AS "AVAILABLE_IND",
	CASE
		WHEN cu.row_status = 0
   			THEN 'ENABLED'
   		WHEN cu.row_status = 1
   			THEN 'DELETE'
   		WHEN cu.row_status = 2
			THEN 'DISABLED'
	END AS "ROW_STATUS"
from course_main cm
inner join course_users cu on cm.pk1 = cu.crsmain_pk1
inner join users u on u.pk1 = cu.users_pk1 
where ((SUBSTRING(cm.course_id,18,4)) like ('1201')
and (cu.date_last_modified,cu.date_last_modified) OVERLAPS ('2021-03-01'::DATE, '2021-03-03'::DATE))
order by cm.course_id ASC;

-- To create a proper SIS Feed
-- Download the data and load in NotePad++,
-- 				then replace , with nothing
-- 				then replace " with |