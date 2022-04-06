select cm.course_id, cm.course_name
from course_main cm
where SUBSTRING(cm.course_id,18,4) = '1101'
and cm.service_level = 'F'
and (cm.course_name LIKE '%SANDPIT%'
or cm.course_id LIKE '%SANDPIT%'
or cm.course_name LIKE '%TEST%'
or cm.course_id LIKE '%TEST%'
or cm.course_name LIKE '%PLAY%'
or cm.course_id LIKE '%PLAY%')