emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
ee = FOREACH emp GENERATE CONCAT((chararray)empno,'|',ename,'~', job,'~',(chararray)mgr,'|',(chararray)deptno) as big_col;
dump ee;
store ee into 'output/pig3ex_CONCAT_a';