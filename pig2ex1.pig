data = LOAD 'hdfs://duyphuoc-master:54310/Pig_Data/tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
dump data;
store data into 'output/pig2ex1';