*********************************
*-- Programa: Bpro.PRG
*-- Fecha   : 02/08/91 05:00pm
*-- Version : G. REINER
*-- Notas   : BORRA TALLERES
*********************************
STORE RECNO() TO ff
store str(ff) to registro
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	DEFINE WINDOW win FROM mpror,mproc TO mpror+mprola,mproc+mproan TITL " Borra Proveedores " SHAD COLOR SCHE 8
	SELE pro
	=LOCK() .OR. lok("pro")
	STORE 25 TO COL
	SCAT MEMVAR
	do mPRO
	if confirma("Borrar el Proveedor",.t.,18,0)
		dele reco ff
		=IAUD(M.PROCOD+"-"+M.PROVEEDOR)
	endif
	unlo in pro
	=RELEWIN("WIN")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
