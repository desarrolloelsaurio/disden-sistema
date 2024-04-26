********************************************************************************
*-- Programa: best.prg
*-- Fecha   : 06/25/91 06:48pm
*-- Version : G. REINER
*-- Notas   : borra estructura de produccion
********************************************************************************
ulpr=hora_ulp(PROGRAM())
DO CASE
CASE BAR()=1
	DO IMER_DO.SPR WITH .F.," Borra Estructura ",13,.T.
CASE BAR()=2
	DO IMER_DO.SPR WITH .F.," Borra Estructura ",21,.T.
ENDCASE
RETURN MEN_LIN(BOTOM)
