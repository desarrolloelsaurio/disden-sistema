********************************************************************************
*-- Programa: LCLI
*-- Fecha   : 05-31-92 04:01am
*-- Version : G. REINER
*-- Notas   : DERIVA A LISTADOS DE CLIENTES
********************************************************************************
parameter porpan
CANT_MAX=13
EXTERNAL ARRAY TEXTO,VARIABLE,HABILITADO
DIME TEXTO[CANT_MAX,2], VARIABLE[CANT_MAX], Habilitado[CANT_MAX],habilant[cant_max]
TEXTO[ 1,1]='CODIGO'
TEXTO[ 2,1]='CLIENTE'
TEXTO[ 3,1]='ENC. COMPRAS'
TEXTO[ 4,1]='DOMICILIO'
TEXTO[ 5,1]='LOCALIDAD'
TEXTO[ 6,1]='TELEFONOS'
TEXTO[ 7,1]='FAX'
TEXTO[ 8,1]='COND. I.V.A.'
TEXTO[ 9,1]='N§ I.V.A.'
TEXTO[10,1]='ZONA'
TEXTO[11,1]='PRECIO'
TEXTO[12,1]='FECHA'
TEXTO[13,1]='USUARIO          '
TEXTO[ 1,2]=10
TEXTO[ 2,2]=30
TEXTO[ 3,2]=20
TEXTO[ 4,2]=30
TEXTO[ 5,2]=10
TEXTO[ 6,2]=20
TEXTO[ 7,2]=12
TEXTO[ 8,2]=6
TEXTO[ 9,2]=15
TEXTO[10,2]=20
TEXTO[11,2]=20
TEXTO[12,2]=8
TEXTO[13,2]=10
store "" to ttque
store .t. to habilitado
FILCLI=BAR()
TT=''
FISC=QWCLI(FILCLI)
IF FISC#'.F.'
	IF FILCLI=8
		SELE PER
		SCAT MEMV
    	=MOVECENT(NUL,NUL,16,60,"WIN"," Muestra Cliente ")
		STOR 25 TO COL
		DO mcli WITH .T.
		=inkey(nul,'HM')
		=relewin("win")
	ELSE
		TT='Listado de Clientes'+CHR(13)+CHR(10)+TT
		HABILITADO[5]=(FILCLI#2)
		HABILITADO[10]=(FILCLI#3)
		HABILITADO[8]=(FILCLI#4)
		HABILITADO[11]=(FILCLI#6)
		=acopy(habilitado,habilant)
		do while CFGFAC()
		ACLA=HAZ_ACLA()
		M.LINEA=REPL("=",LEN(ACLA))
			=LGRL2(PORPAN,'PER',"LCLI0()",FISC,"LCLI")
			store .f. to variable
		ENDdo
	ENDIF
ENDIF
RETURN
