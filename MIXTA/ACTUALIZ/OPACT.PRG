*********************************************
*-- Programa: OPACT.PRG
*-- Fecha   : 08-27-92 12:37pm
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO Actualizaciones
*-- MODIF GOYO 04-28-93 02:37pm
********************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG ACTTEX
ELSE
	=MEN_LIN(ABA+'Actualizaciones')
	SELE 1
	=GETDBF('MIXTA','ACTTEX','MIX')
ENDIF
RETURN IIF(ACTPOP,DEFPOMIX(ACTPOPR,ACTPOPC),.T.) .AND. MEN_LIN(BOTOM)
