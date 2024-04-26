****************************************
*-- Programa: ELITELS.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE TELOS
*-- Modificaci¢n GOYO 05-17-92 00:49am
*-- Modificaci¢n GOYO 08-15-93 02:36am
****************************************
#DEFINE NUL    0                                 && NUL

FUNCTION ELITELS
PARA MSG,R1,C1
SELE TELS
STORE NUL TO RESPUESTA
IF TELPOP
   M.ANTORD=ORDER()
   SET ORDER TO TAG TELA
   IF EOF()
      GO TOP
   ENDIF
   ACTI POPUP TELSPOP REST
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
   SET ORDER TO TAG (M.ANTORD)
ELSE
   RESPUESTA=ELIMIX1(TELLA+' '+MSG,'TELS','TELCODPRO',20)
ENDIF
RETURN RESPUESTA
