data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate,sal,comm,deptno;
ordr_empno = order all_recs by empno desc;
dump ordr_empno;
store ordr_empno into 'output/pig2ex3';