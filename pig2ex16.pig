data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate, (int)GetYear(CurrentTime())-(int)SUBSTRING(hiredate,0,4) as expn ,sal,(int)(sal/30) as dailysal, comm,deptno;
rec_fltr = filter all_recs by (hiredate=='1981-05-01') or (hiredate=='1981-12-31') or (hiredate=='1981-12-17') or (hiredate=='1980-01-19');
rec_ordr = order rec_fltr by expn desc;
dump rec_ordr;
store rec_ordr into 'output/pig2ex16';