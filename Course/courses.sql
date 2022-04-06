select cm.course_id, cm.course_name
from course_main cm
where SUBSTRING(cm.course_id,18,4) = '1101'