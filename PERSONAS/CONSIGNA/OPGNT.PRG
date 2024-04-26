***********************************************
*-- Programa: OPgnt.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE consignatarios
***********************************************
IF ESOPEN("Consignatarios",21,"PER")
   USE (PATHPRO+'\PERSONAS') ORDER TAG GNTTEX ALIAS PER
ELSE
   SET ORDER TO TAG GNTTEX
ENDIF
IF GNTPOP
   =DEFPOPER()
ENDIF
RETURN MEN_LIN(BOTOM)
