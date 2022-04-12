data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, (int)GetYear(CurrentTime()) - (int)SUBSTRING(hiredate,0,4) as expn ,sal , comm,deptno;
fltr_mgrs = filter all_recs by job == 'MANAGER';
dump fltr_mgrs;
store fltr_mgrs into 'output/pig2ex10';