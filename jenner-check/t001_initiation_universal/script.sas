/* Exercises initiation_universal() from macro_multitraj_v1.sas (lines
   85-89), the array-declaration macro used at the top of plot_prep()
   to set up the trajectory arrays X[], Y1[], Y2[] over T time points.
   Mock data below matches the variable-naming convention plot_prep()
   expects from base_file_srs / data_pred: quar1-quarT (time markers),
   Q1HH-Q12HH (trajectory 1, "HH"), QINP1-QINPT (trajectory 2, "INP"),
   per the macro's own hardcoded array names for T=12. */

%macro initiation_universal(T);
%str(ARRAY) X[&T.] quar1-quar&T.%str(;)
%str(ARRAY) Y1[&T.] Q1HH Q2HH Q3HH Q4HH Q5HH Q6HH Q7HH Q8HH Q9HH Q10HH Q11HH Q12HH%str(;)
%str(ARRAY) Y2[&T.] QINP1-QINP&T.%str(;)
%mend initiation_universal;

data base_file_srs;
  input id
        quar1-quar12
        Q1HH Q2HH Q3HH Q4HH Q5HH Q6HH Q7HH Q8HH Q9HH Q10HH Q11HH Q12HH
        QINP1-QINP12;
  datalines;
1 1 2 3 4 5 6 7 8 9 10 11 12   10 12 14 16 18 20 22 24 26 28 30 32   5 6 7 8 9 10 11 12 13 14 15 16
2 1 2 3 4 5 6 7 8 9 10 11 12   11 13 15 17 19 21 23 25 27 29 31 33   4 5 6 7 8 9 10 11 12 13 14 15
3 1 2 3 4 5 6 7 8 9 10 11 12    9 11 13 15 17 19 21 23 25 27 29 31   6 7 8 9 10 11 12 13 14 15 16 17
;
run;

data check_arrays;
  set base_file_srs;
  %initiation_universal(T=12);
  sum_x = 0; sum_y1 = 0; sum_y2 = 0;
  do i = 1 to 12;
    sum_x = sum_x + X[i];
    sum_y1 = sum_y1 + Y1[i];
    sum_y2 = sum_y2 + Y2[i];
  end;
  keep id sum_x sum_y1 sum_y2;
run;

proc print data=check_arrays noobs;
run;
