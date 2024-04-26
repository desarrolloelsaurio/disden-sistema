****************************************
*-- Programa: ELIAVIS.PRG
*-- Fecha   : 05/26/91 09:26am
*-- Version : G. REINER -
*-- Notas   : ELIGE AVIOS
*-- Modificaci¢n GOYO 05-17-92 00:49am
*-- Modificaci¢n GOYO 08-15-93 02:36am
****************************************
#DEFINE NUL    0                                 && NUL
FUNCTION ELIAVIS
PARA msg,r1,c1
=IIF(USED("AVIS"),.T.,OPAVIS())
SELE AVIS
store NUL to respuesta
IF avipop
   M.ANTORD=ORDER()
   SET ORDER TO TAG AVIO
   IF EOF()
	  GO TOP
   ENDIF
   ACTI POPUP AVISpop REST
   STOR !EMPTY(respuesta) TO respuesta
   SET ORDER TO TAG (M.ANTORD)
ELSE
   RESPUESTA=ELIMIX1(ABIO+' '+MSG,'AVIS','AVICODPRO',20)
ENDIF
RETURN respuesta
