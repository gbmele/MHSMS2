%%one off requests.

constraint assign_shifts(AR,saturday,a,3);






array[ docs,1..DAYS] of var int:  REQUESTS = array2d(docs,1..DAYS,[

 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7  RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 RG
 41, 41, 41, 41, 0 , 0 , 0 ,% day 28 RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 RG   
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 RG
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 RG
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7  GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 GM
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 56 GM
 41, 41, 41, 41, 0 , 0 , 0 ,% day 63 GM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 GM
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7  DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 DB
 41, 41, 41, 41, 0 , 0 , 0 ,% day 28 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 DB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 DB
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7  CC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 CC
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 21 CC
 41, 41, 41, 41, 99, 99, 99,% day 28 CC
 91, 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 CC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 CC
 0 , 0 , 0 , 0 , 92, 99, 0 ,% day 49 CC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 CC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 CC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 CC
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7  MC
 43, 43, 43, 43, 0 , 0 , 0 ,% day 14 MC
 43, 43, 43, 43, 0 , 0 , 0 ,% day 21 MC
 43, 43, 43, 43, 0 , 0 , 0 ,% day 28 MC
 0 , 0 , 0 , 0 , 0 , 92, 0 ,% day 35 MC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 MC
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 49 MC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 MC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 MC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 MC
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7  SD
 41, 41, 41, 41, 0 , 0 , 0 ,% day 14 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 SD
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 SD
 
 0 , 0 , 0 , 0 , 99, 99, 0 ,% day 7  ML
 0 , 0 , 41, 0 , 99, 99, 0 ,% day 14 ML
 0 , 0 , 41, 0 , 99, 99, 0 ,% day 21 ML
 0 , 0 , 0 , 0 , 99, 99, 0 ,% day 28 ML
 0 , 0 , 0 , 0 , 99, 99, 0 ,% day 35 ML
 0 , 0 , 41, 0 , 99, 99, 0 ,% day 42 ML
 0 , 0 , 41, 0 , 99, 99, 0 ,% day 49 ML
 0 , 0 , 0 , 0 , 99, 99, 0 ,% day 56 ML
 0 , 0 , 0 , 0 , 99, 99, 0 ,% day 63 ML
 0 , 0 , 0 , 0 , 99, 99, 0 ,% day 70 ML
 
 41, 41, 41, 41, 99, 99, 99,% day 7  HL
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 HL
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 HL
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 28 HL
 
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 35 HL
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 42 HL
 
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 49 HL
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 HL
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 HL
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 70 HL
 
 0 , 2 , 0 , 0 , 1 , 99, 99,% day 7  DL
 41, 41, 41, 41, 0 , 0 , 0 ,% day 14 DL
 99, 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 DL
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 DL
 0 , 0 , 0 , 99, 1 , 99, 99,% day 35 DL
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 DL
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 DL
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 56 DL
 41, 41, 41, 41, 99, 99, 99,% day 63 DL
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 DL
 
 41, 41, 0 , 0 , 0 , 0 , 0 ,% day 7  RM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 RM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 RM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 RM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 RM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 RM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 RM
 0 , 0 , 0 , 0 , 99, 99, 99,% day 56 RM
 41, 41, 41, 41, 99, 99, 99,% day 63 RM
 41, 41, 41, 41, 0 , 0 , 0 ,% day 70 RM
 
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 7 GN
 0 , 0 , 0 , 43, 0 , 41, 0 ,% day 14 GN
 41, 0 , 41, 43, 0 , 0 , 0 ,% day 21 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 28 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 35 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 42 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 49 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 56 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 63 GN
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 70 GN
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 EW
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 EW
 
 0 , 0 , 0 , 0 , 0 , 99, 0 ,% day 7 LB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 LB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 LB
 0 , 0 , 0 , 0 , 0 , 99, 99,% day 28 LB
 41, 0 , 41, 0 , 41, 99, 99,% day 35 LB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 LB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 LB
 0 , 0 , 42, 0 , 42, 0 , 0 ,% day 56 LB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 LB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 LB
 
 0 , 0 , 0 , 0 , 0 , 91, 0 ,% day 7 DH
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 DH
 0 , 0 , 0 , 0 , 41, 0 , 0 ,% day 21 DH
 41, 0 , 41, 0 , 41, 99, 0 ,% day 28 DH
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 DH
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 DH
 0 , 0 , 0 , 0 , 0 , 99, 0 ,% day 49 DH
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 DH
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 DH
 0 , 0 , 0 , 0 , 0 , 99, 0 ,% day 70 DH
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 SK
 42, 42, 0 , 0 , 0 , 0 , 0 ,% day 28 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 SK
 41, 41, 0 , 0 , 0 , 0 , 0 ,% day 49 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 SK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 SK
 
 0 , 0 , 0 , 2 , 0 , 0 , 99,% day 7 BL
 0 , 0 , 0 , 99, 0 , 0 , 2 ,% day 14 BL
 0 , 0 , 0 , 3 , 0 , 0 , 2 ,% day 21 BL
 0 , 0 , 1 , 1 , 2 , 0 , 2 ,% day 28 BL
 0 , 0 , 1 , 2 , 0 , 0 , 0 ,% day 35 BL
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 42 BL
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 49 BL
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 56 BL
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 63 BL
 0 , 0 , 0 , 43, 0 , 0 , 0 ,% day 70 BL
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 CP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 CP
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 RP
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 RP
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 AR
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 AR
 0 , 0 , 0 , 0 , 0 , 1 , 0 ,% day 21 AR
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 AR
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 AR
 0 , 0 , 0 , 0 , 0 , 1 , 0 ,% day 42 AR
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 AR
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 AR
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 AR
 0 , 0 , 0 , 0 , 0 , 1 , 0 ,% day 70 AR
 
 1 , 0 , 2 , 0 , 2 , 2 , 0 ,% day 7 LS
 0 , 0 , 2 , 0 , 0 , 0 , 0 ,% day 14 LS
 99, 1 , 0 , 0 , 1 , 1 , 1 ,% day 21 LS
 0 , 0 , 2 , 0 , 0 , 0 , 0 ,% day 28 LS
 1 , 0 , 2 , 0 , 2 , 2 , 0 ,% day 35 LS
 0 , 0 , 2 , 0 , 0 , 0 , 0 ,% day 42 LS
 1 , 0 , 0 , 0 , 1 , 1 , 1 ,% day 49 LS
 0 , 0 , 2 , 0 , 0 , 0 , 0 ,% day 56 LS
 1 , 1 , 2 , 2 , 99, 99, 99,% day 63 LS
 0 , 0 , 2 , 0 , 0 , 0 , 0 ,% day 70 LS
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 AV
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 AV
 
 0 , 0 , 0 , 0 , 0 , 1 , 1,% day 7 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 LC
 0 , 41, 0 , 41, 0 , 0 , 0 ,% day 63 LC
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 LC
 
 41, 0 , 0 , 0 , 0 , 0 , 2 ,% day 7 KM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 KM
 41, 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 KM
 1 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 KM
 1 , 0 , 0 , 0 , 0 , 0 , 1 ,% day 35 KM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 KM
 2 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 KM
 1 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 KM
 1 , 0 , 0 , 0 , 0 , 0 , 2 ,% day 63 KM
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 KM

 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 1 ,% day 14 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 1 ,% day 28 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 1 ,% day 42 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 1 ,% day 56 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 DZ
 0 , 0 , 0 , 0 , 0 , 0 , 1 ,% day 70 DZ
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 BB
 0 , 41, 41, 0 , 0 , 0 , 0 ,% day 35 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 BB
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 70 BB
 
 77, 0 , 1 , 0 , 0 , 0 , 0 ,% day 7 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 14 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 21 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 28 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 35 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 42 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 49 JD
 0 , 0 , 42, 0 , 0 , 0 , 0 ,% day 56 JD
 0 , 0 , 1 , 0 , 0 , 0 , 0 ,% day 63 JD
 0 , 0 , 1 , 0 , 0 , 0 , 77,% day 70 JD
 
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 7 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 14 Ck
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 21 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 28 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 35 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 42 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 49 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 56 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0 ,% day 63 CK
 0 , 0 , 0 , 0 , 0 , 0 , 0,% day 70 CK
]); %end of REQUESTS ARRAY





%%%ALL OF LS AND KM ROSTER IS IN THE REQUESTS

constraint forall (doc in {LS,KM}, day in 1..DAYS)
          (if REQUESTS[doc,day]=0 then roster[doc,day]=o else true endif);


%%docs   =              {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,KM,DZ,BB,JD,CK}; 
set of docs: tempdocs = {RG,GM,DB,CC,MC,SD,ML,HL,DL,RM,GN,EW,LB,DH,SK,BL,CP,RP,AR,LS,AV,LC,KM,DZ,BB,JD,CK};% EWLS,AV,LC,KM,DZ,BB,JD};

constraint forall(doc in tempdocs, day in 1..DAYS)
(  if    REQUESTS[ doc, day ] = 99  then roster[ doc, day ]   =  o
  elseif REQUESTS[ doc, day ] = 41  then roster[ doc, day ]   =  l % AL
  elseif REQUESTS[ doc, day ] = 42   then roster[ doc, day ]   =  l % CONF
  elseif REQUESTS[ doc, day ] = 43   then roster[ doc, day ]   =  l % LSL
  elseif REQUESTS[ doc, day ] = 44   then roster[ doc, day ]   =  l % PAT
  elseif REQUESTS[ doc, day ] = 4   then roster[ doc, day ]   =   c % csupport
  elseif REQUESTS[ doc, day ] = 1   then roster[ doc, day ]   =  a
  elseif REQUESTS[ doc, day ] = 2   then roster[ doc, day ]   =  p
  elseif REQUESTS[ doc, day ] = 3   then (roster[ doc, day ]   =  p \/ roster[doc,day]= a)
  elseif REQUESTS[ doc, day ] = 91  then roster[ doc, day ]  !=  a
  elseif REQUESTS[ doc, day ] = 92  then roster[ doc, day ]  !=  p
  elseif REQUESTS[ doc, day ] = 99  then roster[ doc, day ]   =  o
  
  
  else true
  endif);

 
constraint count(roster[RG,..],l)=4;

constraint count(roster[GM,..],l)=4;

constraint count(roster[DB,..],l)=4;

constraint count(roster[CC,..],l)=4;

constraint count(roster[MC,..],l)=12;

constraint count(roster[SD,..],l)=4;

constraint count(roster[ML,..],l)=4;

constraint count(roster[HL,..],l)=4;

constraint count(roster[DL,..],l)=8;

constraint count(roster[RM,..],l)=10;

constraint count(roster[GN,..],l)=13;

constraint count(roster[EW,..],l)=0;

constraint count(roster[LB,..],l)=5;
constraint count(roster[DH,..],l)=4;


constraint count(roster[SK,..],l)=4;

constraint count(roster[BL,..],l)=5;

constraint count(roster[CP,..],l)=0;
constraint count(roster[RP,..],l)=0;

constraint count(roster[AR,..],l)=0;

constraint count(roster[LS,..],l)=0;

constraint count(roster[AV,..],l)=0;
constraint count(roster[LC,..],l)=2;
constraint count(roster[KM,..],l)=2;

constraint count(roster[DZ,..],l)=0;
constraint count(roster[BB,..],l)=2;
constraint count(roster[JD,..],l)=1;
constraint count(roster[CK,..],l)=0;




/*
constraint trace("\nRGLEAVE...",true);

constraint leave_weeks2(RG,[],rg_shifts);

constraint leave_weeks2(GM,[3],gm_shifts);

constraint leave_weeks2(GM,[],gm_shifts);0

constraint leave_weeks2(DB,[],db_shifts);

constraint leave_weeks2(CC,[],db_shifts);

constraint leave_weeks2(MC,[],mc_shifts);

constraint leave_weeks2(SD,[],sd_shifts);

constraint leave_weeks(ML,[],ml_shifts);

constraint leave_weeks2(HL,[],hl_shifts) /\ sat_sun_off_prior(HL,[]);

constraint leave_weeks2(DL,[],dl_shifts);


constraint leave_weeks2(RM,[],rm_shifts);

                                                                                                                                      
constraint leave_weeks(GN,[],gn_shifts,10)  /\ sat_sun_off_prior(GN,[]) /\ global_cardinality([roster[GN,d] | d in thursdays],[l],[10]);


constraint leave_weeks2(EW,[],ew_shifts);

constraint leave_weeks(LB,[week5],lb_shifts) /\ sat_sun_off_prior(LB,[]);


constraint leave_weeks(DH,[],dl_shifts);

constraint leave_weeks(SK,[week4,week7],sk_shifts)  /\ sat_sun_off_prior(SK,[]);

constraint leave_weeks(BL,[],bl_shifts)  /\ sat_sun_off_prior(BL,[]);
        
constraint leave_weeks(CP,[],cp_shifts)  /\ sat_sun_off_prior(CP,[]);
                
constraint leave_weeks(RP,[],rp_shifts)  /\ sat_sun_off_prior(RP,[]);

constraint leave_weeks(AR,[],ar_shifts)  /\ sat_sun_off_prior(AR,[]);
        
constraint leave_weeks(LS,[],ls_shifts)  /\ sat_sun_off_prior(LS,[]);
        
constraint leave_weeks(AV,[],av_shifts)  /\ sat_sun_off_prior(AV,[]);
                                
constraint leave_weeks(LC,[],lc_shifts)  /\ sat_sun_off_prior(LC,[]);
                                                                
constraint leave_weeks(KM,[],km_shifts)  /\ sat_sun_off_prior(KM,[]);
     
constraint leave_weeks(DZ,[],km_shifts)  /\ sat_sun_off_prior(DZ,[]);


constraint leave_weeks(BB,[week5],bb_shifts)  /\ sat_sun_off_prior(BB,[]);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
constraint leave_weeks(JD,[],bb_shifts)  /\ sat_sun_off_prior(JD,[]);
*/        


/*

constraint count(roster[DH,..],l)=6;
constraint count(roster[BL,..],l)=4;
constraint count(roster[CP,..],l)=0;
constraint count(roster[RP,..],l)=0;
constraint count(roster[AR,..],l)=0;
constraint count(roster[LS,..],l)=0;
constraint count(roster[AV,..],l)=0;
constraint count(roster[LC,..],l)=0;
constraint count(roster[KM,..],l)=2;
constraint count(roster[DZ,..],l)=0;
constraint count(roster[BB,..],l)=2;
constraint count(roster[JD,..],l)=0;

*/

function string: get_day(days: d) = 
    if d = 1    then "26/12/2022"
    elseif d= 2 then "27/12/2022" 
    elseif d= 3 then "28/12/2022" 
    elseif d= 4 then "29/12/2022" 
    elseif d= 5 then "30/12/2022" 
    elseif d= 6 then "31/12/2022" 
    elseif d= 7 then "01/01/2023" 
    elseif d= 8 then "02/01/2023" 
    elseif d= 9 then "03/01/2023" 
    elseif d= 10 then "04/01/2023" 
    elseif d= 11 then "05/01/2023" 
    elseif d= 12 then "06/01/2023" 
    elseif d= 13 then "07/01/2023" 
    elseif d= 14 then "08/01/2023" 
    elseif d= 15 then "09/01/2023" 
    elseif d= 16 then "10/01/2023" 
    elseif d= 17 then "11/01/2023" 
    elseif d= 18 then "12/01/2023" 
    elseif d= 19 then "13/01/2023" 
    elseif d= 20 then "14/01/2023" 
    elseif d= 21 then "15/01/2023" 
    elseif d= 22 then "16/01/2023" 
    elseif d= 23 then "17/01/2023" 
    elseif d= 24 then "18/01/2023" 
    elseif d= 25 then "19/01/2023" 
    elseif d= 26 then "20/01/2023" 
    elseif d= 27 then "21/01/2023" 
    elseif d= 28 then "22/01/2023" 
    elseif d= 29 then "23/01/2023" 
    elseif d= 30 then "24/01/2023" 
    elseif d= 31 then "25/01/2023" 
    elseif d= 32 then "26/01/2023" 
    elseif d= 33 then "27/01/2023" 
    elseif d= 34 then "28/01/2023" 
    elseif d= 35 then "29/01/2023" 
    elseif d= 36 then "30/01/2023" 
    elseif d= 37 then "31/01/2023" 
    elseif d= 38 then "01/02/2023" 
    elseif d= 39 then "02/02/2023" 
    elseif d= 40 then "03/02/2023" 
    elseif d= 41 then "04/02/2023" 
    elseif d= 42 then "05/02/2023" 
    elseif d= 43 then "06/02/2023" 
    elseif d= 44 then "07/02/2023" 
    elseif d= 45 then "08/02/2023" 
    elseif d= 46 then "09/02/2023" 
    elseif d= 47 then "10/02/2023" 
    elseif d= 48 then "11/02/2023" 
    elseif d= 49 then "12/02/2023" 
    elseif d= 50 then "13/02/2023" 
    elseif d= 51 then "14/02/2023" 
    elseif d= 52 then "15/02/2023" 
    elseif d= 53 then "16/02/2023" 
    elseif d= 54 then "17/02/2023" 
    elseif d= 55 then "18/02/2023" 
    elseif d= 56 then "19/02/2023" 
    elseif d= 57 then "20/02/2023" 
    elseif d= 58 then "21/02/2023" 
    elseif d= 59 then "22/02/2023" 
    elseif d= 60 then "23/02/2023" 
    elseif d= 61 then "24/02/2023" 
    elseif d= 62 then "25/02/2023" 
    elseif d= 63 then "26/02/2023" 
    elseif d= 64 then "27/02/2023" 
    elseif d= 65 then "28/02/2023" 
    elseif d= 66 then "01/03/2023" 
    elseif d= 67 then "02/03/2023" 
    elseif d= 68 then "03/03/2023" 
    elseif d= 69 then "04/03/2023" 
    elseif d= 70 then "05/03/2023" 
 else "nuffin"
 endif; % end of the big if


