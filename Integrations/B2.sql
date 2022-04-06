select distinct cm.course_id, cm.course_name,
case
	when cm.service_level = 'F'
		then 'COURSE'
	when cm.service_level = 'C'
		then 'ORGANISATION'
end as "COURSE TYPE"
,pl.vendor_name || ' - ' || pl.name as vendor_b2
from course_main cm
inner join course_content_handlers cch on cch.crsmain_pk1 = cm.pk1
inner join content_handlers ch on cch.content_handlers_pk1 = ch.pk1
inner join course_contents cc on cc.crsmain_pk1 = cm.pk1
right outer join plugins pl on ch.plugins_pk1 = pl.pk1
where /*SUBSTRING(cm.course_id,1,1) = 'I'
			AND
		(SUBSTRING(cm.course_id,18,4)) LIKE ('120_')*/
cm.course_id in ('I3132-MACE-70074-1191-1YR-038642','I3016-AMBS-66861-1202-06M-036706','I3088-FREN-51050-1201-1YR-004823')
and pl.vendor_id not ilike 'bb'
group by cm.course_id, cm.course_name, cm.service_level, pl.pk1, ch.plugins_pk1,pl.vendor_name, pl.name, cc.cnthndlr_handle
order by cm.course_id