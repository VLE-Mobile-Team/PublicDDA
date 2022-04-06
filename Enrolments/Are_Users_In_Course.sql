select u.user_id, cu.role, cm.course_id, cm.service_level, cm.row_status, cm.available_ind, cm.dtcreated, cm.dtmodified, cm.course_name
from course_main cm
inner join course_users cu on cm.pk1 = cu.crsmain_pk1
inner join users u on u.pk1 = cu.users_pk1
where cm.course_id = 'I3115-MEDN-60030-1201-1YR-040366'  -- add Course ID
and student_id in ('9958726')
order by cm.dtmodified desc