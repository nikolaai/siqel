CREATE TABLESPACE bj_tbs01
  DATAFILE '/u01/app/oradata/orcl/tesnabaza/bj_tbs01_f01.dbf' SIZE 1G
  AUTOEXTEND ON NEXT 100M MAXSIZE 3G

ALTER TABLESPACE bj_tbs01
  ADD DATAFILE '/u01/app/oradata/orcl/tesnabaza/bj_tbs01_f02.dbf' SIZE 1G
  AUTOEXTEND ON NEXT 100M MAXSIZE 3G


SELECT FILE_NAME, BLOCKS, TABLESPACE_NAME FROM DBA_DATA_FILES
  WHERE TABLESPACE_NAME LIKE 'BJ%'



34,359,721,984

increment by 32768kb = 32mb








--info.filesystem

/dev/vx/dsk/vaskodg/indx_01
                      300G   61G  225G  22% /db/vasko/indx_01 --znaci shiroko


format.data.file
set linesize 240
column file_name format a50

--info.data.files

SELECT * FROM DBA_DATA_FILES
WHERE TABLESPACE_NAME LIKE 'VASINDX'

SELECT file_name, tablespace_name, bytes/1024/1024 "Used Megabytes", maxbytes/1024/1024 "Max Megabytes" FROM DBA_DATA_FILES
WHERE TABLESPACE_NAME LIKE 'VASINDX'

SELECT file_name, tablespace_name, bytes/1024/1024/1024 "Used GB", maxbytes/1024/1024/1024 "Max GB", autoextensible, increment_by/1024 "inc_by" FROM DBA_DATA_FILES
WHERE TABLESPACE_NAME LIKE 'VASINDX'
--info data files

FILE_NAME                      FILE_ID TABLESPACE_NAME   BYTES  BLOCKS STATUS    RELATIVE_FNO AUT MAXBYTES MAXBLOCKS INCREMENT_BY USER_BYTES USER_BLOCKS ONLINE_
------------------------------ ------- --------------- ------- ------- --------- ------------ --- -------- --------- ------------ ---------- ----------- -------
/db/vasko/indx_01/index_01.dbf      18 VASINDX         3.4E+10 4194302 AVAILABLE           18 YES  3.4E+10   4194302        32768    3.4E+10     4194168 ONLINE 
/db/vasko/indx_01/index_02.dbf      21 VASINDX         3.0E+10 3693056 AVAILABLE           21 YES  3.4E+10   4194302        32768    3.0E+10     3692928 ONLINE 

-- resenje po aminovanju
ALTER TABLESPACE VASINDX
ADD DATAFILE '/db/vasko/indx_01/index_03.dbf' SIZE 1G
AUTOEXTEND ON NEXT 32M MAXSIZE UNLIMITED;
