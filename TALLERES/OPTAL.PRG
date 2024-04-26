********************************************************************************
*-- Programa: OPTAL.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO TALLERES
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF !used("tal")
   =MEN_LIN(aba+"Talleres")
   =GETDBF('TALLERES',"TALLERES","TAL",19)
ENDIF
SELE TAL
RETURN IIF(TALPOP,DEFPOGRL(talpopr,talpopc,"talpop","tal.talleres",30,'Elija Taller'),RELEPOP("talpop")) .AND. ;
MEN_LIN(botom)
