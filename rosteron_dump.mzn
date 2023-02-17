/*
41 annual leave
42 conference leave
43 longservice leave
44 pat leave
45 mat leave.


*/
int: annual_leave         = 41;
int: conference_leave     = 42;
int: long_service_leave   = 43;
int: pat_leave            = 44;
int: mat_leave            = 45;

enum shifts2 = {  a812  , %1
                  a814  , %2
                  a816  ,
                  a817  ,
                  a81730,
                  a818  ,
                  a918,
                  a1217  ,
                  a1020  ,
                  c1113 ,
                  %c1115 ,
                  c1116 ,
                  c1215 ,
                  c1216 ,
                  c1218 ,
                  c1416 ,
                  c1418 ,
                  c1618 ,
                  c1718 ,
                  c816  ,
                  c818  ,
                  c819  ,
                  p1224 ,
                  p1323 ,
                  p1324 ,
                  p1424 ,
                  p1624 ,
                  p1724 ,
                  s816  ,
                  s817  ,
                  s81730,
                  s818  ,
                  i816  ,
                  i817  ,
                  i81730,
                  i818  ,
                  al    ,
                  cl    ,
                  lsl   ,
                  patl  ,
                  matl  ,
                  perl  ,
                  zz    };


%put this in rosteronoutput



%tring: a818_str  = join("_",[area,a818_shift,a818_start,a818_finish,a818_hours,a818_shift_d,"N","N","N"]);


string: zz_shift= "zz";

%array[1..70]      of string: dates; 
%array[shifts2]   of string: shift_desc;
%dates = 


function string: get_desc(shifts2: sh) = 
               if       sh = a812 then   a812_shift
               elseif   sh = a814 then   a814_shift
               elseif   sh = a816 then   a816_shift
               elseif   sh = a817 then   a817_shift
               elseif   sh = a81730 then a81730_shift
               elseif   sh = a818  then  a818_shift  
               elseif   sh = a918  then  a918_shift  
               elseif   sh = a1217  then  a1217_shift  
               elseif   sh = a1020  then  a1020_shift  
               elseif   sh = c1113 then  c1113_shift 
               elseif   sh = c1116 then  c1116_shift 
               elseif   sh = c1215 then  c1215_shift 
               elseif   sh = c1216 then  c1216_shift 
               elseif   sh = c1218 then  c1218_shift 
               elseif   sh = c1416 then  c1416_shift 
               elseif   sh = c1418 then  c1418_shift 
               elseif   sh = c1618 then  c1618_shift 
               elseif   sh = c1718 then  c1718_shift 
               elseif   sh = c816  then  c816_shift
               elseif   sh = c818  then  c818_shift
               elseif   sh = c819  then  c819_shift
               elseif   sh = p1224 then  p1224_shift 
               elseif   sh = p1324 then  p1324_shift   
               elseif   sh = p1323 then  p1323_shift 
               elseif   sh = p1424 then  p1424_shift 
               elseif   sh = p1624 then  p1624_shift 
               elseif   sh = p1724 then  p1724_shift 
               elseif   sh = s816  then  s816_shift 
               elseif   sh = s818  then  s818_shift 
               elseif   sh = s817  then  s817_shift  
               elseif   sh = s81730 then s81730_shift
               elseif   sh = i816   then i816_shift  
               elseif   sh = i817   then i817_shift  
               elseif   sh = i818   then i818_shift  
               elseif   sh = i81730 then i81730_shift
               elseif   sh = al     then leave_shift   
               elseif   sh = cl     then cleave_shift   
               elseif   sh = lsl     then lsleave_shift   
               elseif   sh = patl     then patleave_shift   
               elseif   sh = matl     then matleave_shift   
               elseif   sh = perl     then personal_leave_shift   
                               
               else     "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnNO DESCRIPTION SHIFT"
               endif;
function string: get_start(shifts2: sh) = 
               if       sh = a812 then   a812_start
               elseif   sh = a814 then   a814_start
               elseif   sh = a816 then   a816_start
               elseif   sh = a817 then   a817_start
               elseif   sh = a81730 then a81730_start
               elseif   sh = a818  then  a818_start
               elseif   sh = a918  then  a918_start
               elseif   sh = a816  then  a816_start
               elseif   sh = a1217  then  a1217_start
               elseif   sh = a1020  then  a1020_start
               elseif   sh = c1113 then  c1113_start 
               elseif   sh = c1116 then  c1116_start 
               elseif   sh = c1215 then  c1215_start 
               elseif   sh = c1216 then  c1216_start 
               elseif   sh = c1218 then  c1218_start 
               elseif   sh = c1416 then  c1416_start 
               elseif   sh = c1418 then  c1418_start 
               elseif   sh = c1618 then  c1618_start 
               elseif   sh = c1718 then  c1718_start 
               elseif   sh = c816  then  c816_start
               elseif   sh = c818  then  c818_start
               elseif   sh = c819  then  c819_start
               elseif   sh = p1224 then  p1224_start 
               elseif   sh = p1323 then  p1323_start 
               elseif   sh = p1324 then  p1324_start 
               elseif   sh = p1424 then  p1424_start 
               elseif   sh = p1624 then  p1624_start 
               elseif   sh = p1724 then  p1724_start 
               elseif   sh = s816  then  s816_start 
               elseif   sh = s818  then  s818_start 
               elseif   sh = s817  then  s817_start  
               elseif   sh = s81730 then s81730_start
               elseif   sh = i816   then i816_start  
               elseif   sh = i817   then i817_start  
               elseif   sh = i818   then i818_start  
               elseif   sh = i81730 then i81730_start
               elseif   sh = al     then leave_start  
               elseif   sh = cl     then cleave_start  
               elseif   sh = lsl     then lsleave_start  
               elseif   sh = patl     then patleave_start  
               elseif   sh = matl     then matleave_start  
               elseif   sh = perl     then personal_leave_start  
               else     " nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnNO START TIME"
               endif;
function string: get_fin(shifts2: sh) = 
               if       sh = a812 then   a812_finish
               elseif   sh = a814 then   a814_finish
               elseif   sh = a816 then   a816_finish
               elseif   sh = a817 then   a817_finish
               elseif   sh = a81730 then a81730_finish
               elseif   sh = a818  then  a818_finish
               elseif   sh = a918  then  a918_finish
               elseif   sh = a1217  then  a1217_finish
               elseif   sh = a1020  then  a1020_finish
               elseif   sh = c1113 then  c1113_finish
               elseif   sh = c1116 then  c1116_finish
               elseif   sh = c1215 then  c1215_finish
               elseif   sh = c1216 then  c1216_finish
               elseif   sh = c1218 then  c1218_finish
               elseif   sh = c1416 then  c1416_finish
               elseif   sh = c1418 then  c1418_finish 
               elseif   sh = c1618 then  c1618_finish 
               elseif   sh = c1718 then  c1718_finish 
               elseif   sh = c816  then  c816_finish
               elseif   sh = c818  then  c818_finish
               elseif   sh = c819  then  c819_finish
               elseif   sh = p1224 then  p1224_finish 
               elseif   sh = p1323 then  p1323_finish
               elseif   sh = p1324 then  p1324_finish
               elseif   sh = p1424 then  p1424_finish 
               elseif   sh = p1624 then  p1624_finish 
               elseif   sh = p1724 then  p1724_finish
               elseif   sh = s816  then  s816_finish 
               elseif   sh = s818  then  s818_finish 
               elseif   sh = s817  then  s817_finish  
               elseif   sh = s81730 then s81730_finish
               elseif   sh = i816   then i816_finish
               elseif   sh = i817   then i817_finish  
               elseif   sh = i818   then i818_finish  
               elseif   sh = i81730 then i81730_finish
               elseif   sh = al     then leave_finish    
               elseif   sh = cl     then cleave_finish    
               elseif   sh = lsl     then lsleave_finish    
               elseif   sh = patl     then patleave_finish    
               elseif   sh = matl     then matleave_finish    
               elseif   sh = perl     then personal_leave_finish    
               else     "NnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnO FINISH TIME"
               endif;

function string: get_hrs(shifts2: sh) = 
               if       sh = a812 then   a812_hours
               elseif   sh = a814 then   a814_hours
               elseif   sh = a816 then   a816_hours
               elseif   sh = a817 then   a817_hours
               elseif   sh = a81730 then a81730_hours
               elseif   sh = a818  then  a818_hours
               elseif   sh = a918  then  a918_hours
               elseif   sh = a816  then  a816_hours
               elseif   sh = a1217  then  a1217_hours
               elseif   sh = a1020  then  a1020_hours
               elseif   sh = c1113 then  c1113_hours
               elseif   sh = c1116 then  c1116_hours
               elseif   sh = c1215 then  c1215_hours
               elseif   sh = c1216 then  c1216_hours
               elseif   sh = c1218 then  c1218_hours
               elseif   sh = c1416 then  c1416_hours
               elseif   sh = c1418 then  c1418_hours
               elseif   sh = c1618 then  c1618_hours
               elseif   sh = c1718 then  c1718_hours 
               elseif   sh = c816  then  c816_hours
               elseif   sh = c818  then  c818_hours
               elseif   sh = c819  then  c819_hours
               elseif   sh = p1224 then  p1224_hours 
               elseif   sh = p1323 then  p1323_hours
               elseif   sh = p1324 then  p1324_hours
               elseif   sh = p1424 then  p1424_hours 
               elseif   sh = p1624 then  p1624_hours 
               elseif   sh = p1724 then  p1724_hours
               elseif   sh = s816  then  s816_hours
               elseif   sh = s818  then  s818_hours
               elseif   sh = s817  then  s817_hours 
               elseif   sh = s81730 then s81730_hours
               elseif   sh = i816   then i816_hours
               elseif   sh = i817   then i817_hours  
               elseif   sh = i818   then i818_hours  
               elseif   sh = i81730 then i81730_hours
               elseif   sh = al     then leave_hours    
               elseif   sh = cl     then cleave_hours    
               elseif   sh = lsl    then lsleave_hours    
               elseif   sh = patl    then patleave_hours    
               elseif   sh = matl    then matleave_hours    
               elseif   sh = perl    then personal_leave_hours    
               else     "nnnnnnnnnnnnnnnnnnnnnnnnoooooooooooooooo hhhhhhhhrrrrrrrrrrrrsssssss"
               endif;





array[docs,days] of var shifts: RON;



array[docs,days] of var shifts2: Clin;
array[docs,days] of var shifts2: CST;

 
    
constraint forall(doc in docs, day in days)

        (if      display_ssu[day]=doc      then  RON[doc,day] = s

         elseif  display_incharge[day]=doc then  RON[doc,day] = i

         elseif  roster[doc,day]=o   then  RON[doc,day] = o

         else                              RON[doc,day] = roster[doc,day]

         endif);


predicate c_cs(docs:doc,days:day,shifts2:c,shifts2:cs) =
                    Clin[doc,day]=c /\ CST[doc,day]=cs;

predicate ron(docs:doc,days:day,shifts:shift) =
                      RON[doc,day]=shift;



%%RG 

constraint forall(d in days)
           ( if       RON[RG,d] = c then  (Clin[RG,d]=zz   /\ CST[RG,d]=c818)
           
             elseif   RON[RG,d] = s  then (Clin[RG,d]= s818 /\ CST[RG,d]=zz)
             
             elseif   RON[RG,d] = a  then (Clin[RG,d]= a818 /\ CST[RG,d]=zz)
             
             elseif   RON[RG,d] = i  then (Clin[RG,d]= i818 /\ CST[RG,d]=zz)
             
             elseif   RON[RG,d] = p then (Clin[RG,d]=p1624  /\  CST[RG,d]=c1416)  
             
             %elseif   RON[RG,d] = l  then (Clin[RG,d]=al  /\  CST[RG,d]=zz)  


             elseif   (RON[RG,d] = l /\ REQUESTS[RG,d] = 41) then (Clin[RG,d]=al  /\  CST[RG,d]=zz)  

             elseif   (RON[RG,d] = l /\ REQUESTS[RG,d] = 42) then (Clin[RG,d]=cl  /\  CST[RG,d]=zz)  

             elseif   (RON[RG,d] = l /\ REQUESTS[RG,d] = 43) then (Clin[RG,d]=lsl  /\  CST[RG,d]=zz)  


             else     (Clin[RG,d]= zz /\ CST[RG,d]=zz)
             endif);




%%GM
constraint forall(doc = GM,d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624 /\  CST[doc,d]=c1416)  
             
             %elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  




             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);

%%DB
constraint forall(doc in {DB},d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=zz)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  
             

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
%CC
constraint forall(doc in {CC},d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=zz)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
             %elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  
             
             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
      
%MC
constraint forall(doc = MC,d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  
             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  


             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
 
                       
%SD
constraint forall(doc in {SD},d in days)
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s81730 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a81730 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i81730 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p /\ d mod 7 = thursday then (Clin[doc,d]=p1324  /\  CST[doc,d]=zz)  
             
             elseif   RON[doc,d] = p /\ d mod 7 = saturday then (Clin[doc,d]=p1624  /\  CST[doc,d]=zz)  

%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
                  
%HL
constraint forall(doc in { HL },d in days)
           
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s816 /\ CST[doc,d]=1618)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a816 /\ CST[doc,d]=c1618)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i817 /\ CST[doc,d]=c1718)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);
                  
%ML
constraint forall(doc in { ML },d in days)
           
           ( if       RON[doc,d] = c then  (Clin[doc,d]=zz   /\ CST[doc,d]=zz)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = a  /\ d mod 7 = thursday then (Clin[doc,d]= a812 /\ CST[doc,d]=c1218)
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz)
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1424  /\  CST[doc,d]=zz)  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             endif);




%DL
constraint forall(doc in { DL },d in days)
           
             (if      RON[doc,d] = c then  (Clin[doc,d]=zz    /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz  ) 
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1424  /\  CST[doc,d]=zz )  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al     /\  CST[doc,d]=zz )  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  
             

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             
             endif);
                           
%RM
constraint forall(doc in { RM },d in days)
           
             (if      RON[doc,d] = c then  (Clin[doc,d]=zz    /\ CST[doc,d]=c818)
           
             elseif   RON[doc,d] = s  then (Clin[doc,d]= s818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = a  then (Clin[doc,d]= a818 /\ CST[doc,d]=zz  ) 
             
             elseif   RON[doc,d] = i  then (Clin[doc,d]= i818 /\ CST[doc,d]=zz  )
             
             elseif   RON[doc,d] = p then (Clin[doc,d]=p1624  /\  CST[doc,d]=c1416 )  
             
%             elseif   RON[doc,d] = l then (Clin[doc,d]=al     /\  CST[doc,d]=zz )  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 41) then (Clin[doc,d]=al  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 42) then (Clin[doc,d]=cl  /\  CST[doc,d]=zz)  

             elseif   (RON[doc,d] = l /\ REQUESTS[doc,d] = 43) then (Clin[doc,d]=lsl  /\  CST[doc,d]=zz)  
             

             else     (Clin[doc,d]= zz /\ CST[doc,d]=zz)
             
             endif);

%GN  from here for annual leave conf leave and lsl 
constraint forall(doc = GN ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
               

             elseif   ron(doc,d,p) /\ d mod 7 = monday                then  c_cs(doc,d,p1624,c1416)  
             elseif   ron(doc,d,p) /\ d mod 7 = wednesday             then  c_cs(doc,d,p1323,c1113)  
             elseif   ron(doc,d,p) /\ d mod 7 = saturday              then  c_cs(doc,d,p1624,zz)  


             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);

%EW
constraint forall(doc = EW ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,c1216) 
               

             elseif   ron(doc,d,p) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,a) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,a818,zz)  

             elseif   ron(doc,d,s) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,s818,zz)  

             elseif   ron(doc,d,i) /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,i818,zz)  
                          
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,c1718)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,c1718) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,c1718)
             
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  44  then c_cs(doc,d,patl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);







%LB

constraint forall(doc = LB , d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,c818) 
               
             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
              elseif   ((RON[doc,d] = a) /\ d in wednesdays)  then c_cs(doc,d,a814,c1418) 

             elseif   RON[doc,d] = a  then c_cs(doc,d,a818,zz) 
             
             elseif   RON[doc,d] = i  then c_cs(doc,d,i818,zz)
             
             elseif   RON[doc,d] = p /\ d mod 7 in {saturday,sunday} then c_cs(doc,d,p1624,zz)  

             elseif   RON[doc,d] = p then c_cs(doc,d,p1624,c1416)  
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);

%%FIX HERE
constraint forall(doc = DH ,d in days)
           
             (if      ron(doc,d,c)    then  c_cs(doc,d,zz,c818)
               
             
             elseif   RON[doc,d] = s  then c_cs(doc,d,s818,zz)
            
             elseif   RON[doc,d] = a  then c_cs(doc,d,a818,zz) 
             
             elseif   RON[doc,d] = i  then c_cs(doc,s,i818,zz)
             
             elseif   ((RON[doc,d] = p) /\ d mod 7 in {saturday,sunday})  then c_cs(doc,d,p1724,zz)  
             
             elseif   RON[doc,d] = p  /\ d mod 7 in {friday, monday} then c_cs(doc,d,p1424,zz)  %monday friday pms if not saturday sunday pm

             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
   

%SK
constraint forall(doc = SK ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,c1116) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )     %annual
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )     % conference
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )    % LSL
            elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=   45  then c_cs(doc,d,matl,zz )    % mat leave

             else     c_cs(doc,d,zz,zz)
             
             endif);

%BL
constraint forall(doc = BL ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   (ron(doc,d,p) /\ p mod 7 = thursday) then c_cs(doc,d,p1624,c1416)  

             elseif   (ron(doc,d,p) /\ p mod 7 = sunday ) then c_cs(doc,d,p1624,zz)  %sunday pms 

             elseif   (ron(doc,d,p) /\ p mod 7 = friday ) then c_cs(doc,d,p1624,zz)  %sunday pms 

                          elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);

%RP
%RP
constraint forall(doc = RP ,d in days)
           
             (if      ron(doc,d,c) /\ d mod 7 = friday then  c_cs(doc,d,zz,c1216) 
             
             elseif   ron(doc,d,p) /\ d mod  7 = thursday then c_cs(doc,d,p1624,c1215)  

             elseif   ron(doc,d,p) /\ d mod  7 = sunday then c_cs(doc,d,p1624,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                  
                                    
                                                                        
constraint forall(doc = AR ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                                      
                                                                                                      
constraint forall(doc = LS ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                                 
                                                
constraint forall(doc = AV ,d in days)
           
             (if      ron(doc,d,c) /\ d mod 7 = wednesday  then  c_cs(doc,d,zz,c818) 
             
             elseif   ron(doc,d,c) /\ d mod 7 != wednesday  then c_cs(doc,d,zz,c1215)  

             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  


             elseif   ron(doc,d,s)  then c_cs(doc,d,s817,c1718)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a817,c1718) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i817,c1718)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                                 

constraint forall(doc = LC ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);
                    
constraint forall(doc = KM ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,s816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                      
                                                                                                                                                            

constraint forall(doc = DZ ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a81730,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
constraint forall(doc = BB ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a1020,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
constraint forall(doc = CP ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a1217,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          
             
constraint forall(doc = JD ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,zz,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,zz,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a918,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,zz,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          

constraint forall(doc = CK ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   (ron(doc,d,p) /\ d mod 7 = friday) then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,p) then c_cs(doc,d,p1424,zz)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s818,zz)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a818,zz) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i818,zz)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          

constraint forall(doc = NM ,d in days)
           
             (if      ron(doc,d,c) then  c_cs(doc,d,zz,zz) 
             
             elseif   ron(doc,d,p) then c_cs(doc,d,p1624,c1416)  

             elseif   ron(doc,d,s)  then c_cs(doc,d,s816,c1618)
            
             elseif   ron(doc,d,a)  then c_cs(doc,d,a816,c1618) 
             
             elseif   ron(doc,d,i)  then c_cs(doc,d,i816,c1618)
             
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  41  then c_cs(doc,d,al,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  42  then c_cs(doc,d,cl,zz )  
             elseif   ron(doc,d,l) /\ REQUESTS[doc,d]=  43  then c_cs(doc,d,lsl,zz )  

             else     c_cs(doc,d,zz,zz)
             
             endif);                                                                                                                                                                                                                                          


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                      
output["\n"];
output["\n"];

                                                      
%%%% empnum date area shift role start finish hours oncall1 oncall2 RNspace11N                                                                                                            
                                                                                                                                                                  
                                                                                                                                                                                                                        
                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                                                                          
%output [show(fix(get_empnum(doc))) ++ " " ++ show(day) ++ " " ++ show(doc) ++ " " ++ show(area) ++ " " ++ show(Clin[doc,day]) ++ " " ++ show(CST[doc,day]) ++ "\n" 

%        |doc in {RG,GM,DB,SD,RM,EW,LB}, day in days];
 




output["\n"];
output["\n"];
output["\n"];

/*
output [if fix(Clin[doc,day] != zz) then show(emp_num[doc]) ++ " " ++ show(day) ++ " " ++ show(doc) ++ " " ++ show(area) ++ " " ++ show(Clin[doc,day]) ++ " " ++ show(CST[doc,day]) ++ "\n" else "" endif

        |doc in {RG,GM,DB,SD,RM,EW,LB}, day in days];

*/


%%THIS WORKS TO DUMP ONCALL 

output["\n"];


output["\n"];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% empnum date area shift role start finish hours oncall1 oncall2 RNspace11N                                                                                                            


output["FINALISED ROSTERON OUTPUT GM FT PT ONCALL\n\n\n"];


%%RG separate area unfortunately
                                     
                                                                         
output [if fix(Clin[doc,day]) != zz then 
                                   show(fix(get_empnum(doc)))       ++ sep ++ 
                                   show(get_day(day))               ++ sep ++ 
                                   get_area(doc)                    ++ sep ++

                                   get_desc (fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_role(doc)                    ++ sep  ++ 
                                   get_start(fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_fin(  fix(Clin[doc,day]))    ++ sep  ++ 
                                   get_hrs(  fix(Clin[doc,day]))    ++ sep  ++ 
                                   
                                     dag_end ++ "\n" 

       else "" endif |doc in docs, day in days];

output [if fix(CST[doc,day]) != zz then show(fix(get_empnum(doc))) ++ sep 
                                ++ show(get_day(day)) ++ sep ++
                                get_area(doc) ++ sep  ++

                                get_desc (fix(CST[doc,day]))   ++ sep ++ get_role(doc) ++ sep ++ 
                                get_start(fix(CST[doc,day]))   ++ sep ++ 
                                get_fin  (fix(CST[doc,day]))   ++ sep ++ 
                                get_hrs( fix(CST[doc,day]))    ++ sep ++ 
                               
                                dag_end ++ "\n" 

       else "" endif |doc in docs, day in days];

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            %%ONCALL 
%output[show(emp_num[docs[display_oncall[day]]]) ++ " " ++ show(day) ++ " " ++ show(docs[display_oncall[day]]) ++ " " ++ show(area) ++ "\n" | day in days]; 

%%oncall using doc_get_empnum

                        
output[show(get_empnum(fix(display_oncall[day])))     ++ sep ++ 
            get_day(day)                              ++ sep ++ 
            area                                      ++ sep ++ 
            oncall_shift                              ++ sep ++ 
            show(get_role(fix(display_oncall[day])))  ++ sep ++  
            "00:00"                                   ++ sep ++ 
            "00:00"                                   ++ sep ++ 
            "00:00"                                   ++ sep ++ 
            on_call_dag_end ++ "\n" 
            
            | day in days]; 




output[show(doc)   ++ 
			" we am: " ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {saturday,sunday}],a)))         ++

                   " we pm  "  ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {saturday,sunday}],p)))         ++

	           " fri pm  "  ++ show(fix(count([roster[doc,d]| d in days where d mod 7 in {friday}],p)))         ++
                    
                    
                    " oncall:" ++ show(fix(count(oncall[doc,..],1)))  ++ "\n" | doc in docs];
                    
%%ONE WEEK AT TIME  ONCALL AT TOP   WITH CLINICAL THEN CLINICAL SUPPORT 

output[ show(roster[display_oncall[day],day])  ++ " " ++ "dr is " ++ show(display_oncall[day]) ++ "  " ++ show(get_empnum((fix(display_oncall[day])))) ++ " "  ++ get_day(day) ++ "\n" | day in days];



output["\n\nWEEK 1\n"];
output["     "];output[get_day(day) ++ "      \t    " | day in wk1];output["\n"];
output["=================================================================================================================================================================\n"];
output["\t"];output[show(display_oncall[day])   ++ "\t||\t" | day in wk1  ];output["ONCALL-SMSPT->OC cat 2 \n"];
output["=================================================================================================================================================================\n"];
output[" \tMo\t||\t Tu\t||\t We\t||\t Th\t||\t Fr\t||\t Sa\t||\t Su\t||\t\n"];
output["==================================================================================================================================================================\n"];
output[show(Clin[doc,day]) ++ "\t|" ++ show(CST[doc,day]) ++ "\t||" ++ if day mod 7 = sunday then show(doc) ++ " " ++ get_role(doc) ++ "\n" else "" endif | doc in docs, day in wk1 ];
output["==================================================================================================================================================================\n"];


output["\n\nWEEK 2\n"];
output["     "];output[get_day(day) ++ "       \t    " | day in wk2];output["\n"];
output["=================================================================================================================================================================\n"];
output["\t"];output[show(display_oncall[day])   ++ "\t||\t" | day in wk2  ];output["ONCALL-SMSPT->OC cat 2 \n"];
output["=================================================================================================================================================================\n"];
output[" \tMo\t||\t Tu\t||\t We\t||\t Th\t||\t Fr\t||\t Sa\t||\t Su\t||\t\n"];
output["==================================================================================================================================================================\n"];
output[show(Clin[doc,day]) ++ "\t|" ++ show(CST[doc,day]) ++ "\t||" ++ if day mod 7 = sunday then show(doc) ++ " " ++ get_role(doc) ++ "\n" else "" endif | doc in docs, day in wk2 ];
output["==================================================================================================================================================================\n"];

output[if shift !=zz then show(shift) ++ "\t" ++ get_desc(shift) ++ "\t" ++ get_start(shift) ++ " \t" ++ get_fin(shift) ++ " \t" ++ get_hrs(shift) ++ "\n"  else "" endif | shift in shifts2];
