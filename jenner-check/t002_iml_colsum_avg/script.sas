/* Exercises the PROC IML posterior-weighted-average block from
   plot_prep() in macro_multitraj_v1.sas (lines 294-309): a colsum()
   helper plus matrix multiply to compute, for each time point, the
   observed trajectory average weighted by posterior class-membership
   probability. Mock data below stands in for base_file_srs (their
   trajectory input) and pred_membership_y (the posterior-membership
   matrix that, in the full pipeline, comes out of nlmixed_1() /
   Posterior() -- 3 subjects x 2 latent classes, rows summing to 1). */

data base_file_srs;
  input id Q1HH Q2HH Q3HH Q4HH Q5HH Q6HH Q7HH Q8HH Q9HH Q10HH Q11HH Q12HH;
  datalines;
1 10 12 14 16 18 20 22 24 26 28 30 32
2 11 13 15 17 19 21 23 25 27 29 31 33
3  9 11 13 15 17 19 21 23 25 27 29 31
;
run;

data pred_membership_y;
  input class1 class2;
  datalines;
0.8 0.2
0.3 0.7
0.6 0.4
;
run;

data y_1;
set base_file_srs (keep= Q1HH Q2HH Q3HH Q4HH Q5HH Q6HH Q7HH Q8HH Q9HH Q10HH Q11HH Q12HH);
run;

proc iml;
Start colsum(m);
return (m[+,]);
finish;
use y_1; read all var _num_ into y;
use pred_membership_y; read all var _num_ into pred_membership_y;
sum=colsum(pred_membership_y);print sum;
invsum=1/sum; print invsum;
avg_y=y`*pred_membership_y;print avg_y;
avg_y_2=avg_y#invsum; print avg_y_2;
create avg_y1 from avg_y_2;
append from avg_y_2;
close avg_y_2;
quit;

proc print data=avg_y1 noobs;
run;
