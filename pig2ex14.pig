data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, (int)GetYear(CurrentTime())-(int)SUBSTRING(hiredate,0,4) as expn ,sal,(int)(sal/30) as dailysal, comm,deptno;

recs_fltr = filter all_recs by (dailysal>100);

dump recs_fltr;
store recs_fltr into 'output/pig2ex14';