*****************************************************************************
*-- Programa: lmer.prg
*-- Fecha   : 06/06/91 06:26pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE telos
********************************************************************************
PARAMETER PORPAN,CONLEGA
ulpr=HORA_ULP(PROGRAM())
TTQUE=''
FISC=GRL2("L¡mites del Listado de Mercader¡a")
if fisc#'.F.'
	CANT_MAX=13
	DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]

	TEXTO[1,1]="RUBRO"
	TEXTO[2,1]="SUBRUBRO"
	TEXTO[3,1]="ARTICULO"
	TEXTO[4,1]="DENOMINACION"
	TEXTO[5,1]="COLOR"
	TEXTO[6,1]="MARCA"
	TEXTO[7,1]="LINEA"
	TEXTO[8,1]="PROVEEDOR 1"
	TEXTO[9,1]="PROVEEDOR 2"
	TEXTO[10,1]="PROVEEDOR 3"
	TEXTO[11,1]="MATERIAL"
	TEXTO[12,1]="GRUPO DE COMPRAS"
	TEXTO[13,1]="ORIGEN"

	TEXTO[1,2]=3
	TEXTO[2,2]=3
	TEXTO[3,2]=07
	TEXTO[4,2]=40
	TEXTO[5,2]=20
	TEXTO[6,2]=20
	TEXTO[7,2]=20
	TEXTO[8,2]=20
	TEXTO[9,2]=20
	TEXTO[10,2]=20
	TEXTO[11,2]=20
	TEXTO[12,2]=20
	TEXTO[13,2]=3

	store .t. to habilitado

	IF CONLEGA
	ELSE
		DO WHILE CFGFAC()
			IF PORPAN
				do lmerpt
  	        ELSE
	           DO LMERIT
			ENDIF
ENDDO
	ENDIF
endif
RETURN
