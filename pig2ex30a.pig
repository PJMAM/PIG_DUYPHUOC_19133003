data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:int, comm:float, deptno:int);
all_recs = foreach data generate empno,ename, job,mgr,hiredate, sal, comm,deptno,sal % 10 as s1,sal /1000 as s2;
rec_fltr = filter all_recs by ( s1 ==0 ) and (s2 > 0) and (s2 <9);
rec_fltr = foreach rec_fltr generate  empno,ename, job,mgr,hiredate, sal, comm,deptno;
dump rec_fltr;
store rec_fltr into 'output/pig2ex30a';

