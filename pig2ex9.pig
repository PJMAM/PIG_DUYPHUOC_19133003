data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate,sal ,(int)(sal/30) as dailysal, (int)(sal*12) as annsal, comm,deptno;
ordr_recs = order all_recs by annsal;
dump ordr_recs;
store ordr_recs into 'output/pig2ex9';