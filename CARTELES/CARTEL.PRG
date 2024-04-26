*****************************************
*-- Programa: CARTEL.PRG
*-- Fecha   : 06/29/91 09:41am
*-- Version : G. REINER
*-- Notas   : IMPRIME CARTEL INFORMATIVO
*****************************************
FUNCTION CARTEL
PARAMETER xt1,xt2,xt3,xt4
MXLEN=MAX(LEN(XT1),LEN(XT2),LEN(XT3),LEN(XT4))+4
STORE "" TO LAVENT
IF MXLEN>WCOLS() .OR. ("Wind" $ VERS())
   M.LAVENT=WONTOP()
   ACTI SCRE
ENDIF   
#IF "Wind" $ VERS()
LASALIDA=CARTELW(XT1,XT2,XT3,XT4)
#ELSE
LASALIDA=EFECT21(wlrow()+int((wrow()-2)/2),wlcol()+int((wcol()-mxlen)/2),PADC(XT1,MXLEN),PADC(XT2,MXLEN),PADC(XT3,MXLEN),PADC(XT4,MXLEN))
#ENDIF
IF !EMPTY(M.LAVENT)
   ACTI WIND (LAVENT)
ENDIF
RETURN LASALIDA