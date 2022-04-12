data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, SUBSTRING(hiredate,0,4) as hryear, sal,comm,deptno;

rec_fltr = filter all_recs by (hryear=='1981');

dump rec_fltr;

store rec_fltr into 'output/pig2ex18';