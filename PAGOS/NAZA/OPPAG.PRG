****************************************
*-- Programa: OPPAG.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PAGOS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_REOP,O_EXCL
=IIF(O_REOP,REOPXXX("PAG"),.T.)
=IIF(O_EXCL,CLOSDBF("PAG"),.T.)
=MEN_LIN(ABA+"Pagos")
sele (sele(1))
=IIF(USED("PAG"),.T.,GETDBF('PAGOS',"FECHA","PAG",sele(),O_EXCL))
SELE PAG
RETURN MEN_LIN(BOTOM)
