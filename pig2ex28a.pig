data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = FOREACH data GENERATE (empno,ename, job,mgr,hiredate, sal, comm,deptno), SUBSTRING (hiredate, 5, 7) as month;
rec_fltr = filter all_recs by month == '01'  ;
/*rec_ordr = order rec_fltr by sal;*/
dump rec_fltr;
store rec_fltr into 'output/pig2ex28a';
