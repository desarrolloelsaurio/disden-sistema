* 浜様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : OPPRS.PRG                 �
* � COMENTARIO    : ABRE BASE DE PRESUPUESTO  �
* 藩様様様様様様様様様様様様様様様様様様様様様�
#DEFINE BOTOM "  "+REPL("�",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
PARAMETER O_REOP,O_EXCL
=IIF(O_REOP,REOPXXX("PRS"),.T.)
=IIF(O_EXCL,CLOSDBF("PRS"),.T.)
=MEN_LIN(ABA+"Presupuestos")
sele (sele(1))
=IIF(USED("PRS"),.T.,GETDBF('PRESUP',"NUMERO","PRS",sele(),O_EXCL))
SELE PRS
RETURN MEN_LIN(BOTOM)
