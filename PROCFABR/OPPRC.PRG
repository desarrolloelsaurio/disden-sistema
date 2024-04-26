*********************************************
*-- Programa: OPPRC.PRG
*-- Fecha   : 06/05/91 11:12am
*-- Version : E. BANALOTTI
*-- Notas   : ABRE ARCHIVO PROCESO DE FRABRICACION EXISTENTES
*-- Modificaci¢n GOYO 23/06/1992
*-- Modificaci¢n GOYO 03-22-93 03:35am
*********************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE FAVRI  "Fabricaci¢n"                     && ABA

IF !USED("PRC")
	=MEN_LIN(ABA+'Procesos de Fabricaci¢n')
	=PRXAREA(.T.)
	=GETDBF('PROCFAB','PRCCOD','PRC')
ENDIF
RETURN IIF(Prcpop,DEFPOGRL(prcpopr,prcpopc,'PRCPOP','prc.procfab',30,'Elija el Proceso de '+favri),.T.) .AND. ;
men_lin(botom)
