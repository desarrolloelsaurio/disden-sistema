*******************************************
*-- Programa: ELIAGE.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : ELIGE EL AGEICO
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
*-- Modif.  : GOYO 06-07-93 01:21pm ELIMAR
*******************************************
FUNCTION ELIAGE
PARA MSG,R1,C1
SELE PER
IF AGEPOP
   SET ORDER TO TAG AGENDA
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIPER1('APELLIDO '+MSG,'PER','AGECOD',10,"A")
ENDIF
RETURN IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
