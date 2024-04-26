********************************************
*-- Programa: OPEST.PRG
*-- Fecha   : 06/14/91 06:52pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ESTRUCTURA DE PRODUCTO
**************************************************
IF !USED("EST")
	=MEN_LIN(ABA+"Estructura de Producto")
	SELE 17
	USE (PATH+'\HOJARUT') ORDER TAG HOJARUT ALIAS est SHARED
ENDIF
RETURN MEN_LIN(BOTOM)
