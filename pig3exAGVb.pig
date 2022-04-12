emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
avggrp1 = FOREACH (GROUP emp by deptno) {
unqdept = DISTINCT emp.deptno;
                 GENERATE FLATTEN(unqdept), (int)SUM(emp.sal), (int)AVG(emp.sal);
};
dump ag;
store ag into 'output/pig3ex_AGV_b';