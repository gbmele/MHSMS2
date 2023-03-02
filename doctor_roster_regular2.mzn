%%BLOODY WOMEN

%constraint forall (d in 1..DAYS)
%  (if roster[AV,d] = a then roster[HL,d] != a else true endif);
%constraint forall (d in 1..DAYS)
%  (if roster[AV,d] = p then roster[HL,d] != p else true endif);



var int: min_mon_am;
var int: min_tue_am;
var int: min_wed_am;
var int: min_thu_am;
var int: min_fri_am;
var int: sue_tue_am;
var int: AR_IC_am;
var int: db_ssu;
array[1..DAYS] of var 0..1: HL_AV;

var int: erin_wed_am_count;

var int: tue_pm;
var int: lewis_thu_pm;


constraint forall( d in 1..DAYS)
        %(if (roster[AV,d] = roster[HL,d]) /\ roster[AV,d] in {a,p} then HL_AV[d]= 1 else HL_AV[d] = 0 endif);
        
        (HL_AV[d]=bool2int( roster[HL,d] = roster[AV,d] /\ roster[HL,d] in {a,p}));
        
constraint forall(d in days where d mod 7 in {saturday,sunday}) (if on_shift(HL,d) then off_shift(AV,d) else true endif);        

constraint forall(day in days)
                  (if roster[HL,day] =a /\ roster[AV,day] = a then (ssu[HL,day]=1 \/ ssu[AV,day]=1) else true endif);    
                      
%constraint forall(day in days)(if roster[HL,day] = p then roster[AV,day]!=p else true endif);

constraint forall(day in days)(roster[HL,day] = p -> roster[AV,day] != p);
constraint forall(day in days)(roster[AV,day] = p -> roster[HL,day] != p);
                                                


constraint sue_tue_am=count([roster[SD,d] |d in days where d mod 7 = tuesday],a);

constraint lewis_thu_pm = count([roster[LC,d] | d in thursdays],p);
constraint erin_wed_am_count = count([roster[EW,d] | d in wednesdays],a);

constraint AR_IC_am = count(incharge[AR,..],1);

constraint min_mon_am = sum (doc in docs)     (sum(day in days where day mod 7 =  monday)       ( roster[ doc ,day ] = a));
constraint min_tue_am = sum (doc in doccount) (sum (day in days where day mod 7 = tuesday)   ( roster[ doc ,day ] = a));
constraint min_wed_am = sum (doc in doccount) (sum (day in days where day mod 7 = wednesday) ( roster[ doc ,day ] = a));
constraint min_thu_am = sum (doc in docs)     (sum (day in days where day mod 7 = thursday)  ( roster[ doc ,day ] = a));
constraint min_fri_am = sum (doc in doccount) (sum (day in days where day mod 7 = friday )   ( roster[ doc ,day ] = a));

constraint tue_pm = sum (doc in doccount) (sum (day in tuesdays)   ( roster[ doc ,day ] = p));

constraint db_ssu = count(ssu[DB,..],1);
                                       
solve minimize abs(54 -min_fri_am) + abs(55-min_tue_am) + abs(15-sue_tue_am) + abs(55 - min_thu_am)+ (min_mon_am - 40)+ abs(52 - min_wed_am) + abs(4 -tue_pm) + db_ssu + (lewis_thu_pm - 5) + erin_wed_am_count;



include "globals.mzn";                            % regular
include "doctor_roster_regular2.dzn"; 
include "global_calendar.mzn";                    %mine
include "doctor_roster_regular2_ssu_oncall.mzn";  %mine %% AND IN+_CHARGE


%include "doctor_roster_regular2_baseWORKING.mzn";
include  "doctor_roster_regular2_baseFEB23.mzn"; 
include "roster_on_output.mzn";
  
enum shifts;

enum docs = {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,KM,DZ,BB,JD,CK,NM};


%day 1 is a Monday

set of int: days; 
int:        DAYS;
int:        WEEKS;
int:        wk;

array[docs,days] of var shifts: roster;

%STAFF COUNT DAY SHIFT
constraint forall(d in mondays   )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 3, 3   ],   [  5 , 5     ]  )); %mon
constraint forall(d in tuesdays  )    (global_cardinality_low_up([roster[doc,d] | doc in doccount], [ a , p ],   [ 3, 3   ],   [  6 , 8    ]  )); %tue
constraint forall(d in wednesdays)    (global_cardinality_low_up([roster[doc,d] | doc in doccount], [ a , p ],   [ 3, 2   ],   [  8 , 10    ]  )); %wed
constraint forall(d in thursdays )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 3, 2   ],   [  7 , 10    ]  )); %thu
constraint forall(d in fridays   )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 3, 2   ],   [  6 , 4     ]  )); %fri
constraint forall(d in saturdays )    (global_cardinality_low_up(roster[..,d],                      [ a , p ],   [ 2, 2   ],   [  5 , 7     ]  )); %sat 
constraint forall(d in sundays   )    (global_cardinality_low_up([roster[doc,d]| doc in doccount],  [ a , p ],   [ 2, 2   ],   [  5 ,4     ]  )); %sun


%helpers = COUNT === GLOBAL_CARDINALITY
predicate assign_shifts(docs: doc, int: dayname, shifts: shift, int: num) =

          count([roster[doc,d] | d in days where d mod 7 = dayname] ,shift,num);     


predicate assign_shifts(docs: doc, int: dayname, shifts: shift, int: low, int: up) =
          
         global_cardinality_low_up([roster[doc,d] | d in days where d mod 7 = dayname],[shift],[low],[up]);

      
predicate DOC_TABLE(docs:doc,array[int,int]of shifts:doctable) =
          forall (w in weeks)(table([roster[doc,day] | day in w],doctable));
      
predicate DOC_FN_TABLE(docs:doc,array[int,int]of shifts:doctable) =
          forall (fn in fortnights)(table([roster[doc,day] | day in fn],doctable));
                               
 
predicate reg_string(docs: doc , string:rstring) = 
          regular(roster[doc,..],rstring);

          

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%STAFF RULES                                            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





constraint regular(roster[RG,..], "( (c c c (p|c) o o o)* (c c c o o a o)*   (l l l l o o o )*  )*");

constraint assign_shifts(RG,saturday,a,rg_sat);

constraint forall (d in thursdays) (roster[RG,d]=  c <-> roster[GM,d-2]=l);

constraint no_consec_saturdays(RG) /\ shifts_per_fortnight(RG,8) ;


%%GM
constraint regular(roster[GM,..] , "( (c (p|c) (o|l) c c o o )* (c p o c o o a)*   (l{4} o{3})* )  *") ;
constraint assign_shifts(GM,sunday,a,gm_sun);
constraint forall (d in tuesdays) (roster[GM,d]=  c <-> roster[RG,d+2]=l);

constraint no_consec_sundays(GM) /\ shifts_per_fortnight(GM,8);



%%DB  needed to keep every wednesday off
constraint trace("\nDB...",true);
constraint reg_string(DB,"( (a p o a a o o)* (o p o a  a    a a)*  (o p o a a   p p)*  (o a o a p   o o)* (a a o a p o o)* (a p o a o o o)*  (a p o a o a a)* (a p o o a a a)*    (a p o a o p p)* (o a o a p o o )* (l{4} o{3})*   )*") ;  %a	p		a		a	a

/*
array[int,int] of     shifts: db_table =
                             [| a,p,o,a,a, o,o
                              | a,p,o,a,o ,a,a
                              | a,p,o,o,a ,a,a
                              | a,p,o,a,o ,p,p
                              | a,p,o,o,a ,p,p
                              | o,a,o,a,p, o,o
                              | a,a,o,a,p, o,o
                              | a,p,o,a,o, p,p
                              | l,l,l,l,o, o,o  
                              |];

constraint DOC_TABLE(DB,db_table);
*/
constraint assign_shifts(DB,friday,   p,2);
constraint assign_shifts(DB,saturday, a,1);
constraint assign_shifts(DB,saturday, p,1);
constraint assign_shifts(DB,sunday,   a,1);
constraint assign_shifts(DB,sunday,   p,1);

constraint no_consec_weekends(DB) /\ no_third_weekend(DB) /\ no_consec_friday_pms(DB) /\ shifts_per_fortnight(DB,8)  /\  no_fri_before_sat(DB)   /\ no_mon_after_sun(DB);
constraint trace("\nDB...ok",true);

%%CC
constraint trace("\nCC...",true);


array[int,int] of     shifts: cc_table =[| p,o,a,a,a, o,o
                                         | p,o,a,a,o, a,a
                                         | p,o,a,o,a, a,a
                                         | p,o,a,a,o, p,p
                                         | o,o,a,a,p, o,o
                                         | a,a,a,o,p, o,o
                                         | a,a,a,p,o, o,o
                                         | a,a,p,o,a, o,o %new
                                         | a,a,p,o,o, a,a %new
                                         | a,a,p,o,o, p,p % new
                                        %| a,a,o,a,p, o,o
                                         | o,a,a,a,a, o,o    %% just temp 
                                         | l,l,l,l,o, o,o  
                                         |];
constraint DOC_TABLE(CC,cc_table);

constraint assign_shifts(CC,friday,  p,2);
constraint assign_shifts(CC,saturday,a,1);
constraint assign_shifts(CC,saturday,p,1);
constraint assign_shifts(CC,sunday,  a,1);
constraint assign_shifts(CC,sunday,  p,1);

%constraint reg_string(CC,"(   (p o a a a o o)* (o o a a p  o o)* (o a o a p  o o)*  (p o a a o p p)*  (p o (a|o) (a|o) (a|o) a a)*  (p o (a|o)(a|o)(a|o) o (a|p)(a|p)  )*     (l{4} o{3})*   (. . . . . o o )* )* "        ); 


constraint no_split_weekend(CC) /\ no_consec_weekends(CC)     /\ 
           no_third_weekend(CC) /\ no_consec_friday_pms(CC)   /\ 
           no_mon_after_sun(CC)  /\ shifts_per_fortnight(CC,8); 
constraint no_am_after_pm(CC);
constraint trace("\nCC...ok",true);

predicate two_off_after_sun_pm(docs:doc)=  
           forall (day in 1..DAYS-7 where day in sundays)(if roster[doc,day]=p then roster[doc,day+1]=o /\ roster[doc,day+2]=o else true endif);

%var int: fri_b4_sat_count;
%fri_b4_sat_count = sum (d in fridays) (bool2int(on_shift(CC,d+1)));


%%MC
constraint trace("\nMC...",true);

%constraint reg_string(MC,"(   ((a|o) a p c (o|a)   o o )* ((a|o) (o|a) a c p  o o)*  (o a p c o   a o)*   (o (a|o) p c (o|a)    p o)*   (o (a|o) p c (o|a)   o a)* ((a|o) (o|a) p c (o|a)   o p)*    (l{4} o{3})*      )*   "        ); 

%constraint reg_string(MC,"(   ((o|a) (o|a) p c (o|a) (a|o|p) (a|o|p) )*     ((o|a) (o|a)  a c p  o o )*   (l{4} o{3})*      )*   "        ); 

array[int,int] of     shifts: mc_table =
                             [| a,a,p,c,o, o,o
                              | o,a,p,c,a, o,o
                              | o,o,p,c,a, a,o
                              | a,o,p,c,o, a,o
                              | o,o,p,c,a, a,o
                              | o,o,p,c,a, p,o
                              | a,o,p,c,o, p,o
                              | o,o,p,c,a, p,o
                              | o,o,p,c,a, o,p
                              | a,o,p,c,o, o,p
                              | o,a,p,c,o, o,p
                              | o,o,p,c,a, o,a
                              | a,o,p,c,o, o,a
                              | o,a,p,c,o, o,a
                              | o,a,a,c,p, o,o
                              | a,o,a,c,p, o,o
                              | a,a,o,c,p, o,o
                              | l,l,l,l,o, o,o  
                              |];

constraint DOC_TABLE(MC,mc_table);


constraint assign_shifts(MC,friday,  a,2,6);
constraint assign_shifts(MC,friday,  p,2);
constraint assign_shifts(MC,saturday,a,1);
constraint assign_shifts(MC,saturday,p,1);
constraint assign_shifts(MC,sunday,  a,1);
constraint assign_shifts(MC,sunday,  p,1);
constraint no_mon_after_sun(MC) /\ shifts_per_week(MC,4);%  /\ split_weekends(MC);

constraint trace("\nMC...ok",true);

predicate split_weekends(docs:doc) =
          forall (d in saturdays) (if on_shift(doc,d) then off_shift(doc,d+1) 
                                   elseif on_shift(doc,d+1) then off_shift(doc,d) 
                                   else (off_shift(doc,d) /\ off_shift(doc,d+1))
                                   endif);








%%SD
constraint trace("\nSD...",true);
constraint DOC_TABLE(SD,[| c,a,a,p,o, o,o
                         | a,c,a,p,o ,o,o
                         | o,c,a,p,o ,p,o
                         | o,c,a,p,o ,o,a
                         | a,c,a,o,p ,o,o 
                         | o,c,a,a,p ,o,o 
                         | c,a,a,o,p, o,o 
                         | l,l,l,l,o, o,o  
                        |]);
                        
constraint assign_shifts(SD,monday,  a,2,10);
constraint assign_shifts(SD,friday,  p,2);
constraint assign_shifts(SD,saturday,a,0);
constraint assign_shifts(SD,saturday,p,2);
constraint assign_shifts(SD,sunday,a,2);
constraint assign_shifts(SD,sunday,p,0);

constraint no_consec_friday_pms(SD) /\ no_consec_weekends(SD) /\ no_mon_after_sun(SD);



%%HL
constraint trace("\nHL..ok",true);


constraint DOC_FN_TABLE(HL,[| a,a,c,p,o,  o,o,   a,a,c,p,o,  o,o
                            | a,a,c,o,p,  o,o,   a,a,c,p,o,  o,o    
                            | a,a,c,p,o,  o,o,   a,a,c,o,p,  o,o
                            | p,o,c,o,a,  a,p,   o,o,c,a,p,  o,o    
                            | p,o,c,a,o,  a,p,   o,o,c,a,p,  o,o
                            | p,o,c,o,a,  o,o,   p,o,c,a,o,  a,p
                            | o,o,c,a,p,  o,o,   p,o,c,o,a,  a,p
                            | o,a,c,p,o,  o,o,   p,o,c,a,o,  a,p
                            | o,a,c,a,p,  o,o,   p,o,c,a,a,  o,o
                            | o,o,c,a,p,  o,o,   p,o,c,a,a,  o,o
                            | l,l,l,l,o,  o,o,   p,o,c,a,a,  o,o
                            | l,l,l,l,o,  o,o,   l,l,l,l,o,  o,o

                            | l,l,l,l,o,  o,o,   a,a,c,p,o,  o,o
                            |]);

/*
constraint DOC_TABLE(HL,[| a,a,c,p,o, o,o
                         | a,a,c,o,p, o,o
                         | p,o,c,a,a, o,o
                         | p,o,c,a,o, a,p
                         | p,o,c,o,a, a,p
                         | a,p,c,o,o, a,p
                         | o,p,c,a,o, a,p
                         | o,o,c,a,p, o,o

                         | l,l,l,l,o, o,o  
                        |]);
*/



%constraint assign_shifts(HL,monday,  a,2,9);
%constraint assign_shifts(HL,friday,  a,2,8);
%constraint assign_shifts(HL,friday,  p,2);
constraint assign_shifts(HL,saturday,a,2);
constraint assign_shifts(HL,saturday,p,0);
constraint assign_shifts(HL,sunday,  a,0);
constraint assign_shifts(HL,sunday,  p,2);
%constraint no_mon_and_no_tue_after_sun(HL);
constraint shifts_per_fortnight(HL,8);
%constraint no_consec_weekends(HL);

constraint trace("\nHL..ok",true);




%DL
constraint trace("\nDL..ok",true);
%constraint reg_string(DL, "( o o o o o o o )*");

%constraint reg_string(DL,"( ((a|o) p c o a  o o)* ((o|a) p c o (a|o)   a a)*   ((o|a) p c o (a|o)   p p)*  ((a|o) a c o p   o o)*     (l{4} o{3})*        )*") ;%(o p c a a o o)*

array[int,int] of shifts: dl_table = 
                        [| a,p,c,o,a,  o,o
                         | o,p,c,o,a,  a,a
                         | a,p,c,o,o,  a,a
                         | o,p,c,o,a,  p,p
                         | o,a,c,o,p,  o,o
                         | a,a,c,o,p,  o,o
                         | l,l,l,l,o,  o,o  
                         | a,p,c,a,o,  o,o   %temp
                         | o,p,c,a,a,  o,o   %temp
                        |];


constraint DOC_TABLE(DL,dl_table);


constraint assign_shifts(DL,friday,p, 2);
constraint assign_shifts(DL,saturday,a,1);
constraint assign_shifts(DL,saturday,p,1);
constraint assign_shifts(DL,sunday, a,1);
constraint assign_shifts(DL,sunday, p,1);
constraint no_consec_friday_pms(DL)   /\ no_consec_weekends(DL)  /\ no_third_weekend(DL)   /\ no_mon_after_sun(DL)  /\ shifts_per_fortnight(DL,8);
%constraint no_fri_before_sat(DL);
constraint trace("\nDL..ok",true);


constraint trace("\nML...",true);
constraint reg_string(ML, "(   (o o a a o o a)*  (o o a a o o p)*         (o o l a o    o p)*   (o o l a o    o a)*               )*");
constraint assign_shifts(ML,saturday,a,0);
constraint assign_shifts(ML,saturday,p,0);
constraint assign_shifts(ML,sunday,  a,2,8);
constraint assign_shifts(ML,sunday,  p,2,8) /\ trace("ML shifts 6 OK..",        shifts_per_week(ML,3));

constraint trace("ML...ok",true);


%RM
constraint trace("\nRM...",true);
constraint reg_string(RM,"( (a p c (o|a) (a|o) o o)* ((o|a) p c (o|a) o   a a)*  (a p c a o o o)*  (o a c a p   o o)*   (l l o o o a a)*  (l{4} o{3})*       )*");

constraint assign_shifts(RM,friday,a, 1,8);
constraint assign_shifts(RM,friday,p, 2,3);
constraint assign_shifts(RM,saturday, a,2);
constraint assign_shifts(RM,saturday, p,0);
constraint assign_shifts(RM,sunday,   a,2);
constraint assign_shifts(RM,sunday,   p,0);
constraint no_consec_friday_pms(RM) /\ no_consec_weekends(RM) /\ no_third_weekend(RM) /\ no_mon_after_sun(RM) /\ shifts_per_fortnight(RM,8);



constraint trace("\nGN",true);
%constraint reg_string(GN,"( (p o (p|l) (a|l) o p o)*  (l{4} o{3})*    )*") ;

array[int,int] of shifts:gn_table =   [| p,o,p,a,o,p,o
                                       | p,o,p,l,o,p,o
                                       | p,o,l,l,o,l,o
                                       | p,o,p,l,o,l,o
                                       | l,o,l,l,o,p,o
                                       | l,l,l,l,o,o,o
                                       |];



%constraint DOC_TABLE(GN,[| p,o,p,a,o,p,o
%                         | p,o,p,l,o,p,o
%                         | l,l,l,l,o,o,o
%                         | o,o,l,l,l,o,o
%                         |]);
                         
constraint DOC_TABLE(GN,gn_table);                         
                         
%gn_table);


%constraint forall (w in weeks) (table ([roster[GN,day]| day in w], gn_table));


constraint shifts_per_fortnight(GN,8);
constraint trace("...GN..ok",true);



%EW
constraint trace("\nEW",true);
constraint reg_string(EW, "(  (o (o|a|c) (a|p|c) (o|a|c) (o|a|p|c)   (o|a|p) (o|a|p))* (l l l l  o o o)*    )");

%constraint forall(wwk in weekday_weeks, doc = EW)
%                 (global_cardinality_low_up       (roster[doc,wwk],[a , p , o , c ],
%                                                                   [0 , 1 , 1 , 1 ],
%                                                                   [2 , 1 , 3 , 1 ]) \/ global_cardinality_low_up(roster[doc,wwk],[l],[0],[10])   );

constraint weekday_shift_count(EW,a,0,2);
constraint weekday_shift_count(EW,p,1,1);
constraint weekday_shift_count(EW,o,1,3);
constraint weekday_shift_count(EW,c,1,1);

constraint assign_shifts(EW,friday,p,2,3);
constraint assign_shifts(EW,wednesday,p,1,10);
constraint assign_shifts(EW,saturday,a,1);
constraint assign_shifts(EW,saturday,p,1);
constraint assign_shifts(EW,sunday, a,1);
constraint assign_shifts(EW,sunday, p,1);
constraint no_split_weekend(EW) /\ no_am_after_pm(EW);
%constraint no_consec_friday_pms(EW) /\ no_consec_weekends(EW) /\ no_mon_after_sun(EW) /\ no_consec_weekends(EW)/\
constraint shifts_per_fortnight(EW,8);

constraint trace("...EW..ok",true);



%LB
constraint trace("\nLB",true);

constraint reg_string(LB,"( (p o a o a o o )* (p o a o a a a)*  (p o a o a   p p)*  (o o a o p   o o)*    (l{3} o{4})* (l o l o l o o)*  (p o l o l o o)*   (l o a o p o o)*   (o o l o l o o)*    (p o a o c o o)*           )*") ;
constraint assign_shifts(LB,friday,p,2);
constraint assign_shifts(LB,saturday,a,1);
constraint assign_shifts(LB,saturday,p,1);
constraint assign_shifts(LB,sunday, a,1);
constraint assign_shifts(LB,sunday, p,1);
constraint no_consec_friday_pms(LB) /\  no_consec_weekends(LB) /\  no_mon_after_sun(LB);%  /\ no_third_weekend(LB);
%constraint force_mon(LB,p);
constraint trace("...LB..ok",true);

%DH
constraint trace("\nDH",true);
%constraint reg_string(DH,"( (p o c o a o o)*   (p o c o a   p p)*   (o o c o p   o o)*  (o o c o a o o)* (p o c o l o o )*  (l o l o l o o)*   (l{3} o{4})*  )*") ;

constraint DOC_TABLE(DH,[| p,o,c,o,a, o,o
                         | p,o,c,o,a, p,p
                         | o,o,c,o,p, o,o
                         | p,o,c,o,c, o,o  %%temp
                         | l,l,l,o,o, o,o
                         | l,o,l,o,l, o,o
                         |]);


constraint assign_shifts(DH,friday,  p,3)   /\
           
           assign_shifts(DH,saturday,p,3)  /\
           
           assign_shifts(DH,sunday,  p,3);
           
constraint force_mon(DH,p);

constraint no_consec_friday_pms(DH) /\ no_consec_weekends(DH)  /\ no_mon_after_sun(DH);

constraint trace("...DH..ok",true);

constraint trace("\nSK",true);
%constraint reg_string(SK,"( (a c p o o   o o)* (a c p o o a a)* (a c p o o p p)* (o c p o o  o o)*  (o c p o o  a a)* (l o l o o  o o)*    )*") ;

constraint DOC_TABLE(SK,[| a,o,p,o,o, o,o
                         | a,c,p,o,o, o,o
                         | a,c,p,o,o, a,a
                         | o,c,p,o,o, o,o
                         | a,o,p,o,o, a,a  
                         | l,o,l,o,o, o,o  
                         |]);

constraint assign_shifts(SK,saturday,a,1);
constraint assign_shifts(SK,saturday,p,0);  %temp
constraint assign_shifts(SK,sunday,  a,1);
constraint assign_shifts(SK,sunday,  p,0);  %temp
%constraint no_consec_weekends(SK) /\ no_mon_after_sun(SK) /\ no_third_weekend(SK);

%constraint force_mon(SK,a);            

constraint trace("...SK..ok",true) ;

 

constraint trace("\nBL",true);

constraint reg_string(BL,"( (o o (c|o) (a|o|p) (o|p)  o (o|p) )*    (o o l l o  o o)*      ) *") ;


                    %          m t w t f s s   m t w t f s s 
%constraint DOC_FN_TABLE(BL, [| o,o,o,p,o, o,o,  o,o,o,a,o, o,o
%                             | o,o,o,p,o, o,p,  o,o,o,a,o, o,o
%                             | o,o,o,p,o, o,o,  o,o,o,o,o, o,p
%                             |]);



constraint reg_string(CP,"( (o o a o o o o)*) *") ;
constraint count(ssu[CP,..],1) = 0 /\ count(incharge[CP,..],1) = 0;



%constraint reg_string(RP,"( (o a o p o  o p)* (l{3} o{4})* (o l o p o o p)*   (o l o l o o p )*    (o a o p o o l)*      (o a o a o  o p)*               )*") ;
%constraint shifts_per_week(RP,3);

constraint DOC_FN_TABLE(RP,[| o,a,o,p,o,  o,p,   o,a,o,p,c,  o,p
                            | o,a,o,p,o,  o,p,   p,o,o,o,c,  o,l
                            | o,l,o,l,o,  o,p,   o,a,o,p,c,  o,p  % temp
                            |]);











%AR
constraint trace("\nAR",true);

constraint reg_string(AR, "(  (o o a (o|a) o  (o|a) o)*   ( o o l l o  o o)* )*" );

/*
constraint DOC_TABLE(AR,[| o,o,a,a,o, o,o
                         | o,o,a,o,o, a,o  
                         | o,o,l,l,o, o,o  
                         |]);
*/                        
% constraint shifts_per_week(AR,2);


constraint trace("...AR..ok",true);

%%AV

constraint reg_string(AV,"( ((o|a|p|c) (o|a|c) c (a|o|p|c) (a|o|p|c)   (o|a|p) (o|a|p)) * (l l l l o o o)* )*") ;

constraint weekday_shift_count(AV,p,1,1);
constraint weekday_shift_count(AV,o,0,2);
constraint weekday_shift_count(AV,c,1,2);
constraint weekday_shift_count(AV,a,1,1);


constraint assign_shifts(AV,monday,a,2,7);
constraint assign_shifts(AV,tuesday,a,0,0);

constraint assign_shifts(AV,friday,a,2,7);
constraint assign_shifts(AV,friday,p,2,4);
constraint assign_shifts(AV,saturday,a,1);
constraint assign_shifts(AV,sunday,  a,1);
constraint assign_shifts(AV,saturday,p,1);
constraint assign_shifts(AV,sunday,  p,1);

constraint shifts_per_fortnight(AV,8);
constraint no_am_after_pm(AV) /\ no_consec_weekends(AV) /\ no_split_weekend(AV);
constraint no_fri_pm_before_weekend(AV);





%%forall 
%LC
%constraint reg_string(LC,"((o (p|l) o (p|a|o) o (o|a|p) (o|a|p) )*  (o l o l o  o o)*    (o a o l o o o)*             (o p o o o a o )*          )*") ;

constraint DOC_TABLE(LC,[| o,p,o,p,o, o,o
                         | o,p,o,a,o, o,o
                         | o,p,o,a,o, a,a
                         | o,p,o,p,o, a,a
                         | o,p,o,a,o, p,p
                         | o,p,o,p,o, p,p
                         | o,a,o,l,o, o,o   %%temp temp
                         | o,l,o,l,o, o,o
                         |]);
 

constraint assign_shifts(LC,thursday,a,3,4);
constraint assign_shifts(LC,saturday,a,1);
constraint assign_shifts(LC,saturday,p,1);
constraint assign_shifts(LC,sunday,  a,1);
constraint assign_shifts(LC,sunday,  p,1) /\ no_consec_weekends(LC);% /\ shifts_per_week(LC,8);



constraint forall (w in weeks)      %          m t w t f s s  
        (table ([roster[KM,day]| day in w], [| a,o,o,o,o,o,o
                                             | l,o,l,o,o,o,o
                                             | p,o,o,o,o,o,o
                                             | o,o,o,o,o,o,p
                                             | o,o,o,o,o,o,a
                                             | p,o,o,o,o,o,o
                                             | p,o,o,o,o,o,o
                                             | o,o,o,o,o,o,o
                                             | a,o,o,o,o,o,a
                                             | l,o,o,o,o,o,o
                                             | a,o,o,o,o,o,p
                                             | l,o,o,o,o,o,p
                                             
                                             |]));


%DZHANG
constraint reg_string(DZ,"( (o o o o o   o o    o o o o o   o a)*  (l o{6})* )*") ;
constraint count(ssu[DZ,..],1) = 0 /\ count(incharge[DZ,..],1) = 0;


%BALABALABALA
%%WORKS 1000-2000 TUESDAYS AND WEDNESDAYS
constraint reg_string(BB,"( (o a a o o   o o)*    (o l l o o    o o)*    )*") ;
constraint count(ssu[BB,..],1) = 0 /\ count(incharge[BB,..],1) = 0;

constraint reg_string(JD,"( (o  o a o o   o o)*   (o o l o o o o)*   )*") ;
constraint count(ssu[JD,..],1) = 0 /\ count(incharge[JD,..],1) = 0;




constraint regular(roster[CK,..], "((o|a|p)*)" );

/*
constraint DOC_TABLE(CK,[| o,o,a,a,o, a,a
                         | o,o,a,o,o, p,p  
                         | o,o,a,a,o, o,o  
                         | o,o,o,o,o, o,o  
                         | a,a,a,a,a, a,a  
                         | p,o,o,a,a, p,p  
                         |]);
*/


%constraint reg_string(CK,"(    (o o o o o o o)*   )*") ;


%constraint no_split_weekend(CK) /\ no_consec_weekends(CK);
%constraint assign_shifts(CK,saturday,a,2);
%constraint assign_shifts(CK,saturday,p,2);
%constraint assign_shifts(CK,sunday,a,2);
%onstraint assign_shifts(CK,sunday,p,2);

constraint reg_string(NM,"(     ( o o o o o o o   )*   )*") ;

%constraint DOC_TABLE(NM,[| o,a,a,p,p, o,o
%                         | o,o,o,a,a, a,a
%                         | o,o,o,a,a, p,p
%                         |]);





constraint trace("\nsolving......\n",true);

%solve satisfy;
output["\n\n"];

output ["wk 1          |wk 2          |  wk 3        |   wk 4       |    wk 5      |   wk 6       |    wk 7      |   wk 8       |     wk 9     |   wk 10      \n"];
output ["M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S \n"];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output[ show(roster[doc,day]) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then show(doc) ++ "\n" else "" endif | doc in docs, day in days];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output [show(count(roster[..,day],a)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "am" else "" endif | day in days] ;output["\n"];
output [show(count(roster[..,day],p)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "pm" else "" endif| day in days] ;output["\n"];
output [show(count(roster[..,day],c)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "cs" else "" endif| day in days] ;output["\n"];
output [show(count(roster[..,day],l)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "leave" else "" endif| day in days] ;output["\n"];

output [show(count(ssu[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "SSU" else "" endif| day in days] ;output["\n"];
output [show(count(oncall[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "call" else "" endif| day in days] ;output["\n"];




output["WEEKENDS\n\n"];
output[ show(roster[doc,day]) ++ "." ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then show(doc) ++ "\n" else "" endif | doc in docs, day in days where day mod 7 in {saturday,sunday}];
output["----------------------------------------------------\n"];
output[ show(count(roster[..,day],a)) ++ "." ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then "am" ++"\n" else "" endif | day in days where day mod 7 in {saturday,sunday}];
output["----------------------------------------------------\n"];
output[ show(count(roster[..,day],p)) ++ "." ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then "pm" else "" endif | day in days where day mod 7 in {saturday,sunday}];

output["\n\n\n"];



output["\n\n\n"];

/*
output["week1\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk1])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk1])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk1]) ++ " incharge  \n"  ];
output[show(display_oncall[wk1])   ++ "  oncall  \n\n"  ];

output["week2\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,8..14])     ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[8..14])    ++ "  SSU  \n"  ];
output[show(display_incharge[8..14])++ " incharge  \n"  ];
output[show(display_oncall[8..14]) ++ "  oncall  \n\n"  ];

output["week3\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk3])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk3])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk3]) ++ " incharge  \n"  ];
output[show(display_oncall[wk3])   ++ "  oncall  \n\n"  ];

output["week4\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk4])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk4])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk4]) ++ " incharge  \n"  ];
output[show(display_oncall[wk4])   ++ "  oncall  \n\n"  ];

output["week5\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk5])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk5])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk5]) ++ " incharge  \n"  ];
output[show(display_oncall[wk5])   ++ "  oncall  \n\n"  ];

output["week6\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk6])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk6])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk6]) ++ " incharge  \n"  ];
output[show(display_oncall[wk6])   ++ "  oncall  \n\n"  ];


output["week7\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk7])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk7])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk7]) ++ " incharge  \n"  ];
output[show(display_oncall[wk7])   ++ "  oncall  \n\n"  ];

output["week8\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk8])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk8])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk8]) ++ " incharge  \n"  ];
output[show(display_oncall[wk8])   ++ "  oncall  \n\n"  ];

output["week9\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk9])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk9])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk9]) ++ " incharge  \n"  ];
output[show(display_oncall[wk9])   ++ "  oncall  \n\n"  ];

output["week10\n"];
output[" M, T, W, T, F, S, S\n"];
output[show(roster[doc,wk10])       ++ " \(doc)  \n"| doc in docs ];
output[show(display_ssu[wk10])      ++ "  SSU  \n"  ];
output[show(display_incharge[wk10]) ++ " incharge  \n"  ];
output[show(display_oncall[wk10])   ++ "  oncall  \n\n"  ];


*/


array[docs,days] of var shifts: R;

constraint forall(doc in docs, day in days) 
        (if      ssu[doc,day]=1      then  R[doc,day] = s
         elseif  incharge[doc,day]=1 then  R[doc,day] = i
         else                              R[doc,day] = roster[doc,day]
         endif);

output["\n\nSHOWING INCHARGE (i) AND SSU (s) and ONCALL across the top \n\n"];


output ["wk 1                 | wk 2                 |   wk 3               |    wk 4              |     wk 5             |    wk 6              |     wk 7             |    wk 8              |     wk 9             |    wk 10      \n"];
output ["M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  | M  T  W  T  F  S  S  \n"];
output["-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output[ show(display_oncall[day]) ++ " " ++ if day mod 7 = sunday then "| " else "" endif  ++ if day = 70  then "ONCALL\n" else "" endif | day in days];
output["-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output[ show(R[doc,day]) ++ "  " ++ if day mod 7 = sunday then "| " else "" endif  ++ if day = 70  then show(doc) ++ " " ++ show(get_empnum(doc)) ++ "\n" else "" endif | doc in docs, day in days];
output["-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
%%show(get_empnum(fix(display_oncall[day])))
output [show(count(roster[..,day],a)) ++ "  " ++ if day mod 7 = sunday then "| " else "" endif  ++ if day = 70 then "am" else "" endif | day in days] ;output["\n"];
output [show(count(roster[..,day],p)) ++ "  " ++ if day mod 7 = sunday then "| " else "" endif  ++ if day = 70 then "pm" else "" endif| day in days] ;output["\n"];
output["-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"];



output[show(doc)   ++ 
			" we am: " ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {saturday,sunday}],a)))         ++

                   " we pm  "  ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {saturday,sunday}],p)))         ++

	           " fri pm  "  ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {friday}],p)))         ++
                    
                    
                    " oncall:" ++ show(fix(count(oncall[doc,..],1)))  ++ "\n" | doc in docs];



/*
array[docs,days] of var shifts: R_ON;

constraint forall(doc in docs, day in days) 
        (if      ssu[doc,day]=1      then  R_ON[doc,day] = s
         elseif  incharge[doc,day]=1 then  R_ON[doc,day] = i
         elseif  roster[doc,day]=o   then  R_ON[doc,day] = o
         else                              R_ON[doc,day] = roster[doc,day]
         endif);


%function string: fix_out(docs: doc, days: day)=
              
%              if R_ON[doc,day] = a then a818_shift else "" endif;


output [show(emp_num[doc]) ++ "\t" ++ show(day) ++ "\t" ++ show(doc) ++ "\t" ++ show(area) ++ "\t" ++

            
                 show(if    R_ON[doc,day] = a then "\t" ++ area ++ "\t" ++ a818_shift_d ++ "\t" ++ a818_start ++ "\t" ++ a818_finish ++ "\t" ++ a818_hours 
            
                 elseif R_ON[doc,day] = p then join("\t",[area,p1624_shift_d,p1624_start,p1624_finish,p1624_hours,"N\tN\tN"])     
                 
                 elseif R_ON[doc,day] = c then concat(["\t",c818_shift_d,"\t",c818_start,"\t",c818_finish,"\t",c818_hours])
            
                 elseif R_ON[doc,day] = s then concat(["\t",s818_shift_d,"\t",s818_start,"\t",s818_finish,"\t",s818_hours])
          
                 elseif R_ON[doc,day] = i then concat(["\t",i818_shift_d,"\t",i818_start,"\t",i818_finish,"\t",i818_hours])
                 
                 
                else " delete      "
                endif)
    
                ++ "\n"
                |doc in docs, day in days];
                
                

output[show(emp_num[docs[display_oncall[day]]]) ++ "\t" ++ show(day) ++ "\t MH ONCALL\t" ++ soncall_start ++ "\t" ++ soncall_finish ++ "\n" | day in days]; 




  %output ["\n"  ++ show(roster[LS,..])];

*/

include "rosteron_dump.mzn";
include "rosteron_test_one_doc.mzn";