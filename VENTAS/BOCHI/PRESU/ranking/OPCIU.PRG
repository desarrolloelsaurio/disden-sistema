*************************************
*-- Programa: opciu.prg
*-- Fecha   : 06/12/91 01:50pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO CIUDADES
*************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
   SELE MIX
   SET ORDER TO TAG CIUTEX
ELSE
   =MEN_LIN(ABA+"Ciudades")
   SELE 1
   =GETDBF('MIXTA','CIUTEX',"MIX")
ENDIF
RETURN IIF(CIUPOP,DEFPOMIX(CIUPOPR,CIUPOPC),.T.) .AND. MEN_LIN(BOTOM)
