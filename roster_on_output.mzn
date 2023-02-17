%% MH ED SMS 
%enum docs   = {RG,GM,DB,CC,MC,SD,HL,ML,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,JK,TM,KM,DZ};


string: area = "12240-B0006-01" ;
string: sep  = "*";


string: rg_area = area;


function string: get_area(docs:doc) = 
      (if doc = RG then rg_area 
      else area
      endif);



string: rg_role = "12240-B0006-01-HOU";

string: gm_role = "12240-B0006-01-DIR";

string: FT_role = "12240-B0006-01-SMSFT";

string: PT_role = "12240-B0006-01-SMSPT";

string: sess_role = "12240-B0006-01-Ses";


string: from = "00:00";
string: to   = "00:00";
string: dag_end = join(sep,[from,to,"R","N"," "," "," ","N","N","N","N","N","N","N","N","N","N","N"]);

string: on_call_dag_end = join(sep,["23:59","07:59","R","N"," "," "," ","N","N","N","N","N","N","N","N","N","N","N"]);   %% dont know why the custom flag is "Y" three from the end but whatever!!!!!





%%annual leave code 10
%% conference leave =is    
%% Long Service Leave is ------

string: leave_shift  = "10";
string: leave_start  = "08:00";
string: leave_finish = "18:00";
string: leave_hours  = "10.00";  %%%FIX THIS 10:00 get translated to 0.416!!!! needs to be 10.00

string: cleave_shift  = "0634";
string: cleave_start  = "08:00";
string: cleave_finish = "18:00";
string: cleave_hours  = "10.00";  

string: lsleave_shift  = "LPPA";
string: lsleave_start  = "08:00";
string: lsleave_finish = "18:00";
string: lsleave_hours  = "10.00"; 

string: patleave_shift  = "0657";
string: patleave_start  = "08:00";
string: patleave_finish = "18:00";
string: patleave_hours  = "10.00"; 

string: matleave_shift  = "0667";
string: matleave_start  = "08:00";
string: matleave_finish = "18:00";
string: matleave_hours  = "10.00";  %%%FIX THIS 10:00 get translated to 0.416!!!! needs to be 10.00

string: personal_leave_shift  = "25";
string: personal_leave_start  = "08:00";
string: personal_leave_finish = "18:00";
string: personal_leave_hours  = "10.00";  %%%FIX THIS 10:00 get translated to 0.416!!!! needs to be 10.00


%%OnCall-12240-B0006-01

string: oncall_shift   = "OnCall-12240-B0006-01";
string: soncall_start  = "00:00";
string: soncall_finish = "00:00";
string: soncall_from   = "23:59";
string: soncall_to     = "07:59";
string: soncall_hrs    = "08.00";


string: c816_shift   =  "CST 0800-1600-12240-B0006-01";
string: c816_start   =  "08:00";
string: c816_finish  =  "16:00";
string: c816_hours   =  "8.00";


string: c817_shift   =  "CST 0800-1700-12240-B0006-01";
string: c817_start   =  "08:00";
string: c817_finish  =  "17:00";
string: c817_hours   =  "9.00";


string: c818_shift   =  "CST 0800-1800-12240-B0006-01";
string: c818_start   =  "08:00";
string: c818_finish  =  "18:00";
string: c818_hours   =  "10.00";

string: c819_shift   =  "CST 0800-1900-12240-B0006-01";
string: c819_start   =  "08:00";
string: c819_finish  =  "19:00";
string: c819_hours   =  "11.00";


string: c1416_shift   =  "CST 1400-1600-12240-B0006-01";
string: c1416_start   =  "14:00";
string: c1416_finish  =  "16:00";
string: c1416_hours   =  "2.00";

string: c1418_shift   =  "CST 1400-1800-12240-B0006-01";
string: c1418_start   =  "14:00";
string: c1418_finish  =  "18:00";
string: c1418_hours   =  "4.00";

string: c1618_shift   =  "CST 1600-1800-12240-B0006-01";
string: c1618_start   =  "16:00";
string: c1618_finish  =  "18:00";
string: c1618_hours   =  "2.00";


string: c1113_shift   =  "CST 1100-1300-12240-B0006-01";   %%GN
string: c1113_start   =  "11:00";
string: c1113_finish  =  "13:00";
string: c1113_hours   =  "2.00";
string: c1113_shift_d =  "CST 1100-1300";

string: c1116_shift   =  "CST 1100-1600-12240-B0006-01";  
string: c1116_start   =  "11:00";
string: c1116_finish  =  "16:00";
string: c1116_hours   =  "5.00";
string: c1116_shift_d =  "CST 1100-1600";

string: c1215_shift   =  "CST 1200-1500-12240-B0006-01";  
string: c1215_start   =  "12:00";
string: c1215_finish  =  "15:00";
string: c1215_hours   =  "3.00";
string: c1215_shift_d =  "CST 1200-1600";


string: c1216_shift   =  "CST 1200-1600-12240-B0006-01";  
string: c1216_start   =  "12:00";
string: c1216_finish  =  "16:00";
string: c1216_hours   =  "4.00";
string: c1216_shift_d =  "CST 1200-1600";




string: c1718_shift   =  "CST 1700-1800-12240-B0006-01";
string: c1718_start   =  "17:00";
string: c1718_finish  =  "18:00";
string: c1718_hours   =  "1.00";
string: c1718_shift_d =  "CST 1700-1800";


string: c1218_shift   =  "CST 1200-1800-SSU-12240-B0006-01";
string: c1218_start   =  "12:00";
string: c1218_finish  =  "18:00";
string: c1218_hours   =  "6.00";
string: c1218_shift_d =  "CST 1200-1800";



string: a812_shift    = "MH 0800-1200-12240-B0006-01";
string: a812_start    = "08:00";
string: a812_finish   = "12:00";
string: a812_hours    = "4.00"; 
string: a812_shift_d  = "MH 0800-1200";

string: i812_shift    = "MH 0800-1200-12240-IC-B0006-01";
string: i812_start    = "08:00";
string: i812_finish   = "12:00";
string: i812_hours    = "4.00"; 
string: i812_shift_d  = "MH 0800-1200 IC";

string: s812_shift    = "MH 0800-1200-12240-SSU-B0006-01";
string: s812_start    = "08:00";
string: s812_finish   = "12:00";
string: s812_hours    = "4.00"; 
string: s812_shift_d  = "MH 0800-1200 SSU";

string: a814_shift    = "MH 0800-1400 -12240-B0006-01";
string: a814_start    = "08:00";
string: a814_finish   = "14:00";
string: a814_hours    = "6.00"; 
string: a814_shift_d  = "MH 0800-1400";

string: i814_shift    = "MH 0800-1400-IC-12240-B0006-01";
string: i814_start    = "08:00";
string: i814_finish   = "14:00";
string: i814_hours    = "6.00"; 
string: i814_shift_d  = "MH 0800-1400 IC";

string: s814_shift    = "MH 0800-1400-SSU-12240-B0006-01";
string: s814_start    = "08:00";
string: s814_finish   = "14:00";
string: s814_hours    = "6.00"; 
string: s814_shift_d  = "MH 0800-1400 SSU";


string: a816_shift    = "MH 0800-1600-12240-B0006-01";
string: a816_start    = "08:00";
string: a816_finish   = "16:00";
string: a816_hours    = "8.00"; 
string: a816_shift_d  = "MH 0800-1600";

string: i816_shift    = "MH 0800-1600-IC-12240-B0006-01";
string: i816_start    = "08:00";
string: i816_finish   = "16:00";
string: i816_hours    = "8.00"; 
string: i816_shift_d  = "MH 0800-1600 IC";

string: s816_shift    = "MH 0800-1600-SSU-12240-B0006-01";
string: s816_start    = "08:00";
string: s816_finish   = "16:00";
string: s816_hours    = "8.00"; 
string: s816_shift_d  = "MH 0800-1600 SSU";




string: a818_shift    = "MH 0800-1800 -12240-B0006-01";
string: a818_start    = "08:00";
string: a818_finish   = "18:00";
string: a818_hours    = "10.00"; 
string: a818_shift_d  = "MH 0800-1800";

string: a1217_shift    = "MH 1200-1700 -12240-B0006-01";
string: a1217_start    = "12:00";
string: a1217_finish   = "17:00";
string: a1217_hours    = "5.00"; 
string: a1217_shift_d  = "MH 1200 -1700";



%" " ++ show(area) ++ " " ++ show(a818_shift_d) ++ " " ++ show(a818_start) ++ " " ++ show(a818_finish) ++ " " ++ show(a818_hours) ++ " " ++ "N" ++ " " ++ "N" ++ " " ++ "N"

%string: a818  = area ++ " " ++ a818_shift ++ " " ++ a818_start ++ " " ++ a818_finish ++ " " ++ a818_hours ++ " " ++ "N" ++ " " ++ "N" ++ " " ++ "N" ;

%%MH 0900-1800 -12240-B0006-01	12240-B0006-01	MH 0900-1800	MH 0900-1800	A		09:00	18:00	00:00	00:00	9.00000	N	N	1


string: a918_shift    = "MH 0900-1800 -12240-B0006-01";
string: a918_start    = "09:00";
string: a918_finish   = "18:00";
string: a918_hours    = "9.00"; 
string: a918_shift_d  = "MH 0900-1700";




string: a817_shift    = "MH 0800-1700 -12240-B0006-01";
string: a817_start    = "08:00";
string: a817_finish   = "17:00";
string: a817_hours    = "9.00"; 
string: a817_shift_d  = "MH 0800-1700";

string: a81730_shift    = "MH 0800-1730-12240-B0006-01";
string: a81730_start    = "08:00";
string: a81730_finish   = "17:30";
string: a81730_hours    = "9.50"; 
string: a81730_shift_d  = "MH 0800-1730";

string: a1020_shift    = "MH 1000-2000 -12240-B0006-01";
string: a1020_start    = "10:00";
string: a1020_finish   = "20:00";
string: a1020_hours    = "10.00"; 
string: a1020_shift_d  = "MH 1000-2000";



string: i818_shift    = "MH 0800-1800 IC-12240-B0006-01";
string: i818_start    = "08:00";
string: i818_finish   = "18:00";
string: i818_hours    = "10.00"; 
string: i818_shift_d  = "MH 0800-1800 IC";

string: i817_shift    = "MH 0800-1700 IC-12240-B0006-01";
string: i817_start    = "08:00";
string: i817_finish   = "17:00";
string: i817_hours    = "9.00"; 
string: i817_shift_d  = "MH 0800-1700 IC";

string: i81730_shift    = "MH 0800-1730-IC-12240-B0006-01";
string: i81730_start    = "08:00";
string: i81730_finish   = "17:30";
string: i81730_hours    = "9.50"; 
string: i81730_shift_d  = "MH 0800-1730 IC";

string: s81730_shift    = "MH 0800-1730-SSU-12240-B0006-01";
string: s81730_start    = "08:00";
string: s81730_finish   = "17:30";
string: s81730_hours    = "9.50"; 
string: s81730_shift_d  = "MH 0800-1730 SSU";

string: s818_shift    = "MH 0800-1800 SSU-12240-B0006-01";
string: s818_start    = "08:00";
string: s818_finish   = "18:00";
string: s818_hours    = "10.00"; 
string: s818_shift_d  = "MH 0800-1800 SSU";

string: s817_shift    = "MH 0800-1700 SSU-12240-B0006-01";
string: s817_start    = "08:00";
string: s817_finish   = "17:00";
string: s817_hours    = "9.00"; 
string: s817_shift_d  = "MH 0800-1800 SSU";

string: p1224_shift    = "MH 1200-2400 -12240-B0006-01";
string: p1224_start    = "12:00";
string: p1224_finish   = "24:00";
string: p1224_hours    = "12.00";
string: p1224_shift_d  = "MH 1200-2400";


string: p1724_shift    = "MH 1700-2400 -12240-B0006-01";
string: p1724_start    = "17:00";
string: p1724_finish   = "24:00";
string: p1724_hours    = "7.00";
string: p1724_shift_d  = "MH 1700-2400";


string: p1624_shift    = "MH 1600-2400 -12240-B0006-01";
string: p1624_start    = "16:00";
string: p1624_finish   = "24:00";
string: p1624_hours    = "8.00";
string: p1624_shift_d  = "MH 1600-2400";

string: p1524_shift    = "MH 1500-2400 -12240-B0006-01";
string: p1524_start    = "15:00";
string: p1524_finish   = "24:00";
string: p1524_hours    = "9.0";
string: p1524_shift_d  = "MH 1500-2400";

string: p1424_shift    = "MH 1400-2400 -12240-B0006-01";
string: p1424_start    = "14:00";
string: p1424_finish   = "24:00";
string: p1424_hours    = "10.00";
string: p1424_shift_d  = "MH 1400-2400";

string: p1323_shift    = "MH 1300-2300 -12240-B0006-01";
string: p1323_start    = "13:00";
string: p1323_finish   = "23:00";
string: p1323_hours    = "10.00";
string: p1323_shift_d  = "MH 1300-2400";

string: p1324_shift    = "MH 1300-2400-12240-B0006-01";
string: p1324_start    = "13:00";
string: p1324_finish   = "24:00";
string: p1324_hours    = "11.00";
string: p1324_shift_d  = "MH 1300-2400";

%string: oncall_shift    = "OnCall 0000-0800";
%string: oncall_start    = "00:00";
%string: oncall_finish   = "00:00";
%string: oncall_from    = "23:59";
%string: oncall_to      = "07:59";
%string: p1324_shift_d  = "oncall";




%


%output[show(emp_num[doc])++ " "   | doc in docs]