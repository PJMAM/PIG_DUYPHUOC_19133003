data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, sal, comm,deptno;
recs_ordr = order all_recs by job asc;
dump recs_ordr;
store recs_ordr into 'output/pig2ex13';