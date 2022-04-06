SELECT SUBSTRING(cm.course_id for 5) AS schCode,
--substr(cm.course_id,SUBSTRING(cm.course_id,'-',1,3) + 1,4) AS strm,
cm.course_id,
cc.Title,
cc.pk1
FROM course_main cm
INNER JOIN course_contents cc ON cm.pk1=cc.CRSMAIN_PK1
WHERE (LOWER(cc.WEB_URL_host)) like '%elearning@manchester.ac.uk%' OR LOWER(cc.MAIN_DATA) like '%elearning@manchester.ac.uk%'
AND cm.SERVICE_LEVEL = 'F'
AND (SUBSTRING(cm.course_id,18,4)) like ('120_')
--AND cm.course_id NOT LIKE '%-SANDPIT-%'
--AND cm.course_id NOT LIKE '%-COURSE-%'
--AND (cm.course_id LIKE 'I3016%' or cm.course_id LIKE 'I3028%' OR cm.course_id LIKE 'I3041%' OR cm.course_id LIKE 'I3083%')