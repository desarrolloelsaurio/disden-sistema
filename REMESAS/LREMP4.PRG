********************************************************************************
*-- Programa: lremp4
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE remesas
********************************************************************************
parameter porpan
CANT_MAX=10
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,1]='PROVEEDOR'
TEXTO[2,1]='REMESA'
TEXTO[3,1]='FECHA'
TEXTO[4,1]='MERCADERIA'
TEXTO[5,1]="C. BULTOS"
TEXTO[6,1]="B. VENDIDOS"
TEXTO[7,1]="REMANENTE"
TEXTO[8,1]="AG"
TEXTO[9,1]='FECHA'
TEXTO[10,1]='USUARIO          '

TEXTO[1,2]=30
TEXTO[2,2]=8
TEXTO[3,2]=8
TEXTO[4,2]=40
TEXTO[5,2]=8
TEXTO[6,2]=8
TEXTO[7,2]=8
TEXTO[8,2]=2
TEXTO[9,2]=8
TEXTO[10,2]=10

store "" to ttque
store .t. to habilitado
		TT='Listado de Remesas'+CHR(13)+CHR(10)+TTFEC
  	     do while CFGFAC()
			IF PORPAN
				DO Lremp4p
			ELSE
				DO lremp4i
			ENDIF
			store .f. to variable
		ENDdo
RETURN
