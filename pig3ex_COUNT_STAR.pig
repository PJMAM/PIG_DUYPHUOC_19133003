emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
grp1 = FOREACH (GROUP emp by mgr) { GENERATE emp.mgr, (INT)COUNT_ALL(emp.mgr); };
grp1 = FOREACH (GROUP emp by mgr) { GENERATE emp.mgr, (INT)COUNT(emp.mgr); };
dump grp1;
store grp1 into 'output/pig3ex_COUNT_STAR';