data = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
all_recs = foreach data generate empno,ename,job,mgr,hiredate,(int)GetYear(ToDate(hiredate, 'yyyy-M-dd')) as yrs, sal, comm,deptno;
rec_fltr = filter all_recs by (yrs < 1981 OR yrs > 1981) ;
rec_ordr = order rec_fltr by yrs;
dump rec_ordr;
store rec_ordr into 'output/pig2ex34';