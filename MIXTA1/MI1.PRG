***************************************
*-- Programa: ZON.PRG
*-- Fecha   : 04-30-92 12:25pm
*-- Version : G. REINER
*-- Notas   : DERIVA Zonas
*-- Modificaci¢n GOYO 05-17-92 07:30pm
*-- Modificaci¢n GOYO 05-19-92 05:07am
*-- Modificaci¢n GOYO 05-25-92 04:14pm
***************************************
ulpr=PROGRAM()
=cabpan1()
SELE MI1
DIME MENSAJE[9],OTROS[7],TEXTO[2,9]
MENSAJE[3]="ZONA "
MENSAJE[4]="CODIGO ZONA "
OTROS[1]="ZONTEX"                                && INDICE AL COMENZAR
OTROS[2]=25
OTROS[7]='Z'
TEXTO[1,1]='ZONA'                                && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='@!'                                  && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='ZONTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS
TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='ZONCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS
DO CASE
CASE BAR()=1
	ULPR='IZON'
	MENSAJE[2]=" Ingreso Zonas "                   && TITULO DE LA VENTANA
	MENSAJE[1]=MENSAJE[2]+'- '                     && ME1
	OTROS[3]=IZONR
	OTROS[4]=IZONC
	OTROS[5]=IZONR+IZONLA
	OTROS[6]=IZONC+IZONAN
	TEXTO[1,6]=.T.                                 && ISALPHA
	TEXTO[1,7]=.F.                                 && UPDATE()
	TEXTO[1,8]=.F.                                 && ES VACIO
	TEXTO[2,6]=.F.                                 && ISALPHA
	TEXTO[2,7]=.F.                                 && UPDATE()
	TEXTO[2,8]=.F.                                 && ES VACIO
	=IMI1(@MENSAJE,@TEXTO,@OTROS)
CASE BAR()=2
	stor nul TO respuesta
	IF !EMPTY(eliZON(" a Corregir",-1,1))
		OTROS[3]=CZONR
		OTROS[4]=CZONC
		OTROS[5]=CZONR+CZONLA
		OTROS[6]=CZONC+CZONAN
		MENSAJE[2]=" Correcci¢n Zonas "              && TITULO DE LA VENTANA
		MENSAJE[1]=MENSAJE[2]+'- '
		MENSAJE[6]=" Correcci¢n Zona "
		TEXTO[1,6]=.T.                               && ISALPHA
		TEXTO[1,7]=.T.                               && UPDATE()
		TEXTO[1,8]=.F.                               && ES VACIO
		TEXTO[2,6]=.F.                               && ISALPHA
		TEXTO[2,7]=.T.                               && UPDATE()
		TEXTO[2,8]=.F.                               && ES VACIO
		ULPR='CZON'
		=CMI1(@MENSAJE,@TEXTO,@OTROS)
	ENDIF
CASE BAR()=4
	stor nul TO respuesta
	IF !EMPTY(eliZON(" a Borrar",-1,1))
		OTROS[3]=MZONR
		OTROS[4]=MZONC
		OTROS[5]=MZONR+MZONLA
		OTROS[6]=MZONC+MZONAN
		MENSAJE[5]=" Borra Zona "
		ULPR='BZON'
		DO BMI1
	ENDIF
CASE BAR()=5
	SET DELE OFF
	SET ORDER TO TAG ZONTEX
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		STOR ZONPOP TO ANTERIOR
		STOR .T. TO ZONPOP
		DO OPZON
		stor nul TO respuesta
		IF !EMPTY(eliZON(" a Recuperar",-1,1))
			OTROS[3]=MZONR
			OTROS[4]=MZONC
			OTROS[5]=MZONR+MZONLA
			OTROS[6]=MZONC+MZONAN
			MENSAJE[5]=" Recupera Zona "
			ULPR='LLZON'
			DO LLMI1
		ENDIF
		STOR ANTERIOR TO ZONPOP
		DO OPZON
	ENDIF
	SET DELE ON
	SELE MI1
	SET FILTER TO
CASE BAR()=8
	MENSAJE[7]="ZONA"
	MENSAJE[8]="COD ZONA"
	MENSAJE[9]="Listado de Zonas"
	ULPR='LZONI'
	DO lMI1i
CASE BAR()=9
	MENSAJE[7]="ZONA"
	MENSAJE[8]="COD ZONA"
	MENSAJE[9]="Listado de Zonas"
	ULPR='LZONP'
	DO LMI1P
CASE BAR()=11
	MENSAJE[7]=" ZONA"
	MENSAJE[8]=" DE ZONAS"
	MENSAJE[9]="ZON"
	OTROS[3]=VZONR
	OTROS[4]=VZONC
	OTROS[5]=VZONR+VZONLA
	OTROS[6]=VZONC+VZONAN
	DO VMI1
CASE BAR()=13
	ULPR='XZON'
	DO RNDX1 WITH 16,20
	ON SELE POPU RNDX DO XMI1
	ACTI POPU RNDX
	RELE POPU RNDX
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
