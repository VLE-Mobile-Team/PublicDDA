select cm.course_id as "COURSE ID", 
cm.course_name as "COURSE NAME",
cm.dtcreated as "DATE CREATED",
cm.dtmodified as "LAST MODIFIED",
TO_CHAR(AGE(NOW(),cm.dtcreated), 'YY "Years" mm "Months" DD "Days"') as "AGE OF COURSE",
CASE
	WHEN cm.service_level = 'F'
		THEN 'COURSE'
	WHEN cm.service_level = 'C'
		THEN 'ORGANISATION'
END as "TYPE",
cm.available_ind as "AVAILABILITY",
CASE
	WHEN cm.row_status = '2'
		THEN 'DELETED'
	WHEN cm.row_status = '1'
		THEN 'DISABLED'
	WHEN cm.row_status = '0'
		THEN 'ENABLED'
END as "STATUS"
from course_main cm
where extract(year from AGE(NOW(), cm.dtcreated))> 7
and SUBSTRING(cm.course_id,1,5) IN ('I3022','I3021','I3023','I3025','I3027','I2000','I3035','I3034','I3033'
									,'I3039','I3043','I3060','I3061','I3062','I3066','I3100','I3112','I3119')