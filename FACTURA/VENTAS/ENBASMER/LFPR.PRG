********************************************************************************
*-- Programa: LFPR.PRG
*-- Fecha   : 07/17/92 11:23am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE FACTURAS POR DIRERENCIA DE PRECIOS
********************************************************************************
PARAMETER PORPAN
ULPR=HORA_ULP(PROGRAM())
CANT_MAX=9
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[1,2] =13
TEXTO[2,2] =8
TEXTO[3,2] =2
TEXTO[4,2] =20
TEXTO[5,2] =20
TEXTO[6,2] =20
TEXTO[7,2] =XACDIGI
TEXTO[8,2] =XACDIGI
TEXTO[9,2] =XACDIGI
TEXTO[1,1] =TIT_INVO
TEXTO[2,1] ='FECHA EMISION'
TEXTO[3,1] ='TIPO COMPROBANTE'
TEXTO[4,1] ='CLIENTE'
TEXTO[5,1] =UPPER(BIAJA)
TEXTO[6,1] ='ARTICULO'
TEXTO[7,1]='MONTO ORIG'
TEXTO[8,1]='MONTO FACT'
TEXTO[9,1]='DIFERENCIA'
STORE "" TO TTQUE
STORE .T. TO HABILITADO
STORE 1 TO FILEMP,FILFAC,FILCLI,FILFEC,FILVIA,FILPAG,FILMON,FILMER
STORE '' TO FISC
DO WHILE QUERYFAC(PORPAN)
	=ACOPY(HABILITADO,HABILANT)
	DO WHILE CFGFAC()
		=IIF(PORPAN,LFPRP(),LFPRI())
		STORE .F. TO VARIABLE
	ENDdo
	STORE .F. TO VARIABLE
	=ACOPY(HABILANT,HABIITADO)
ENDDO
RETURN
