********************************************************************************
*-- Programa: lsto.prg
*-- Fecha   : 11-05-92 11:33am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE STOCK
********************************************************************************
PARAMETER PORPAN
ulpr=HORA_ULP(PROGRAM())
TTQUE=''
FISC=GRL2("L¡mites del Listado de Stock",1)
if fisc#'.F.'
	CANT_MAX=9
	DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]

	TEXTO[1,1]="RUBRO"
	TEXTO[2,1]="SUBRUBRO"
	TEXTO[3,1]="ARTICULO"
	TEXTO[4,1]="DENOMINACION"
	TEXTO[5,1]="MARCA"
	TEXTO[6,1]="PROVEEDOR 1"
	TEXTO[7,1]="STOCK"
	TEXTO[8,1]="VALORIZACION EN "+ALLTRIM(XAUSS)+SPACE(10)
	TEXTO[9,1]="VALORIZACION EN "+ALLTRIM(XADOLS)          

	TEXTO[1,2]=3
	TEXTO[2,2]=3
	TEXTO[3,2]=7
	TEXTO[4,2]=40
	TEXTO[5,2]=20
	TEXTO[6,2]=30
	TEXTO[7,2]=xacdigi
	TEXTO[8,2]=xacdigi
	TEXTO[9,2]=xacdigi

	store .t. to habilitado

		IF CFGFAC()
			IF PORPAN
				do lstopt
			ELSE
				DO LstoIT
			ENDIF
		ENDIF
endif

RETURN
