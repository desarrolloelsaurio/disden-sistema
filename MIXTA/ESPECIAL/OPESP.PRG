***************************************
*-- Programa: OPESP.PRG
*-- Fecha   : 03-23-92 12:20pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO DE ESPECIALIDADES MEDICAS
*** VERSION LABORATORIOS
*** MODIF GOYO 04-28-93 03:10pm
**************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG ESPTEX
ELSE
	=MEN_LIN(ABA+"Especialidades M‚dicas")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG ESPTEX ALIAS MIX
ENDIF
RETURN IIF(ESPPOP,DEFPOMIX(ESPPOPR,ESPPOPC),.T.) .AND. MEN_LIN(BOTOM)
