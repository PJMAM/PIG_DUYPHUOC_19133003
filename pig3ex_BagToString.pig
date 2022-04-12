emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
gg = GROUP emp by deptno;
ag = FOREACH gg GENERATE group, (float)AVG(emp.sal), BagToString(emp.(deptno, sal), ' |');
dump ag;
store ag into 'output/pig3ex_BagToString';
