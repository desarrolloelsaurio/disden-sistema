****************************************
*-- Programa: ELITMA.PRG
*-- Fecha   : 20/02/96 12:46
*-- Version : G. REINER -
*-- Notas   : ELIGE TELA MADRE
*-- Modificaci¢n GOYO 05-17-92 00:49am
*-- Modificaci¢n GOYO 08-15-93 02:36am
****************************************
#DEFINE NUL    0                                 && NUL

FUNCTION ELITMA
PARA MSG,R1,C1
SELE TMA
STORE NUL TO RESPUESTA
IF TMAPOP
   M.ANTORD=ORDER()
   SET ORDER TO TAG TELMADRE
   IF EOF()
      GO TOP
   ENDIF
   ACTI POPUP TMAPOP REST
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
   SET ORDER TO TAG (M.ANTORD)
ELSE
   RESPUESTA=ELIMIX1("Tela Madre "+MSG,'TMA','CODMADRE',10)
ENDIF
RETURN RESPUESTA
