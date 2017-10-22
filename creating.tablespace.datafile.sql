--show datafiles for specific tablespace v1
SELECT FILE_NAME, BLOCKS, TABLESPACE_NAME FROM DBA_DATA_FILES
  WHERE TABLESPACE_NAME LIKE 'BJ%';

--show datafiles for specific tablespace v2
SELECT file_name, tablespace_name, bytes/1024/1024/1024 "Used GB", maxbytes/1024/1024/1024 "Max GB", autoextensible, increment_by*8192/1024/1024 "inc_by MB" FROM DBA_DATA_FILES
WHERE TABLESPACE_NAME LIKE 'BJ_TBS01'

--create tablespace
CREATE TABLESPACE bj_tbs01
  DATAFILE '/u01/app/oradata/orcl/tesnabaza/bj_tbs01_f01.dbf' SIZE 1G
  AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;

--add datafile to tablespace
ALTER TABLESPACE bj_tbs01
  ADD DATAFILE '/u01/app/oradata/orcl/tesnabaza/bj_tbs01_f02.dbf' SIZE 1G
  AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED;

--change datafile size
ALTER DATABASE
  DATAFILE 'ime_datafajla.dbf'
  RESIZE 2G;

--sqlplu format za datafile
set linesize 240
column file_name format a50


SELECT * FROM DBA_DATA_FILES
WHERE TABLESPACE_NAME LIKE 'BJ_TBS01'
