SELECT cm.course_id as "EXTERNAL_COURSE_KEY",
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
--where cm.course_id = 'I3115-MEDN-60030-1201-1YR-040366'  -- add Course 
where ((SUBSTRING(cm.course_id,18,4)) like ('1201')
and (cu.date_last_modified,cu.date_last_modified) OVERLAPS ('2021-02-01'::DATE, '2021-03-01'::DATE))
--AND (cm.course_id like '%I3016%' OR cm.course_id like '%I3031%' OR cm.course_id like '%I3088%' OR cm.course_id like '%I3028%' OR cm.course_id like '%I3041%') -- Humanities
--AND (cm.course_id like '%I3022%' or cm.course_id like '%I3021%' or cm.course_id like '%I3023%' or cm.course_id like '%I3025%' or cm.course_id like '%I3027%' or cm.course_id like '%I2000%' or cm.course_id like '%I3035%' or cm.course_id like '%I3034%' or cm.course_id like '%I3033%' or cm.course_id like '%I3039%' or cm.course_id like '%I3043%' or cm.course_id like '%I3060%' or cm.course_id like '%I3061%' or cm.course_id like '%I3062%' or cm.course_id like '%I3066%' or cm.course_id like '%I3100%' or cm.course_id like '%I3112%' or cm.course_id like '%I3119%') -- FSE
--AND (cm.course_id like '%I3114%' or cm.course_id like '%I3115%' or cm.course_id like '%I3116%' or cm.course_id like '%I2018%' or cm.course_id like '%I3032%') -- FBMH
order by cm.course_id ASC;

-- To create a proper SIS Feed
-- Download the data and load in NotePad++,
-- 				then replace , with nothing
-- 				then replace " with |