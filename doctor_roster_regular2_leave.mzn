constraint forall (doc in docs) 

        (if     doc = RG then leave_weeks(RG,[weeks[3]],rg_shifts) /\ sat_sun_off_prior(RG,[])

        elseif  doc = GM then leave_weeks(GM,[week1,week2],gm_shifts)
        
        elseif  doc = DB then leave_weeks(DB,[week7],db_shifts) 

        elseif  doc = CC then leave_weeks(CC,[week2,week3],cc_shifts) 
       
        elseif  doc = MC then leave_weeks(MC,[week1,week2],mc_shifts) 
                                
        elseif  doc = SD then leave_weeks(SD,[week5,week6],sd_shifts) 
                
        elseif  doc = HL then leave_weeks(HL,[week3,week4],hl_shifts)  /\ sat_sun_off_prior(HL,[week3_prior])

        elseif  doc = ML then leave_weeks(ML,[week9],ml_shifts)  /\ sat_sun_off_prior(ML,[])
                       
        elseif  doc = DL then leave_weeks(DL,[week9,week10],dl_shifts)  /\ sat_sun_off_prior(DL,[])

        elseif  doc = RM then leave_weeks(RM,[week1,week2,week3],rm_shifts) /\ sat_sun_off_prior(RM,[])
                                                                                                                                      
        elseif  doc = GN then leave_weeks(GN,[],gn_shifts,10)  /\ sat_sun_off_prior(GN,[]) /\ global_cardinality([roster[GN,d] | d in thursdays],[l],[10])
        
        elseif  doc = EW then leave_weeks(EW,[week6,week7],ew_shifts) /\ sat_sun_off_prior(EW,[week6_prior])

        elseif  doc = LB then leave_weeks(LB,[week4,week5],lb_shifts) /\ sat_sun_off_prior(LB,[])
                                                                                                                                                                                                                                                                                                                                                                                        
        elseif  doc = SK then leave_weeks(SK,[week1,week3],sk_shifts)  /\ sat_sun_off_prior(SK,[])

        elseif  doc = DH then leave_weeks(DH,[],dh_shifts)  /\ sat_sun_off_prior(DH,[])

        elseif  doc = BL then leave_weeks(BL,[],bl_shifts)  /\ sat_sun_off_prior(BL,[])
        
        elseif  doc = CP then leave_weeks(CP,[],cp_shifts)  /\ sat_sun_off_prior(CP,[])
                
        elseif  doc = RP then leave_weeks(RP,[week5,week7],rp_shifts)  /\ sat_sun_off_prior(RP,[])

        elseif  doc = AR then leave_weeks(AR,[],ar_shifts)  /\ sat_sun_off_prior(AR,[])
        
        elseif  doc = LS then leave_weeks(LS,[],ls_shifts)  /\ sat_sun_off_prior(LS,[])
        
        elseif  doc = AV then leave_weeks(AV,[week3,week5],av_shifts)  /\ sat_sun_off_prior(AV,[])
                                
        elseif  doc = LC then leave_weeks(LC,[],lc_shifts)  /\ sat_sun_off_prior(LC,[])
                                                                
        elseif  doc = KM then leave_weeks(KM,[],km_shifts)  /\ sat_sun_off_prior(KM,[])
     
        elseif  doc = BB then leave_weeks(BB,[],bb_shifts)  /\ sat_sun_off_prior(BB,[])
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
        
        else count(roster[doc,..],l,0)
        
        endif);       

array[docs,1..10] of var 0..1: CONFERENCE;

constraint forall (doc in docs, w in 1..10) 
      (if doc = GM then CONFERENCE[GM,1]=1 /\ CONFERENCE[GM,2]=1 /\ count(CONFERENCE[GM,..],1) = 2
      
      elseif doc = DB then CONFERENCE[DB,7]=1 /\ count(CONFERENCE[DB,..],1) = 1
      
      else count(CONFERENCE[doc,..],1) = 0 
      
      endif);


%function var int: getweek(docs:doc,days:d) =
%        (if leave[doc,(((d-1)div 7) + 1)] = ANL then (((d -1 ) div 7) + 1)
        
%       elseif leave[doc,(((d-1)div 7) + 1)] = CNL then (((d -1 ) div 7) + 1)
        
%        else 0
        
%        endif);
        

 
                             
                                                                                     
                             
/*

predicate leave_day(docs: doc, int: day) =
          roster[doc,day]==l;

predicate leave_week(docs:doc, set of int: week, int: leave_days) =         
              count(roster[doc,week],l,leave_days);
              
predicate leave_weeks(docs: doc, array[int] of set of int: weeks, int: leave_days) =
              forall (w in weeks) (leave_week(doc,w,leave_days)) /\
              count(roster[doc,..],l,leave_days * length(weeks));              
              
predicate leave_weeks(docs: doc, array[int] of set of int: weeks, int: leave_days, int: single_days) =
              forall (w in weeks) (leave_week(doc,w,leave_days)) /\
              count(roster[doc,..],l,single_days + leave_days * length(weeks));              

predicate sat_sun_off_prior(docs: doc, array[int] of int: wk) =
            forall (w in wk) ((  roster[doc,sundays[w]]=o) /\ (roster[doc,saturdays[w]]=o));

*/              
              
