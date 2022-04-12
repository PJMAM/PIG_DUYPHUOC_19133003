emp = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (empno:int, ename:chararray, job:chararray, mgr:int, hiredate:chararray, sal:float, comm:float, deptno:int);
dept = LOAD 'tbl_EMP.txt' USING PigStorage(',') as (deptno:int, dname:chararray, loc:chararray);
ee = FOREACH emp GENERATE empno, ename, job, mgr, sal, comm, deptno;
dd = FOREACH dept GENERATE deptno, dname, loc;

/* another way to do join, allows us to do left or right joins and checks */
cogrp1 = cogroup ee by (deptno), dd by (deptno);

/* filter out records from dept that are not in emp */
fltr_jn1 = filter cogrp1 by IsEmpty(ee) == true;
rslt = foreach fltr_jn1 generate flatten(dd);
dump rslt;
store rslt into 'output/pig3ex_ISEMPTY';