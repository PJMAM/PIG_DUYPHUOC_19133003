data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate,sal,comm,deptno;
ordr_empdeptjob = order all_recs by deptno asc, job desc;
dump ordr_empdeptjob;
store ordr_empdeptjob into 'output/pig2ex5'