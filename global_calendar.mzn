%for divmod
int: monday     = 1;    
int: tuesday    = 2;
int: wednesday  = 3;
int: thursday   = 4;
int: friday     = 5; 
int: saturday   = 6;  
int: sunday     = 0;  

set of int: mondays    = {d | d in days where d mod 7 = monday};
set of int: tuesdays   = {d | d in days where d mod 7 = tuesday};
set of int: wednesdays = {d | d in days where d mod 7 = wednesday};
set of int: thursdays  = {d | d in days where d mod 7 = thursday};
set of int: fridays    = {d | d in days where d mod 7 = friday};
set of int: saturdays  = {d | d in days where d mod 7 = saturday};
set of int: sundays    = {d | d in days where d mod 7 = sunday};



int: w1  = 1;
int: w2  = 2;
int: w3  = 3;
int: w4  = 4;
int: w5  = 5;
int: w6  = 6;
int: w7  = 7;
int: w8  = 8;
int: w9  = 9;
int: w10 = 10;

%% so mondays[w2]  is the monday of week2 and thursdays[w9] is the thursday of week9....
array[int] of set of int: weeks;

weeks= [wk1,wk2,wk3,wk4,wk5,wk6,wk7,wk8,wk9,wk10];
set of int: week1 = weeks[1];
set of int: week2 = weeks[2];
set of int: week3 = weeks[3];
set of int: week4 = weeks[4];
set of int: week5 = weeks[5];
set of int: week6 = weeks[6];
set of int: week7 = weeks[7];
set of int: week8 = weeks[8];
set of int: week9 = weeks[9];
set of int: week10= weeks[10];

array[int] of set of int: fortnights;

fortnights = [fn1,fn2,fn3,fn4,fn5];



int: week2_prior  = 1;
int: week3_prior  = 2;
int: week4_prior  = 3;
int: week5_prior  = 4;
int: week6_prior  = 5;
int: week7_prior  = 6;
int: week8_prior  = 7;
int: week9_prior  = 8;
int: week10_prior = 9;


int: wk1_mon  =  1;   int: wk1_tue  =  2;    set of int: wk1  =  1..7;   set of int: wd1  = 1..5;      set of int: fn1 = 1..14;
int: wk2_mon  =  8;   int: wk2_tue  =  9;    set of int: wk2  =  8..14;  set of int: wd2  = 8..12;  
int: wk3_mon  = 15;   int: wk3_tue  =  16;   set of int: wk3  = 15..21;  set of int: wd3  = 15..19;    set of int: fn2 = 15..28;
int: wk4_mon  = 22;   int: wk4_tue  =  23;   set of int: wk4  = 22..28;  set of int: wd4  = 22..26;  
int: wk5_mon  = 29;   int: wk5_tue  =  30;   set of int: wk5  = 29..35;  set of int: wd5  = 29..33;    set of int: fn3 = 29..42;
int: wk6_mon  = 36;   int: wk6_tue  =  37;   set of int: wk6  = 36..42;  set of int: wd6  = 36..40;  
int: wk7_mon  = 43;   int: wk7_tue  =  44;   set of int: wk7  = 43..49;  set of int: wd7  = 43..47;    set of int: fn4 = 43..56;
int: wk8_mon  = 50;   int: wk8_tue  =  51;   set of int: wk8  = 50..56;  set of int: wd8  = 50..54;  
int: wk9_mon  = 57;   int: wk9_tue  =  58;   set of int: wk9  = 57..63;  set of int: wd9  = 57..61;    set of int: fn5 = 57..70;
int: wk10_mon = 64;   int: wk10_tue  = 65;   set of int: wk10 = 64..70;  set of int: wd10 = 64..68;  

array[int] of set of int: weekday_weeks;

weekday_weeks=[wd1,wd2,wd3,wd4,wd5,wd6,wd7,wd8,wd9,wd10];


predicate force_mon(docs:doc, shifts:shift) =
            forall (day in 8..DAYS where day mod 7 = monday) (if roster[doc,day] != l /\ off_shift(doc,day-1) then roster[doc,day]=shift else true endif);



predicate on_shift  (docs: doc, int:day)=
          
                    (roster[doc,day] = a \/ roster[doc,day] = p \/ roster[doc,day]=c) ;        

predicate off_shift  (docs: doc, int:day)=
              
                    (roster[doc,day] = o);        

predicate request_off  (docs: doc, int: day) =
          
                      (roster[doc,day]=o);

predicate not_avail (docs: doc, int: day, shifts: shift) =  %%%this is FUNCTION OVERLOADING
          
                    roster[doc,day] != shift;        

predicate not_avail(docs: doc, int:day) =

                    roster[doc,day]=o;             

predicate request_cs(docs: doc, int: day) =-
          
                     roster[doc,day] = c;

predicate no_consec_friday_pms(docs: doc) = 
          forall(d in 1..DAYS-7   where d in fridays) 
             (roster[doc,d] = p -> roster[doc,d+7] !=p) ;

predicate no_consec_saturdays(docs: doc) =
  forall(d in 1..DAYS-7 where d mod 7 = saturday) 
      (on_shift(doc,d) -> off_shift(doc,d+7));

predicate no_consec_sundays(docs: doc) =
  forall(d in 1..DAYS-7 where d mod 7 = sunday)  
      (on_shift(doc,d) -> off_shift(doc,d+7));
                                     
predicate no_consec_sat_and_or_sun(docs: doc) =
  
     forall(d in 1..DAYS-8 where d mod 7 = saturday)  
        ( (on_shift(doc,d) -> off_shift(doc,d+8)) /\  % no next sunday   after this saturday 
          on_shift(doc,d+1)-> off_shift(doc,d+7));     % no next saturday after this sunday

predicate no_consec_weekends(docs: doc) =
             no_consec_saturdays(doc) /\ no_consec_sundays(doc) /\ no_consec_sat_and_or_sun(doc);

predicate no_third_sunday(docs: doc) = 
      forall(d in 1..DAYS-14 where d mod 7 = sunday)  
        (on_shift(doc,d) -> off_shift(doc,d+14));

predicate no_third_saturday(docs: doc) = 
  forall(d in 1..DAYS-14 where d mod 7 = saturday) 
      (on_shift(doc,d) -> off_shift(doc,d+14));

predicate no_third_weekend(docs: doc) =
          no_third_saturday(doc) /\ no_third_sunday(doc);             
                       
predicate no_mon_after_sun (docs: doc) =
  forall(d in 1..DAYS-1 where d mod 7 = sunday) 
         (if on_shift(doc,d) then off_shift(doc,d+1) else true endif); 

predicate no_mon_and_no_tue_after_sun (docs: doc) =
  forall(d in 1..DAYS-7 where d mod 7 = sunday) 
         (if on_shift(doc,d) then (off_shift(doc,d+1) /\ off_shift(doc,d+2)) else true endif); 
         
                           
%        (on_shift(doc,d) -> off_shift(doc,d+1));

predicate no_fri_before_sat(docs: doc) =
   forall(d in 1..DAYS where d mod 7 = saturday)
         (if on_shift(doc,d) then off_shift(doc,d-1) else true endif);
predicate no_fri_before_weekend(docs: doc) =
   forall(d in 1..DAYS where d mod 7 = saturday)
         (if on_shift(doc,d) then off_shift(doc,d-1) else true endif);
   

predicate isolate_weekend(docs:doc) = 
      no_mon_after_sun(doc) /\ no_fri_before_sat(doc);

      
predicate no_am_after_pm(docs:doc) =
   forall(day in 1..DAYS-1) (if roster[doc,day]=p then roster[doc,day+1] != a else true endif);

predicate two_c_per_week(docs:doc) =
    forall(week in weekday_weeks) ( if count(roster[doc,week],l,0) then 
               count(roster[doc,week],c,2)
                else true endif);

predicate no_fri_pm_before_weekend(docs:doc) = 
   forall (day in fridays) (if roster[doc,day+1]= p then roster[doc,day] != p else true endif);
                                   
predicate weekday_shift_count(docs:doc, shifts:shift,int:count) =
      forall (week in weekday_weeks)
          (if count(roster[doc,week],l,0) then count(roster[doc,week],shift,count) else true endif);

predicate weekday_shift_count(docs:doc, shifts:shift, int:count1, int:count2) =
      forall (week in weekday_weeks)
          (if count(roster[doc,week],l,0) then global_cardinality_low_up(roster[doc,week],[shift],[count1],[count2])  else true endif);                                                                              
                          
            
                        

%       (on_shift(doc,d) -> off_shift(doc,d-1));

%predicate no_split_weekend  (docs:doc) = 
%                            forall (day in saturdays) (on_shift(doc,day) -> on_shift(doc,day+1));


predicate no_split_weekend  (docs:doc) = 
                             forall (day in saturdays) (roster[doc,day]=roster[doc,day+1]); %% so weekends are o o \/ a a \/ p p



%%%%%SHIFTS PER WEEK
%constraint forall (w in 1..WEEKS) (count(roster[SD,weeks[w]],c,1) \/ count(roster[SD,weeks[w]],l,4));


 
%%PAY_FORTNIGHT
predicate shifts_per_fortnight (docs: doc,int: num ) =     %%THIS IS PAY FORTNIGHT
        (count(roster[doc, 1..14], o, 14-num) /\
        count( roster[doc,15..28], o, 14-num) /\
%       count( roster[doc,29..42], o, 14-num) /\
        global_cardinality(roster[doc,29..42], [o], [14-num]) /\
        global_cardinality(roster[doc,43..56], [o], [14-num])  /\
        count( roster[doc,57..70],o, 14-num));
        

predicate shifts_per_week(docs: doc, int: num) =
          (count(roster[doc,  1..7],o, 7 - num) /\
           count(roster[doc, 8..14],o, 7 - num) /\
           count(roster[doc,15..21],o, 7 - num) /\
           count(roster[doc,22..28],o, 7 - num) /\
           count(roster[doc,29..35],o, 7 - num) /\
           count(roster[doc,36..42],o, 7 - num) /\
           count(roster[doc,43..49],o, 7 - num) /\
           count(roster[doc,50..56],o, 7 - num) /\
           count(roster[doc,57..63],o, 7 - num) /\
           count(roster[doc,64..70],o, 7 - num));
           
           
%%GLOBALS

           
predicate global_shift_type_per_week(docs:doc, shifts: shift,int:num ,int: doc_leave_days) =

           forall (w in weeks) %(count(roster[doc,w],shift,num) \/ count(roster[doc,w],l,doc_leave_days));

                               (global_cardinality_low_up(roster[doc,w],[shift,l],[0,0],[num,doc_leave_days]));


%%eg --            constraint shift_type_per_week(SD,c,1,sd_shifts);


%%BOTH THESE ARE THE SAME

%predicate weekday_shifts(docs:doc,shifts:shift,int:num, int:leave_shifts) =
%
%                         forall  (w in weekday_weeks) (global_cardinality_low_up(roster[doc,w],[shift,l],[0,0],[num,leave_shifts])); 
                        
predicate weekday_shifts(docs: doc, shifts:shift, int:num ,int: doc_leave_days) =

                          forall (w in weekday_weeks) (count(roster[doc,w],shift,num) \/ count(roster[doc,w],l,doc_leave_days));



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

              

