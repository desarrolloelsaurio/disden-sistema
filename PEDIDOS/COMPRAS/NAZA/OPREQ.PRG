****************************************
*-- Programa: OPREQ.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE ORDENES DE REQUERIMIENTO
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE ORQS "Ordenes de Requerimiento"        && ORQS

PARAMETER O_REOP,O_EXCL,O_Again
IF O_REOP
   =REOPXXX("REQ")
   =REOPXXX("REQX")
   =REOPXXX("RE1")
ELSE
   IF O_EXCL
      =CLOSDBF("REQ")
      =CLOSDBF("REQX")
      =CLOSDBF("RE1")
   ENDIF
ENDIF
=MEN_LIN(ABA+ORQS)
=IIF(USED("REQX"),.T.,GETDBF('REQUEDAT',.F.,"REQX",PRXAREA(.T.),O_EXCL))
=IIF(USED("RE1"),.T.,GETDBF('REQUEDA1',.F.,"RE1",PRXAREA(.T.),O_EXCL))
=IIF(USED("REQ"),.T.,GETDBF('REQUERIM',.F.,"REQ",PRXAREA(.T.),O_EXCL))
SELE REQ
RETURN MEN_LIN(BOTOM)
