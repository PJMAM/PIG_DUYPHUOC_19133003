emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
/* Foreach works on inner group operator */
mm = FOREACH (GROUP emp by deptno) GENERATE MIN(emp.sal), MAX(emp.sal); 
dump mm;
store mm into 'output/pig3ex_MIN_MAX';