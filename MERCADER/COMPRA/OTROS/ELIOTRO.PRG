****************************************
*-- Programa: ELIOTRO.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE OTROS
*-- Modificaci¢n GOYO 05-17-92 00:49am
*-- Modificaci¢n GOYO 08-15-93 02:36am
****************************************
#DEFINE NUL    0                                 && NUL
FUNCTION ELIOTRO
PARA MSG,R1,C1
=IIF(USED("OTRS"),.T.,OPOTRS())
SELE OTRS
store NUL to respuesta
IF OTRSPOP
   SET ORDER TO TAG OTRO
   IF EOF()
	  GO TOP
   ENDIF
   ACTI POPUP OTRSPOP REST
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Otro. Prod.'+MSG,'OTRS','OTRCODPRO',20)
ENDIF
RETURN respuesta
