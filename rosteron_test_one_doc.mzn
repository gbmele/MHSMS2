include "nosets.mzn";
set of docs: test_doc = {SK};


%%constraint count([roster[LC,d] | d in tuesdays],a,1);

%enum LP_INDEX ={ww1,ww2,ww3,ww4,ww5,ww6,ww7,ww8,ww9,ww10,sshifts,single_days};


set of days: test_days = 1..70;
output["\n\n"];
output[show(test_doc) ++ "\n"];


output [if fix(Clin[doc,day]) != zz then 
                                   show(fix(get_empnum(doc)))       ++ sep ++ 
                                   show(get_day(day))               ++ sep ++ 
                                   get_area(doc)                    ++ sep ++
                                   get_desc (fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_role(doc)                    ++ sep  ++ 
                                   get_start(fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_fin(  fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_hrs(  fix(Clin[doc,day]))    ++ sep  ++  dag_end ++ "\n" 
       else "" endif |doc in test_doc, day in test_days];

output [if fix(CST[doc,day]) != zz then show(fix(get_empnum(doc))) ++ sep 
                                ++ show(get_day(day))          ++ sep ++
                                get_area(doc)                  ++ sep  ++
                                get_desc (fix(CST[doc,day]))   ++ sep ++ get_role(doc) ++ sep ++ 
                                get_start(fix(CST[doc,day]))   ++ sep ++ 
                                get_fin  (fix(CST[doc,day]))   ++ sep ++ 
                                get_hrs( fix(CST[doc,day]))    ++ sep ++                                
                                dag_end ++ "\n" 

       else "" endif |doc in test_doc, day in test_days];


output[show(roster[test_doc,day]) ++ if day mod 7 = sunday then " wk " ++ show(fix(((day - 1) div 7 ) + 1)) ++ " day" ++ show(day) ++ " " ++ show(get_day(day)) ++ "\n"  ++ if day mod 14 == sunday then "\n" else "" endif else "" endif | day in days];
output["\n"];

output["\n"];

output[show(docs)];
output["\n"];

%output[show2d(RON)];
output[show(length(REQUESTS))];
constraint assert(fix(REQUESTS[JD,70])=77,"gg");
constraint assert(fix(REQUESTS[JD,1]) =77,"gg");
constraint assert(length(REQUESTS)=length(days)*length(docs),"docs x days");


output["REQUESTS BREAKDOWN\n 99=OFF 41=AL,42=CL, 43=LPPA, 44-PAT 45 MAT  1 = AM 2 = PM, 3 = A OR P \n\n" ++ show(test_doc) ++   "\n M  T  W  T  F  S  S  \n"];


output[show(REQUESTS[test_doc,day]) ++ "" ++ if day mod 7 = sunday then "\n" ++ if day mod 14 = sunday then "\n" else "" endif  else "" endif | day in days ];
output["\n"];

output["\n"];
output["\n"];
output ["wk 1          |wk 2          |  wk 3        |   wk 4       |    wk 5      |   wk 6       |    wk 7      |   wk 8       |     wk 9     |   wk 10      \n"];
output ["M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S |M T W T F S S \n"];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
%output[ show(roster[doc,day]) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70  then show(doc) ++ "\n" else "" endif | doc in docs, day in days];
output["--------------------------------------------------------------------------------------------------------------------------------------------------------\n"];
output [show(count([roster[doc,day]|doc in doccount],a)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "am" else "" endif | day in days] ;output["\n"];
output [show(count(roster[..,day],p)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "pm" else "" endif| day in days] ;output["\n"];
%output [show(count(roster[..,day],c)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "cs" else "" endif| day in days] ;output["\n"];
%output [show(count(roster[..,day],l)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "leave" else "" endif| day in days] ;output["\n"];

%output [show(count(ssu[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "SSU" else "" endif| day in days] ;output["\n"];
output [show(count(oncall[..,day],1)) ++ " " ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "call" else "" endif| day in days] ;output["\n"];
output [show(display_oncall[day]) ++ "" ++ if day mod 7 = sunday then "|" else "" endif  ++ if day = 70 then "call" else "" endif| day in days] ;output["\n"];

output[show(HL_AV)];
output["\n"];
output[show(roster[AV,d]) ++ "," ++  if d mod 7 = 0 then "|" else "" endif| d in days];output[" AV"];
output["\n"];
output[show(roster[HL,d]) ++ "," ++ if d mod 7 = 0 then "|" else "" endif| d in days];output["HL"];
output["\n"];
output[show(roster[CK,d]) ++ "," ++  if d mod 7 = 0 then "|" else "" endif| d in days];output[" CK"];
output["\n"];
output[show(roster[SK,d]) ++ "," ++  if d mod 7 = 0 then "|" else "" endif| d in days];output["SK"];
output["\n"];
output[show(roster[LC,d]) ++ "," ++  if d mod 7 = 0 then "|" else "" endif| d in days];output["Lewis"];
output["\n"];
output[show(roster[CC,d]) ++ "," ++  if d mod 7 = 0 then "|" else "" endif| d in days];output["CC"];
output["\n"];
output["\n"];
output["\n"];

output[show(roster[doc,d])        ++ "," ++  if d mod 7  = 0 then "|" else  "" endif 
                                         ++  if d mod 14 = 0 then "|" else "" endif
                                         ++  if d mod 70 = 0 then show(doc) ++ "\n" else "" endif
      | doc in docs, d in days];


output["HL AV == " ++ show(count(HL_AV[..],1))];
output["\n"];
output["mon am-" ++ show(min_mon_am)];
output["\n"];
output["tue am-" ++ show(min_tue_am)];
output["\n"]; 
output["wed am-" ++ show(min_wed_am)];
output["\n"];
output["thu am-" ++ show(min_thu_am)];
output["\n"];
output["fri am-" ++ show(min_fri_am)];
output["\n"];
output["sue tue am-" ++ show(sue_tue_am)];
output["\n"];
output["AR incharge-" ++ show(AR_IC_am)];
output["\n"];
output["AR SSU-" ++ show(count(ssu[AR,..],1))];
output["\n"];
output["DB SSU-" ++ show(count(ssu[DB,..],1))];
output["\n"];
output["erin wed am " ++ show(erin_wed_am_count)];
output["\n"];
output["HL tue PM " ++ show(HL_tue_pm)];
output["\n"];
output["HL thu PM " ++ show(HL_thu_pm)];
output["\n"];

%output[show(display_oncall[day]) ++ " " ++ show(roster[display_oncall[day],day]) ++ "\n" | day in days];
constraint forall (day in days) (roster[display_oncall[day],day]=p);
output["all oncalls on pm\n"];

output [if fix(display_oncall[day])=DH then "doc DH should be oncall on day 6 = saturday " ++ show(display_oncall[day]) ++ " " ++ show(day mod 7) ++ "\n"  else "" endif | day in 1..DAYS];
output["\n"];
output[show(REQUESTS[CK,..])];
output["\n"];
output[show(roster[CK,..])];
output["\n"];
