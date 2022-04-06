select cm.course_id, cm.course_name, cm.dtcreated, cm.dtmodified 
from course_main cm join
     course_users cu
     on cm.pk1 = cu.crsmain_pk1 join
     users u
     on u.pk1 = cu.users_pk1
where u.user_id in ('',) -- enter all userid separated by a comma
and role = 'P' and
      cm.service_level = 'F' -- 'F' denotes full course
group by cm.course_id, cm.course_name, cm.dtcreated, cm.dtmodified -- you may need to add more fields depending on what is in the select
having count(*) = 10;