********************************************************************************
*-- Programa: LLpro.PRG
*-- Fecha   : 02/08/91 05:00pm
*-- Version : G. REINEr
*-- Notas   : BORRA proveedores
********************************************************************************
STORE RECNO() TO ff
store str(ff) to registro
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DEFINE WINDOW win FROM mpror,mproc TO mpror+mprola,mproc+mproan TITL " Recupera Proveedores " SHAD COLOR SCHE 8
	SELE pro
	=LOCK() .OR. lok("pro")
	STORE 25 TO COL
	SCAT MEMVAR
	do mPRO
	if confirma("Recuperar el Proveedor",.t.,18,0)
		reca reco ff
		=IAUD(M.PROCOD+"-"+M.PROVEEDOR)
	endif
	unlo in pro
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
