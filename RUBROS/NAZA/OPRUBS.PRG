*************************************
*-- Programa: OPRUBS.PRG
*-- Fecha   : 01-21-93 04:53pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RUBROS
*************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

#IF "PRODU" $ CURDIR() .AND. "STOC" $ CURDIR()
   IF !USED("RUB")
   =PRXAREA(.T.)
   USE (PATHPRO+'\RUBROS') ORDER TAG RUBRO ALIAS RUB
   ENDIF
#ELSE
    IF ESOPEN("Rubros",16,"RUB")
  	   USE (PATHPRO+'\RUBROS') ORDER TAG RUBRO ALIAS RUB
    ENDIF
#ENDIF
SELE RUB

RETU IIF(RUBPOP,DEFPOGRL(RUBPOPR,RUBPOPC,"RUBPOP","RUB.RUBRO",30,'Elija el rubro'),.T.) .AND. ;
MEN_LIN(BOTOM)
