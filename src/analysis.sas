/* Fluoride Treatment Effects */
%require_input(fluoride.csv);
data fluoride;
  length inst $20 trt $8;
  infile "&project_root./data/fluoride.csv" dsd dlm=',' firstobs=2 truncover;
  input Num inst $ B A trt $;
  Y=A-B;
run;
proc freq data=fluoride; tables trt*inst / norow nocol nopercent; run;
proc sgplot data=fluoride; vbox Y / category=trt; run;
proc sgplot data=fluoride; vbox Y / category=inst; run;
proc sgplot data=fluoride;
  vline trt / response=Y stat=mean group=inst markers;
  title 'Treatment-by-institution interaction';
run;
/* GLM handles unequal cell counts; Type III tests are included in its output. */
proc glm data=fluoride;
  class trt inst; model Y=trt inst trt*inst;
  lsmeans trt*inst / slice=inst;
  output out=diagnostics r=residual p=predicted;
  title 'Full factorial model';
run; quit;
/* If interaction is not supported, interpret the additive model separately. */
proc glm data=fluoride;
  class trt inst; model Y=trt inst;
  lsmeans trt / pdiff=all adjust=tukey cl;
  means trt / hovtest=levene;
  title 'Additive treatment and institution model';
run; quit;
/* Retained comparator; does not replace the institution-adjusted model. */
proc glm data=fluoride;
  class trt; model Y=trt;
  means trt / tukey cldiff;
  title 'Treatment-only comparator';
run; quit;
proc univariate data=diagnostics normal; var residual; qqplot / normal(mu=est sigma=est); run;
proc sgplot data=diagnostics; scatter x=predicted y=residual; refline 0 / axis=y; run;
