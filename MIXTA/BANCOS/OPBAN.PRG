***********************************
*-- Programa: OPBAN.PRG
*-- Fecha   : 06/12/91 01:50pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO BANCOS
***********************************
PARAMETER SHIT
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF USED("MIX")
   SELE MIX
   SET ORDER TO TAG BANTEX
ELSE
	=MEN_LIN(ABA+"Bancos")
	SELE 1	
	=GETDBF('MIXTA','BANTEX','MIX')
ENDIF
RETURN IIF(BANPOP,DEFPOGRL(BANPOPR,BANPOPC,"BANPOP","PADR(ALLTRIM(MIX.TEXTO1)+' N§'+ALLTRIM(MIX.TEXTO2),40)",40),.T.) .AND. MEN_LIN(BOTOM)
