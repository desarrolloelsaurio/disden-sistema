**********************************************
*-- Programa: OPDNI
*-- Fecha   : 11-21-91 11:21am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE TIPO DE DOCUMENTO
************************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

IF USED("MIX")
   SELE MIX
   SET ORDER TO TAG DNITEX
ELSE
   =MEN_LIN(ABA+"Tipo de Documento")
   SELE 1
   =GETDBF('MIXTA','DNITEX','MIX')
ENDIF
RETURN IIF(DNIPOP,DEFPOMIX(DNIPOPR,DNIPOPC),.T.) .AND. MEN_LIN(BOTOM)
