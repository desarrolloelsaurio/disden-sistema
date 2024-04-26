********************************************************************************
*-- Programa: LPRO
*-- Fecha   : 05-31-92 04:01am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE PROVEEDORES
********************************************************************************
parameter porpan
CANT_MAX=16
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[ 1,1]="CODIGO"
TEXTO[ 2,1]="PROVEEDOR"
TEXTO[ 3,1]="ENC. VENTAS"
TEXTO[ 4,1]="VIAJANTE"
TEXTO[ 5,1]="DOMICILIO"
TEXTO[ 6,1]="LOCALIDAD"
TEXTO[ 7,1]="PAIS"
TEXTO[ 8,1]="TELEFONO"
TEXTO[ 9,1]="FAX"
TEXTO[10,1]="DETALLE"
TEXTO[11,1]="COND. IVA"
TEXTO[12,1]="N§ IVA"
TEXTO[13,1]="COEF"
TEXTO[14,1]="DESCUENTO"
TEXTO[15,1]="COEF RESULTANTE   "
TEXTO[16,1]="PO"

TEXTO[ 1,2]=10
TEXTO[ 2,2]=30
TEXTO[ 3,2]=30
TEXTO[ 4,2]=30
TEXTO[ 5,2]=40
TEXTO[ 6,2]=10
TEXTO[ 7,2]=3
TEXTO[ 8,2]=30
TEXTO[ 9,2]=12
TEXTO[10,2]=30
TEXTO[11,2]=02
TEXTO[12,2]=15
TEXTO[13,2]=12
TEXTO[14,2]=20
TEXTO[15,2]=12
TEXTO[16,2]=2

store "" to ttque
store .t. to habilitado
FILPRO=BAR()
TT=''
FISC=QWPRO(FILPRO)
IF FISC#'.F.'
	IF FILPRO=4
		SELE PRO
		SCAT TO AGX
		=movewin(mPROr,mPROc,mPROr+mPROla,mPROc+mPROan,'win'," Muestra Proveedor ")
		DO mPRO WITH .T.,25
		=inkey(nul,'HM')
		=relewin("win")
	ELSE
		TT='Listado de Proveedores'+CHR(13)+CHR(10)+TT
		HABILITADO[5]=(FILPRO#2)
		HABILITADO[8]=(FILPRO#3)
		=acopy(habilitado,habilant)
		do while CFGFAC()
			IF PORPAN
				DO LPROP
			ELSE
				DO LPROI
			ENDIF
			store .f. to variable
		ENDdo
	ENDIF
ENDIF
RETURN
