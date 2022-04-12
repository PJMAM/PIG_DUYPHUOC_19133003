data = LOAD 'tbl_EMP.txt' using PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = FOREACH data GENERATE empno,ename,job,mgr,hiredate, sal,(comm is not null ? comm:0), deptno;
rnk_all_recs = FOREACH all_recs GENERATE (CASE empno % 2 WHEN 0 THEN 0 WHEN 1 THEN 1 END ) as odd_even,empno,ename,job,mgr,hiredate, sal, comm, deptno;
all_recs_fltr_even = FILTER rnk_all_recs by (odd_even == 0);
DUMP all_recs_fltr_even;
store all_recs_fltr_even into 'output/pig2ex24b';