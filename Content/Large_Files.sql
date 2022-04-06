SELECT /*xu.full_path*/ xu.full_path AS "FULL PATH", /* extracts the BB Course ID out of the FULL PATH*/ regexp_substr(xu.full_path, 'I\d{4}-\w{4}-\d{5}-\d{4}-\d\w{2}-\d{6}') AS "COURSE ID", /* extracts the BB Course Name*/ replace(regexp_substr(xu.full_path, '\w{4}-\d{5}'), '-', '') AS "COURSE NAME", /* extract and convert the year code into a recognised date*/ /*DECODE(REGEXP_SUBSTR(xu.full_path,'\d{4}',1,3), 1161,'2016',1151,'2015',1141,'2014',1131,'2013',1121,'2012',1111,'2011') AS "YEAR",*/ xu.file_name AS "FILENAME",
CASE /* Files larger than GigaByte in size */
   WHEN xf.file_size >= 1073741824
   		THEN concat(round(xf.file_size/1073741824, 2), ' GB') /* Files larger than MegaByte, but less than GigaByte in size */
   WHEN xf.file_size >= 1048576
   AND xf.file_size < 1073741824
   		THEN concat(round(xf.file_size/1048576, 2), ' MB') /* Files less than a MegaByte in size */
   ELSE concat(round(xf.file_size/1024, 2), ' KB')
END AS file_size
FROM bblearn_cms_doc.xyf_urls xu
JOIN bblearn_cms_doc.xyf_files xf ON xu.file_id = xf.file_id
JOIN bblearn_cms_doc.xyf_properties xp ON xp.property_owner_id like xu.file_id
INNER JOIN bblearn.course_main cm ON course_id like xu.full_path /* select the schools */
WHERE (xu.full_path like '%I3016%'
       OR xu.full_path like '%I3031%'
       OR xu.full_path like '%I3088%'
       OR xu.full_path like '%I3028%'
       OR xu.full_path like '%I3041%')-- Humanities
 /*where (Xu.full_path like '%I3022%' or Xu.full_path like '%I3021%' or Xu.full_path like '%I3023%' or Xu.full_path like '%I3025%' or Xu.full_path like '%I3027%' or Xu.full_path like '%I2000%' or Xu.full_path like '%I3035%' or Xu.full_path like '%I3034%' or Xu.full_path like '%I3033%' or Xu.full_path like '%I3039%') -- FSE

where (Xu.full_path like '%I3114%' or Xu.full_path like '%I3115%' or Xu.full_path like '%I3116%' or Xu.full_path like '%I2018%' or Xu.full_path like '%I3032%')*/ -- FBMH
 /* select the file types */
    AND (xu.full_path like '%.mov'
         OR xu.full_path like '%.qt'
         OR xu.full_path like '%.avi'
         OR xu.full_path like '%.mp4'
         OR xu.full_path like '%.m4v'
         OR xu.full_path like '%.mp2'
         OR xu.full_path like '%.mpeg'
         OR xu.full_path like '%.mpe'
         OR xu.full_path like '%.mpv'
         OR xu.full_path like '%.m2v'
         OR xu.full_path like '%.wmv'
         OR xu.full_path like '%.mkv'
         OR xu.full_path like '%.flv'
         OR xu.full_path like '%.f4v'
         OR xu.full_path like '%.rm'
         OR xu.full_path like '%.3gp'
         OR xu.full_path like '%.pdf')
GROUP BY xf.file_size,
         xu.full_path,
         xu.file_name
HAVING xf.file_size > 104857600 /* filesize in bytes -> 100MB */
ORDER BY xf.file_size DESC;