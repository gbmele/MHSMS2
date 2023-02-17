
predicate leave_day(docs: doc, int: day) =
          roster[doc,day]==l;

predicate leave_week(docs:doc, set of int: week, int: leave_days) =         
              count(roster[doc,week],l,leave_days);
              
predicate leave_weeks(docs: doc, array[int] of set of int: weeks, int: leave_days) =
              forall (w in weeks) (leave_week(doc,w,leave_days)) /\
              count(roster[doc,..],l,leave_days * length(weeks));              
              
%%added nov 30 2022 == leave_weeks2(GM,[1,2],gm_shifts)

predicate leave_weeks2(docs: doc, array[int] of int: wknums, int: leave_days) =
              forall (w in wknums) (leave_week(doc,weeks[w],leave_days)) /\
              count(roster[doc,..],l,leave_days * length(wknums));              
                                          
              
              
predicate leave_weeks(docs: doc, array[int] of set of int: weeks, int: leave_days, int: single_days) =
              forall (w in weeks) (leave_week(doc,w,leave_days)) /\
              count(roster[doc,..],l,single_days + leave_days * length(weeks));              

predicate sat_sun_off_prior(docs: doc, array[int] of int: wk) =
            forall (w in wk) ((  roster[doc,sundays[w]]=o) /\ (roster[doc,saturdays[w]]=o));

              
              
