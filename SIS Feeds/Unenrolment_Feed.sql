select cm.course_id,student_id, role,'DISABLED|Y'
from course_main cm
inner join course_users cu on cm.pk1 = cu.crsmain_pk1
inner join users u on u.pk1 = cu.users_pk1
--where cm.course_id = ''  -- add full Course ID
where cm.service_level = 'F'
and user_id in('') -- add comma separated list of student_id in single quotes e.g. ('abcdefgh','ijklmnop')
order by cm.dtmodified desc

/*
Save the results
Open in Notepad++
Replace the header labels (first line) with
EXTERNAL_COURSE_KEY|EXTERNAL_PERSON_KEY|ROLE|ROW_STATUS|AVAILABLE_IND 
Find " and replace with nothing
Find , and replace with |

Double check the output, but it should produce something similar to

EXTERNAL_COURSE_KEY|EXTERNAL_PERSON_KEY|ROLE|ROW_STATUS|AVAILABLE_IND
I3088-SPLA-51011-1201-1SE-037938|10499745|S|DISABLED|Y
I3088-SPLA-51011-1201-1SE-037938|10449707|S|DISABLED|Y
I3088-SPLA-51011-1201-1SE-037938|10319926|S|DISABLED|Y

Save file
Upload to required SIS Endpoint with correct parameters,s uch as "Course Membership"
*/