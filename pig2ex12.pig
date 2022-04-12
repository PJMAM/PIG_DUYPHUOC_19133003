data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, sal, comm,deptno;
fltr_recs = filter all_recs by (comm>sal);
dump fltr_recs;
store fltr_recs into 'output/pig2ex12';