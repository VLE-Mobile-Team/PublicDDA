select count(distinct(user_pk1))
from activity_accumulator aa
join course_users cu on
aa.user_pk1 = cu.users_pk1
--where cu.role = 'P'
WHERE timestamp > '30-SEP-2018'
and timestamp < '01-OCT-2019'
and aa.data like '%Mobile Login%';