data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_jobs = foreach data generate job;
uniq_jobs = distinct all_jobs;
dump uniq_jobs;
store uniq_jobs into 'output/pig2ex2';