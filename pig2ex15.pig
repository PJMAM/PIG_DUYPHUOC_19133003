data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, sal, comm,deptno;

rec_fltr = filter all_recs by (job=='CLERK') or (job=='ANALYST');

rec_ordr = order rec_fltr by empno desc;

dump rec_ordr;
store rec_ordr into 'output/pig2ex15';
