**************************************
*-- Programa: OPIVA.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO PROVINCIAS
**************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
    SELE MIX
	SET ORDER TO TAG IVATEX
ELSE
	=MEN_LIN(ABA+"Provincias")
	SELE 1
   =GETDBF('MIXTA','IVATEX','MIX')	
ENDIF
RETURN IIF(IVAPOP,DEFPOMIX(IVAPOPR,IVAPOPC),.T.) .AND. MEN_LIN(BOTOM)
