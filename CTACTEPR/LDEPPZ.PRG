********************************************************************************
*-- Programa: LDEPPZ.PRG
*-- Fecha   : 06-17-92 09:44am
*-- Version : G. REINER
*-- Notas   : IMPRESION DE DEUDA POR PANTALLA
********************************************************************************
stor hora_ulp(PROGRAM()) TO ulpr
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
	hay=.f.
	STORE NUL TO ACLA,CASOS,LINEA,ELPRO,TT
	=LDEPPZ0()
	=WIN0()
	pag=1
	=cabpan()
	tt='Listado de Deuda Pendiente Proveedores'+CHR(13)+CHR(10)+TTQUE+CHR(13)+CHR(10)+ALLTRIM(ELPRO)
	=tit_lin(1)
	SCAN
		IF PRO.PROVEEDOR#ELPRO .AND. HAY
			IF !FIN_LIN(1,NUL,FIN_SUM(ALLTRIM(ELPRO),@PTL))
				EXIT
			ENDIF
			ELPRO=PRO.PROVEEDOR
			STORE 0 TO PTL[5]
			tt='Listado de Deuda Pendiente Proveedores'+CHR(13)+CHR(10)+TTQUE+CHR(13)+CHR(10)+ALLTRIM(ELPRO)
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(1)
		ENDIF
		IF ROW()>21
			IF HAY
				IF !FIN_LIN(1,NUL,FIN_SUM('SUBTOTAL',@TTL))
					EXIT
				ENDIF
			ELSE
				IF !FIN_LIN(1,NUL)
					EXIT
				ENDIF
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		=LDEPPZ1()
	ENDSCAN
	if last()#27
		IF HAY
			=FIN_LIN(1,NUL,FIN_SUM(ALLTRIM(ELPRO),@PTL))
			=FIN_LIN(2,casos,FIN_SUM('TOTAL',@TTL))
		ELSE
			=FIN_LIN(2,casos)
		ENDIF
	ENDIF
	=RELEWIN('win')
	=REOPCCP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
