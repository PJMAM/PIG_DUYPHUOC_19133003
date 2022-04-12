
emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
/*Made a copy of emp dataset */
emp2 = FOREACH emp GENERATE *;
/* made 2 sets with different manager for testing DIFF function*/
ee1 = FOREACH (FILTER emp by mgr == 7839) GENERATE empno, ename, job, mgr, sal, comm, deptno;
ff1 = FOREACH (FILTER emp2 by mgr == 7698) GENERATE empno, ename, job, mgr, sal, comm, deptno;
/* converting columns from different datasets into bag as Diff function works on bag*/
enm1 = FOREACH (COGROUP ee1 by (empno), ff1 by (empno)) GENERATE TOBAG(ee1.empno, ee1.empno), TOBAG(ff1.empno, ff1.mgr);
dump enm1;
enm1 = FOREACH (COGROUP ee1 by (empno), ff1 by (empno)) GENERATE DIFF(TOBAG(ee1.empno, ee1.empno), TOBAG(ff1.empno, ff1.mgr));
dump enm1;
store enm1 into 'output/pig3ex_DIFF';