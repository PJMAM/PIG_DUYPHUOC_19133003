data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);

all_recs = foreach data generate empno,ename,job,mgr,hiredate,sal,comm,deptno;
ordr_empsal = order all_recs by sal desc;
dump ordr_empsal;
store ordr_empsal into 'output/pig2ex4'