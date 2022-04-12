data = LOAD 'store_transactions.txt' using PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = FOREACH data GENERATE empno,ename,job,mgr,hiredate, sal,(comm is not null ? comm:0 ), deptno;
dump all_recs;
store all_recs into 'output/pig2ex23';