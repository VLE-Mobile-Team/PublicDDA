SELECT  
    f.file_id, (string_to_array(full_path, '/'))[3] as subdir, url.file_name, f.mime_type, f.last_update_date,
	CASE /* Files larger than GigaByte in size */
   		WHEN f.file_size >= 1073741824
   			THEN concat(round(f.file_size/1073741824, 2), ' GB') /* Files larger than MegaByte, but less than GigaByte in size */
   		WHEN f.file_size >= 1048576 AND f.file_size < 1073741824
   			THEN concat(round(f.file_size/1048576, 2), ' MB') /* Files less than a MegaByte in size */
   		ELSE concat(round(f.file_size/1024, 2), ' KB')
	END AS file_size,
    url.full_path
FROM xyf_files f
JOIN xyf_urls url on url.file_id = f.file_id
WHERE file_type_code = 'F' and url.full_path not like '/internal/%'
AND (url.full_path like '%-120_-%')
--AND (url.full_path like '%I3016%' OR url.full_path like '%I3031%' OR url.full_path like '%I3088%' OR url.full_path like '%I3028%' OR url.full_path like '%I3041%') -- Humanities
--AND (url.full_path like '%I3022%' or url.full_path like '%I3021%' or url.full_path like '%I3023%' or url.full_path like '%I3025%' or url.full_path like '%I3027%' or url.full_path like '%I2000%' or url.full_path like '%I3035%' or url.full_path like '%I3034%' or url.full_path like '%I3033%' or url.full_path like '%I3039%') -- FSE
AND (url.full_path like '%I3114%' or url.full_path like '%I3115%' or url.full_path like '%I3116%' or url.full_path like '%I2018%' or url.full_path like '%I3032%') -- FBMH
 /* select the file types */
AND (url.full_path like '%.mov' OR url.full_path like '%.qt' OR url.full_path like '%.avi' OR url.full_path like '%.mp4' OR url.full_path like '%.m4v' OR url.full_path like '%.mp2'
         OR url.full_path like '%.mpeg' OR url.full_path like '%.mpe' OR url.full_path like '%.mpv' OR url.full_path like '%.m2v' OR url.full_path like '%.wmv'
         OR url.full_path like '%.mkv' OR url.full_path like '%.flv' OR url.full_path like '%.f4v' OR url.full_path like '%.rm' OR url.full_path like '%.3gp' OR url.full_path like '%.pdf')
AND f.file_size > 104857600
ORDER BY f.file_size desc;