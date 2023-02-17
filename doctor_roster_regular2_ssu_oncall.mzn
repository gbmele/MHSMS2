% SSU 
array[docs,days] of var 0..1: ssu;         %% am ->ssu      - as per oncall above  

constraint forall (d in days, doc in docs) ((roster[doc,d]= a <- ssu[doc,d]==1)); % \/ (roster[doc,d] !=a -> ssu[doc,d]==0)     );

constraint forall(d in days) (count(ssu[..,d],1,1));

%constraint forall(d in {GM,DB,GN}) (count(ssu[d,..],1,0));

constraint forall(d in docs) (global_cardinality_low_up(ssu[d,..],[1],[0],[5]));

constraint forall(d in docs) (global_cardinality_low_up(ssu[d, 1..14],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,15..28],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,29..42],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,43..56],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(ssu[d,57..70],[1],[0],[2]));

constraint global_cardinality_low_up(ssu[AR,..],[1],[0],[10]);


%%not sat and sun ssu in same weekend
constraint forall(doc in docs,day in saturdays)
                (if     ssu[doc,day] = 1 then ssu[doc,day+1]= 0
                 elseif ssu[doc,day+1]=1 then ssu[doc,day]  = 0
                 else true
                 endif);



array[days] of var docs: display_ssu;
constraint forall (day in days, doc in docs) (ssu[doc,day]=1 <- display_ssu[day]=doc);

% ONCALL
int: offcall = 0;

array[docs,days] of var 0..1: oncall;       

    %% am ->ssu      - as per oncall above  

constraint forall (d in days, doc in docs) ((roster[doc,d]= p <- oncall[doc,d]==1)); % \/ (roster[doc,d] !=a -> ssu[doc,d]==0)     );

%constraint forall (d in days, doc in docs) (if roster[doc,d]= p then oncall[doc,d]=1 else true endif);     % \/ (roster[doc,d] !=a -> ssu[doc,d]==0)     );

constraint forall(d in days) (count(oncall[..,d],1,1));  %%only 1 person on call per day

constraint count(oncall[RG,..],1,0);
constraint count(oncall[GM,..],1,0);
constraint count(oncall[LC,..],1,0);
constraint count(oncall[DH,..],1,3);

constraint count([oncall[DH,d] | d in days where d mod 7 = saturday],1,3);%  /\ count([oncall[DH,d] | d in days where d in {monday,tuesday,wednesday,thursday,friday,sunday}],1,0);
%constraint count(oncall[LS,..],1,ls_oncall);
%constraint count([oncall[DH,day] | day in sundays],1,0);

constraint global_cardinality_low_up(oncall[MC,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[DB,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[CC,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[MC,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[SD,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[ML,..],[1],[3],[4]);
constraint global_cardinality_low_up(oncall[HL,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[DL,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[RM,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[GN,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[EW,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[LB,..],[1],[3],[4]);
constraint global_cardinality_low_up(oncall[SK,..],[1],[4],[5]);
constraint global_cardinality_low_up(oncall[BL,..],[1],[3],[4]);
constraint global_cardinality_low_up(oncall[RP,..],[1],[3],[4]);
constraint global_cardinality_low_up(oncall[LS,..],[1],[3],[4]);
constraint global_cardinality_low_up(oncall[AV,..],[1],[3],[4]);
constraint global_cardinality_low_up(oncall[AR,..],[1],[0],[0]);
constraint global_cardinality_low_up(oncall[KM,..],[1],[1],[2]);


constraint forall(d in docs) (global_cardinality_low_up(oncall[d,..],[1],[0],[5]));        %% 5 oncall max per 10 weeks

constraint forall(d in docs) (global_cardinality_low_up(oncall[d, 1..14],[1],[0],[1]));    %%once per fortnight if possible!!!!!
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,15..28],[1],[0],[1]));
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,29..42],[1],[0],[1]));
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,43..56],[1],[0],[1]));
constraint forall(d in docs) (global_cardinality_low_up(oncall[d,57..70],[1],[0],[1]));

array[days] of var docs: display_oncall;
constraint forall (day in days, doc in docs) (oncall[doc,day]=1 <- display_oncall[day]=doc);


%  INCHARGE

array[docs,days] of var 0..1: incharge;         %% am ->ssu      - as per oncall above  

constraint forall (d in days, doc in docs) ((roster[doc,d]= a /\ ssu[doc,d] != 1)  <- (incharge[doc,d]==1)); % \/ (roster[doc,d] !=a -> ssu[doc,d]==0)     );

constraint forall(d in days) (count(incharge[..,d],1,1));

constraint forall(d in {GM,RG,GN,AR}) (count(incharge[d,..],1,0));

constraint forall(d in docs) (global_cardinality_low_up(incharge[d,..],[1],[0],[10]));

constraint forall(d in docs) (global_cardinality_low_up(incharge[d, 1..14],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,15..28],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,29..42],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,43..56],[1],[0],[2]));
constraint forall(d in docs) (global_cardinality_low_up(incharge[d,57..70],[1],[0],[2]));

array[days] of var docs: display_incharge;
constraint forall (day in days, doc in docs) (incharge[doc,day]=1 <- display_incharge[day]=doc);

constraint forall(doc in docs,day in saturdays)
                (if     incharge[doc,doc] = 1 then incharge[doc,day+1]= 0
                 elseif incharge[doc,day+1]=1 then incharge[doc,day]  = 0
                 else true
                 endif);



%% for martin 

constraint forall (day in thursdays) (incharge[ML,day]=0 /\ ssu[ML,day]=0);
%%FOR LINDSAY
constraint forall (day in wednesdays) (incharge[LB,day]=0 /\ ssu[LB,day]=0);
                 