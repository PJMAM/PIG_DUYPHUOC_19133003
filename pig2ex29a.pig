data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename, job,mgr,hiredate, sal, comm,deptno;
rec_fltr = filter all_recs by  INDEXOF(ename,'A', 0) == 1;
a = foreach rec_fltr generate (empno,ename, job,mgr,hiredate, sal, comm,deptno),SUBSTRING (hiredate, 5, 7) as month; 
rec_ordr = group a by month;
dump rec_ordr;
store rec_ordr into 'output/pig2ex29a';