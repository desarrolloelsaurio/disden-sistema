FUNCTION GETFEC
SELE MOV
SET ORDER TO
CALC MIN(FECHA) TO FECINI
FECINORI=FECINI
FE1=YEAR(FECINI)
FE2=STR(KPERIODO,2)+"/01/"+STR(IIF(KPERIODO<KPERINIC,FE1+1,FE1),4)
STORE CTOD(FE2) TO FECFIN,FECFINORI
RETURN
