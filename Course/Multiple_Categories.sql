select cm.course_id
from course_main cm
inner join gateway_course_categories gcc on gcc.crsmain_pk1 = cm.pk1
inner join gateway_categories gc on gc.pk1 = gcc.gatewaycat_pk1
where (
		(gc.batch_uid = 'COURSE_CURRENT' or gc.batch_uid = 'COURSE_ENDED')
			AND
		(SUBSTRING(cm.course_id,1,1)) = 'I'
			AND
		(SUBSTRING(cm.course_id,18,4)) NOT IN ('120_')
			AND
		cm.service_level = 'F'
	  )
group by cm.course_id
HAVING COUNT(gc.batch_uid) > 1
order by course_id desc


/*
Save the results
Open in Notepad++
Replace the header labels (first line) with
EXTERNAL_COURSE_KEY|EXTERNAL_PERSON_KEY|ROLE|ROW_STATUS|AVAILABLE_IND 
Find " and replace with nothing
Find , and replace with |

Double check the output, but it should produce something similar to

EXTERNAL_CATEGORY_KEY|EXTERNAL_COURSE_KEY|ROW_STATUS|AVAILABLE_IND
COURSE_ENDED|I2000-FOUN-10001-1191-1SE-014678|ENABLED|Y
COURSE_ENDED|I2000-FOUN-10011-1191-1SE-014675|ENABLED|Y
COURSE_ENDED|I2000-FOUN-10022-1191-2SE-014676|ENABLED|Y

Save file
Upload to required SIS Endpoint with correct parameters,s uch as "Course Catalogue Membership"
Choose "Delete"
*/