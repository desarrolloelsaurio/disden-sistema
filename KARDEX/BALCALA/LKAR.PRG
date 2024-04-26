********************************************************************************
*-- Programa: LKAR.PRG
*-- Fecha   : 03-22-93 02:53pm
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE KARDEX
********************************************************************************
parameter porpan
CANT_MAX=9
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
PADC("ARTICULO",15)+PAIP+;
PADC("FORMULARIO",17)+PAIP+;
PADC("ENTRADAS",XACDIGI)+PAIP+;
PADC("SALIDAS",XACDIGI)+PAIP+;
PADC("SALDO",XACDIGI)+PAIP+PAIP+;
PADC("ENT. UNID.",XACDIGI)+PAIP+;
PADC("SAL. UNID.",XACDIGI)+PAIP+;
PADC("SALDO UN.",XACDIGI)+PAIP

TEXTO[ 1,1]='ARTICULO'
TEXTO[ 2,1]='MERCADERIA'
TEXTO[ 3,1]='FORMULARIO'
TEXTO[ 4,1]='KG. ENTR.'
TEXTO[ 5,1]='KG. SALI.'
TEXTO[ 6,1]='KG. STOCK'
TEXTO[ 7,1]='UN. ENTR.'
TEXTO[ 8,1]='UN. SALI.'
TEXTO[ 9,1]='UN. STOCK'

TEXTO[ 1,2]=20
TEXTO[ 2,2]=30
TEXTO[ 3,2]=17
TEXTO[ 4,2]=XACDIGI
TEXTO[ 5,2]=XACDIGI
TEXTO[ 6,2]=XACDIGI
TEXTO[ 7,2]=XACDIGI
TEXTO[ 8,2]=XACDIGI
TEXTO[ 9,2]=XACDIGI

store "" to ttque
store .t. to habilitado
store 1 to filemp,filfac,filcli,filfec,filvia,filpag,filmon,filmer,FILART
FISC=''
do while querykar(PORPAN)
	TT=' Listado de Kardex '+CHR(13)+CHR(10)+TT
	=acopy(habilitado,habilant)
	do while CFGFAC()
		IF PORPAN
			DO Lkarp
		ELSE
			DO Lkari
		ENDIF
		store .f. to variable
	ENDdo
enddo
RETURN
