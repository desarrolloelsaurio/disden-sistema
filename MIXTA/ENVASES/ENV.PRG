********************************************************************************
*-- Programa: env.prg
*-- Fecha   : 05-15-92 06:11pm
*-- Version : E. BANALOTTI
*-- Notas   : DERIVA A OPERACIONES DE ENVASES
*-- Modificaci¢n GOYO 08-26-92 01:33pm
********************************************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[9],OTROS[7],TEXTO[3,9],ELOTRO[1]
MENSAJE[1]=" Ingreso Envases - "                 && ME1
MENSAJE[2]=" Ingreso Envases "                   && TITULO DE LA VENTANA
MENSAJE[3]="ENVASE "
MENSAJE[4]="CODIGO ENVASE "

OTROS[1]="ENVTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[7]='E'

TEXTO[1,1]='ENVASE'                              && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='@!'                                  && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='ENVTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='ENVCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS

TEXTO[3,1]="MONTO    "
TEXTO[3,2]=3
TEXTO[3,3]="99,999,999.99"
TEXTO[3,9]=XACDIGI
ELOTRO[1]='MONTO'

DO CASE
CASE BAR()=1
	ULPR='IENV'
	OTROS[3]=IENVR
	OTROS[4]=IENVC
	OTROS[5]=IENVR+IENVLA
	OTROS[6]=IENVC+IENVAN
	TEXTO[1,6]=.T.                                 && ISALPHA
	TEXTO[1,7]=.F.                                 && UPDATE()
	TEXTO[1,8]=.F.                                 && ES VACIO
	TEXTO[2,6]=.F.                                 && ISALPHA
	TEXTO[2,7]=.F.                                 && UPDATE()
	TEXTO[2,8]=.F.                                 && ES VACIO
	=IMIX(@MENSAJE,@TEXTO,@OTROS,.T.)
CASE BAR()=2
	stor nul TO respuesta
	IF !EMPTY(eliENV(" a Corregir",-1,1))
		OTROS[3]=CENVR
		OTROS[4]=CENVC
		OTROS[5]=CENVR+CENVLA
		OTROS[6]=CENVC+CENVAN
		MENSAJE[5]=" Correcci¢n Envase - "
		MENSAJE[6]=" Correcci¢n Envase "
		TEXTO[1,6]=.T.                               && ISALPHA
		TEXTO[1,7]=.T.                               && UPDATE()
		TEXTO[1,8]=.F.                               && ES VACIO
		TEXTO[2,6]=.F.                               && ISALPHA
		TEXTO[2,7]=.T.                               && UPDATE()
		TEXTO[2,8]=.F.                               && ES VACIO
		=CMIX(@MENSAJE,@TEXTO,@OTROS,.T.)
	ENDIF
CASE BAR()=4
	stor nul TO respuesta
	IF !EMPTY(eliENV(" a Borrar",-1,1))
		OTROS[3]=MENVR
		OTROS[4]=MENVC
		OTROS[5]=MENVR+MENVLA
		OTROS[6]=MENVC+MENVAN
		MENSAJE[5]=" Borra Envase"
		DO bmix
	ENDIF
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor ENVpop TO anterior
		stor .T. TO ENVpop
		DO opENV
		stor nul TO respuesta
		IF !EMPTY(eliENV(" a Recuperar",-1,1))
			OTROS[3]=MENVR
			OTROS[4]=MENVC
			OTROS[5]=MENVR+MENVLA
			OTROS[6]=MENVC+MENVAN
			MENSAJE[5]=" Recupera Envase"
			DO llmix
		ENDIF
		stor anterior TO ENVpop
		DO opENV
	ENDIF
	SET DELE ON
	SELE mix
	SET FILTER TO
CASE BAR()=6
	DO rmix
CASE BAR()=8
	MENSAJE[7]="ENVASE"
	MENSAJE[8]="COD ENVASE"
	MENSAJE[9]="Listado de Envases"
	OTROS[6]='ORDENV'
	DO lmixi
CASE BAR()=9
	MENSAJE[7]="ENVASE"
	MENSAJE[8]="COD ENVASE"
	MENSAJE[9]="Listado de Envases"
	OTROS[6]='ORDENV'
	DO lmixp
CASE BAR()=11
	MENSAJE[7]=" ENVASE"
	MENSAJE[8]=" DE ENVASES"
	MENSAJE[9]="ENV"
	OTROS[3]=VENVR
	OTROS[4]=VENVC
	OTROS[5]=VENVR+VENVLA
	OTROS[6]=VENVC+VENVAN
	DO vmix
CASE BAR()=13
	ulpr='XENV'
	DO rndx1 WITH 16,20
	ON SELE POPU rndx DO xmix
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ulpr=PROGRAM()
=MEN_LIN(BOTOM)
UNLO ALL
RETURN
*: EOF: ENV.PRG
