*************************************************
*-- Programa: OPFAB.PRG
*-- Fecha   : 07/04/91 06:22pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ORDENES DE FABRICACION
*************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF !USED("FAX")
   =MEN_LIN(ABA+"Ordenes de "+favri)
   =GETDBF('ORFABDAT',"NUMERO","FAX",9)
ENDIF
RETURN MEN_LIN(BOTOM)
