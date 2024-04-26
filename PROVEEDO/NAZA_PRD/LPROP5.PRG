********************************************************************************
*-- Programa: LPROP5.PRG
*-- Fecha   : 06/27/91
*-- Version : g. reier
*-- Notas   : LISTADO DE CLIENTES
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE pro
	SET ORDER TO TAG IIF(TYPE("ordPRO")#'L' .OR. ordPRO,'PROCOD','PROVEEDOR')
	=MEN_LIN("[ESC] para Finalizar - [TECLA] para Continuar")
	DEFINE WINDOW win FROM mpror,mproc TO mpror+mprola,mproc+mproan TITL " Clientes-"+ttu+" " SHAD COLOR SCHE 8
	COL=25
	SCAN FOR &fisc
		SCAT MEMV
		DO mpro
		IF INKEY(NUL)=27
			EXIT
		ENDIF
	ENDSCAN
	RELE WIND win
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
