select count (cm.course_id)
from course_main cm
inner join course_users cu on cm.pk1 = cu.crsmain_pk1
inner join users u on u.pk1 = cu.users_pk1
where u.user_id = '' -- Add User ID
and cm.service_level = 'C' -- C is for Organisation and F is for Course