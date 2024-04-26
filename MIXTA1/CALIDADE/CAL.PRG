************************************************
*-- Programa: CAL.prg
*-- Fecha   : 03-23-92 12:09pm
*-- Version : R. 'EL BATA'
*-- Notas   : DERIVA A OPERACIONES DE Calidades
************************************************
ulpr=PROGRAM()
=cabpan1()
SELE mix
DIME MENSAJE[9],OTROS[7],TEXTO[2,9]
MENSAJE[1]=" Ingreso Calidades - "               && ME1
MENSAJE[2]=" Ingreso Calidades "                 && TITULO DE LA VENTANA
MENSAJE[3]="CALIDAD "
MENSAJE[4]="CODIGO CALIDAD "

OTROS[1]="CALTEX"                                && INDICE AL COMENZAR
OTROS[2]=17
OTROS[7]='K'

TEXTO[1,1]='CALIDAD'                             && SAY DEL GET
TEXTO[1,2]=3                                     && COLOR SCHEME
TEXTO[1,3]='@!'                                  && PICTURE
TEXTO[1,4]='M.TEXTO1'                            && CAMPO A buscar en xseek
TEXTO[1,5]='CALTEX'                              && ORDER TAG DE BUSQUEDA
TEXTO[1,9]=20                                    && ANCHO PARA LOS LISTADOS

TEXTO[2,1]='CODIGO   '                           && SAY DEL GET
TEXTO[2,2]=3                                     && COLOR SCHEME
TEXTO[2,3]='!!'                                  && PICTURE
TEXTO[2,4]='LEFT(M.TEXTO2,2)'                    && CAMPO A buscar en xseek
TEXTO[2,5]='CALCOD'                              && ORDER TAG DE BUSQUEDA
TEXTO[2,9]=2                                     && ANCHO PARA LOS LISTADOS
DO CASE
CASE BAR()=1
	ULPR='ICAL'
	OTROS[3]=ICALR
	OTROS[4]=ICALC
	OTROS[5]=ICALR+ICALLA
	OTROS[6]=ICALC+ICALAN
	TEXTO[1,6]=.T.                                 && ISALPHA
	TEXTO[1,7]=.F.                                 && UPDATE()
	TEXTO[1,8]=.F.                                 && ES VACIO
	TEXTO[2,6]=.F.                                 && ISALPHA
	TEXTO[2,7]=.F.                                 && UPDATE()
	TEXTO[2,8]=.F.                                 && ES VACIO
	=IMIX(@MENSAJE,@TEXTO,@OTROS)
CASE BAR()=2
	stor nul TO respuesta
	IF !EMPTY(eliCAL(" a Corregir",-1,1))
		OTROS[3]=CCALR
		OTROS[4]=CCALC
		OTROS[5]=CCALR+CCALLA
		OTROS[6]=CCALC+CCALAN
		MENSAJE[5]=" Correcci¢n Calidad - "
		MENSAJE[6]=" Correcci¢n Calidad "
		TEXTO[1,6]=.T.                               && ISALPHA
		TEXTO[1,7]=.T.                               && UPDATE()
		TEXTO[1,8]=.F.                               && ES VACIO
		TEXTO[2,6]=.F.                               && ISALPHA
		TEXTO[2,7]=.T.                               && UPDATE()
		TEXTO[2,8]=.F.                               && ES VACIO
	ULPR='CCAL'
		=CMIX(@MENSAJE,@TEXTO,@OTROS)
	ENDIF
CASE BAR()=4
	stor nul TO respuesta
	OTROS[3]=MCALR
	OTROS[4]=MCALC
	OTROS[5]=MCALR+MCALLA
	OTROS[6]=MCALC+MCALAN
	IF !EMPTY(eliCAL(" a Borrar",-1,1))
		OTROS[3]=MCALR
		OTROS[4]=MCALC
		OTROS[5]=MCALR+MCALLA
		OTROS[6]=MCALC+MCALAN
		MENSAJE[5]=" Borra Calidad "
	ULPR='BCAL'
		DO bmix
	ENDIF
CASE BAR()=5
	SET DELE OFF
	SET FILTER TO DELETED()
	GOTO TOP
	IF !EOF()
		stor CALpop TO anterior
		stor .T. TO CALpop
		DO opCAL
		stor nul TO respuesta
		IF !EMPTY(eliCAL(" a Recuperar",-1,1))
			OTROS[3]=MCALR
			OTROS[4]=MCALC
			OTROS[5]=MCALR+MCALLA
			OTROS[6]=MCALC+MCALAN
			MENSAJE[5]=" Recupera Calidad "
	ULPR='LLCAL'
			DO llmix
		ENDIF
		stor anterior TO CALpop
		DO opCAL
	ENDIF
	SET DELE ON
	SELE mix
	SET FILTER TO
CASE BAR()=6
	DO rmix
CASE BAR()=8
	MENSAJE[7]="CALIDAD"
	MENSAJE[8]="COD CALIDAD"
	MENSAJE[9]="Listado de Calidades"
	OTROS[6]='ORDCAL'
	ULPR='LCALI'
	DO lmixi
CASE BAR()=9
	MENSAJE[7]="CALIDAD"
	MENSAJE[8]="COD CALIDAD"
	MENSAJE[9]="Listado de Calidades"
	OTROS[6]='ORDCAL'
  ULPR='LCALP'
	DO lmixp
CASE BAR()=11
	MENSAJE[7]=" CALIDAD"
	MENSAJE[8]=" DE CALIDADES"
	MENSAJE[9]="CAL"
	OTROS[3]=VCALR
	OTROS[4]=VCALC
	OTROS[5]=VCALR+VCALLA
	OTROS[6]=VCALC+VCALAN
	DO vmix
CASE BAR()=13
	ulpr='XCAL'
	DO rndx1 WITH 16,20
	ON SELE POPU rndx DO xmix
	ACTI POPU rndx
	RELE POPU rndx
ENDCASE
ULPR=PROGRAM()
UNLO ALL
RETURN MEN_LIN(BOTOM)
