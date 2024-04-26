*********************************************
*-- Programa: OPSUC.PRG
*-- Fecha   : 10-30-95 01:08am
*-- Version : G.REINER
*-- Notas   : ABRE ARCHIVO SUCURSALES
*-- MODIF GOYO 04-28-93 02:37pm
********************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG SUCTEX
ELSE
	=MEN_LIN(ABA+'Sucursales')
	SELE 1
	=GETDBF('MIXTA','SUCTEX','MIX')
ENDIF
RETURN IIF(SUCPOP,DEFPOMIX(SUCPOPR,SUCPOPC),.T.) .AND. MEN_LIN(BOTOM)
