********************************************
*-- Programa: OPTIX.PRG
*-- Fecha   : 01-18-92 08:44am
*-- Version : R. 'EL BATA'
*-- Notas   : ABRE ARCHIVO DE TIPO DE GASTOS
********************************************
IF USED("TIX")
	SELE TIX
	SET ORDER TO TAG CUGTIX
ELSE
	=MEN_LIN(ABA+'Tipo de Gastos')
	SELE 15
	USE (PATHCNS+'\UNIDAT') ORDER TAG CUGTIX ALIAS TIX
ENDIF
RETURN MEN_LIN(BOTOM)
