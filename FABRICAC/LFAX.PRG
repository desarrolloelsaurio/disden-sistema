**********************************************************
*-- Programa: LFAX
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE ORDENES DE FABRICACION
**********************************************************
PARAMETER PORPAN
CANT_MAX=14
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], HABILITADO[CANT_MAX],HABILANT[CANT_MAX]
TEXTO[ 1,1]='REMITO'
TEXTO[ 2,1]='TALLER'
TEXTO[ 3,1]='F.E.TALLER'
TEXTO[ 4,1]='H.E.TALLER'
TEXTO[ 5,1]='C.E.EMPRESA'
TEXTO[ 6,1]='R.E.EMPRESA'
TEXTO[ 7,1]='C.R.TALLER'
TEXTO[ 8,1]='R.R.TALLER'
TEXTO[ 9,1]='F.S.TALLER'
TEXTO[10,1]='H.S.TALLER'
TEXTO[11,1]='C.E.TALLER'
TEXTO[12,1]='R.E.TALLER'
TEXTO[13,1]='C.R.EMPRESA'
TEXTO[14,1]='R.R.EMPRESA'
TEXTO[ 1,2]=14
TEXTO[ 2,2]=30
TEXTO[ 3,2]=8
TEXTO[ 4,2]=5
TEXTO[ 5,2]=XACDIGI
TEXTO[ 6,2]=10
TEXTO[ 7,2]=XACDIGI
TEXTO[ 8,2]=10
TEXTO[ 9,2]=8
TEXTO[10,2]=5
TEXTO[11,2]=XACDIGI
TEXTO[12,2]=10
TEXTO[13,2]=XACDIGI
TEXTO[14,2]=10
STORE "" TO TTQUE
STORE .T. TO HABILITADO
FILCLI=BAR()
TT=''
*fISC=QWCLI(FILCLI)
IF FISC#'.F.'
	TT='Listado de Clientes'+CHR(13)+CHR(10)+TT
	HABILITADO[5]=(FILCLI#2)
	HABILITADO[10]=(FILCLI#3)
	HABILITADO[8]=(FILCLI#4)
	HABILITADO[11]=(FILCLI#6)
	=ACOPY(HABILITADO,HABILANT)
	DO WHILE CFGFAC()
		=IIF(PORPAN,LFAXP(),LFAXI())
		STORE .F. TO VARIABLE
	ENDDO
ENDIF
RETURN
