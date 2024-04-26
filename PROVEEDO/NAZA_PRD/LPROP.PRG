********************************************************************************
*-- Programa: LPROP.PRG
*-- Fecha   : 06/06/91 02:13pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE LISTADOS DE PROVEEDORES
********************************************************************************
@ 0,36 SAY TIME() COLOR I
@ 0,47 SAY PADC(PROGRAM(),10) COLOR I
dijo=BAR()
respuesta='nada#15#30#Tipo de Listado#3#\<Muestra Ficha#\<Encargado de Ventas#\<Domicilio#\<Tel‚fonos'
=DEFPOP()
ON SELE POPU nada DO lpropp
DO CASE
CASE BAR()=1
	fsc='.t.'
	ttu='Todos los Proveedores'
	ACTI POPU nada
	RELE POPU nada
case bar()=2
	STORE 0 TO respuesta
	IF !empty(elipro(" a Listar",-1,1))
		scat memv
		DEFINE WINDOW win FROM cpror,cproc TO cpror+cprola,cproc+cproan TITL " Correcci¢n Proveedor " SHAD COLOR SCHE 8
		acti wind win
		store 25 to col
		DO mpro
		=inkey(NUL,'HM')
		rele wind win
	ENDIF
ENDCASE
RETURN
