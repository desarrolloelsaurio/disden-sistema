* ษอออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : OPPRS.PRG                 บ
* บ COMENTARIO    : ABRE BASE DE PRESUPUESTO  บ
* ศอออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE BOTOM "  "+REPL("ฐ",78)                  && BOTOM
#DEFINE ABA   "Abriendo Base de "                && ABA
PARAMETER O_REOP,O_EXCL
=IIF(O_REOP,REOPXXX("PRS"),.T.)
=IIF(O_EXCL,CLOSDBF("PRS"),.T.)
=MEN_LIN(ABA+"Presupuestos")
sele (sele(1))
=IIF(USED("PRS"),.T.,GETDBF('PRESUP',"NUMERO","PRS",sele(),O_EXCL))
SELE PRS
RETURN MEN_LIN(BOTOM)
