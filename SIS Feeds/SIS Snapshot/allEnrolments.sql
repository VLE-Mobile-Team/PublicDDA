select cm.course_id, u.student_id,cu.role,'Y|ENABLED'
from course_main cm
inner join course_users cu on cm.pk1 = cu.crsmain_pk1
inner join users u on u.pk1 = cu.users_pk1
--where cm.course_id = 'I3016-BMAN-11101-1201-1SE-040553'  -- add Course ID
WHERE (SUBSTRING(cm.course_id,18,4)) like '120_'
order by cm.dtmodified desc

/*
Save the results
Open in Notepad++
Replace the header labels (first line) with
EXTERNAL_COURSE_KEY|EXTERNAL_PERSON_KEY|ROLE|AVAILABLE_IND|ROW_STATUS
Find " and replace with nothing
Find , and replace with |

Double check the output, but it should produce something similar to

EXTERNAL_COURSE_KEY|EXTERNAL_PERSON_KEY|ROLE|ROW_STATUS|AVAILABLE_IND
I3132-MACE-30461-1201-1SE-003694|10432406|S|Y|ENABLED
I3116-NURS-10030-1201-1YR-039830|10396803|S|Y|ENABLED
I3133-MATH-10282-1201-2SE-026681|10732542|S|Y|ENABLED

Save file
Upload to required SIS Endpoint with correct parameters,s uch as "Course Membership"
*/