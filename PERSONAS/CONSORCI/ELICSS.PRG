********************************************************************************
*-- Programa: ELICSS.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : ELIGE EL CONSORCISTA
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
*-- Modif.  : GOYO 06-07-93 01:21pm ELIMAR
********************************************************************************
FUNCTION eliCSS
PARA msg,r1,c1
SELE PER
IF CSSpop
   set order to tag CONSORCI
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   ON KEY LABEL F3 return SEEKTECX(30,"PER","PER.CLIENTE","PER.CODCLI",ORDER("PER"),.F.,.F.,1,1,.t.)
   RESPUESTA=ELIMIX1('CONSORCISTA '+MSG,'PER','CSSCOD',10)
   ON KEY LABEL F3
ENDIF
RETURN respuesta
