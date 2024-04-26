*****************************************
*-- Programa: ELIFAB.PRG
*-- Fecha   : 06/28/91 08:08pm
*-- Version : G. REINER -
*-- Notas   : ELIGE ORDEN DE FABRICACION
*****************************************
#DEFINE NUL    0                                 && NUL

FUNCTION ELIFAB
PARA MSG,R1,C1
SELE FAB
STORE NUL TO RESPUESTA
IF R1=-1
   DO infic1 WITH 'INGRESE N§ ORDEN DE '+UPPER(favri)+" "+msg,15
   RESPUESTA=VAL(RESPUESTA)
ELSE
   @ r1,c1 GET respuesta PICTURE '9999999999'
   READ
ENDIF
STORE IIF(!EMPTY(RESPUESTA) .OR. LASTKEY()=27,IIF(SEEK(respuesta),RECNO(),NUL),NUL) TO M.RESPUESTA
IF respuesta#NUL
   GOTO RESPUESTA
ENDIF
RETURN respuesta
