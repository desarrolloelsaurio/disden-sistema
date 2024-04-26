**************************************
*-- Programa: OPCLQ.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CARGOS POR ALQUILER
**************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
    SELE MIX
	SET ORDER TO TAG CLQTEX
ELSE
	=MEN_LIN(ABA+"Cargos por Gesti¢n de Alquileres")
	SELE 1
   =GETDBF('MIXTA','CLQTEX','MIX')
ENDIF
RETURN IIF(CLQPOP,DEFPOMIX(CLQPOPR,CLQPOPC),.T.) .AND. MEN_LIN(BOTOM)
