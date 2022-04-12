data = LOAD 'store_transactions.txt' using PigStorage(',') as (person:chararray, dstores:chararray, spent:float);
grp = FOREACH (GROUP data BY person) {
 GENERATE group, COUNT(data.person) AS visitors, (FLOAT)SUM(data.spent) AS revenue; -- dereference is required to original structure columns 
};
dump grp;
store grp into 'output/pig2ex22b';