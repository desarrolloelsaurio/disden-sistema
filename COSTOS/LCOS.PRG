********************************************************************************
*-- Programa: LCOS.PRG
*-- Fecha   : 11-20-92 11:46am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE COSTOS
********************************************************************************
PARAMETER PORPAN
ulpr=HORA_ULP(PROGRAM())
if cheqseg()
TTQUE=''
FISC=GRL2("L¡mites del Listado de Costos")
if fisc#'.F.'
	CANT_MAX=10
	DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]

	TEXTO[1,1]="RUBRO"
	TEXTO[2,1]="SUBRUBRO"
	TEXTO[3,1]="ARTICULO"
	TEXTO[4,1]="DENOMINACION"
	TEXTO[5,1]="MARCA"
	TEXTO[6,1]="PROVEEDOR 1"
	TEXTO[7,1]="COSTO EN "+ALLTRIM(XAUSS)+SPACE(10)
	TEXTO[8,1]="COSTO EN "+ALLTRIM(XADOLS)
	TEXTO[9,1]="COSTO + DTO EN "+ALLTRIM(XAUSS)
	TEXTO[10,1]="COSTO + DTO EN "+ALLTRIM(XADOLS)

	TEXTO[1,2]=3
	TEXTO[2,2]=3
	TEXTO[3,2]=7
	TEXTO[4,2]=40
	TEXTO[5,2]=20
	TEXTO[6,2]=30
	TEXTO[7,2]=xacdigi
	TEXTO[8,2]=xacdigi
	TEXTO[9,2]=xacdigi
	TEXTO[10,2]=xacdigi
           	store .t. to habilitado
		DO WHILE CFGFAC()
 			IF PORPAN
				do lCOSP
			ELSE
				DO LCOSI
			ENDIF
           	store .t. to habilitado
		ENDDO
endif
else
	=iaudi()
endif
RETURN
