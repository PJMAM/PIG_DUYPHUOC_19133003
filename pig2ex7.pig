data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_jobs = foreach data generate job;
uniq_jobs = distinct all_jobs;
ordr_job = order uniq_jobs by job desc; 
dump ordr_job;
store ordr_job into 'output/pig2ex7';