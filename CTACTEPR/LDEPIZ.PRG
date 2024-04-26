********************************************************************************
*-- Programa: LDEPIZ.PRG
*-- Fecha   : 10-16-92 02:34pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE DEUDA PENDIENTE A PROVEEDORES
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	dime ttl[CANT_MAX],ctrl[CANT_MAX],PTL[CANT_MAX]
	hay=.f.
	STORE NUL TO ACLA,CASOS,LINEA,ELPRO,TT
	=LDEPPZ0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF PRO.PROVEEDOR#ELPRO .AND. HAY
			IF !FIN_LIN(3,NUL,FIN_SUM(ALLTRIM(ELPRO),@PTL))
				EXIT
			ENDIF
			ELPRO=PRO.PROVEEDOR
			STORE 0 TO PTL[5]
			tt='Listado de Deuda Pendiente Proveedores'+CHR(13)+CHR(10)+TTQUE+CHR(13)+CHR(10)+ALLTRIM(ELPRO)
			=cabpri1()
			=TIT_LIN(3)
		ELSE
			IF _PLINENO>63
				IF HAY
					IF !FIN_LIN(3,NUL,FIN_SUM('SUBTOTAL',@TTL))
						EXIT
					ENDIF
				ELSE
					IF !FIN_LIN(3,NUL)
						EXIT
					ENDIF
				ENDIF
				=cabpri1()
				=TIT_LIN(4)
			ENDI
		ENDIF
		=LDEPPZ1()
	ENDSCAN
	IF HAY
		=FIN_LIN(3,NUL,FIN_SUM(ALLTRIM(ELPRO),@PTL))
		=FIN_LIN(4,casos,FIN_SUM('TOTAL',@TTL))
	ELSE
		=FIN_LIN(4,casos)
	ENDIF
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPCCP()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
