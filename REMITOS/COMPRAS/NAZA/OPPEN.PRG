****************************************
*-- Programa: OPPEN.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE ORDENES DE REQUERIMIENTO
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_REOP,O_EXCL
IF USED("PEN")
   SELE PEN
   RETURN MEN_LIN(BOTOM)
ENDIF
=MEN_LIN(ABA+'Pendientes')
=GETDBF('PENDIENT',.F.,"PEN",SELE(1)) 
RETURN MEN_LIN(BOTOM)
