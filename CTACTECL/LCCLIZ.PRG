********************************************************************************
*-- Programa: LCCLIZ.PRG
*-- Fecha   : 05-25-92 05:28pm
*-- Version : G. REINER
*-- Notas   : IMPRESION CUENTAS CORRIENTES POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO TTL,CTRL,ACLA,LINEA,TT
	STORE .T. TO HAY
	=LCCLPZ1()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_(3)
	GO TOP
	ELCLI=CCL.CODCLI
	ELCLI1=PER.CLIENTE
	STORE 0 TO DB,HB,CUT
	? ELCLI1
	?? ":"
	?? ELCLI
	=_LIN(.T.)
	SCAN
		IF ELCLI#CCL.CODCLI
			=LCCL22()
			ELCLI=CCL.CODCLI
			ELCLI1=PER.CLIENTE
			STORE 0 TO DB,HB,CUT
			? linea
			IF _PLINENO<59
				? ELCLI1
				?? ":"
				?? ELCLI
				=_LIN(.T.)
			ENDIF
		ENDIF
		IF _PLINENO>63
			=LCCLPZ2(1,NUL,'SUBTOTAL')
			EJECT PAGE
			=cabpri1()
			=TIT_(4)
			? ELCLI1
			?? ":"
			?? ELCLI
			=_LIN(.T.)
		ENDI
		=LCCLPZ0()
	ENDSCAN
	ENDP
	=LCCL22()
	=LCCLPZ2(2,casos,'TOTAL')
	EJECT PAGE
	=FINIMP()
	=iaud(FISC)
	=reopccl()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)

FUNCTION LCCL22
	VEZ=1
	? LINEA
	? PAIP
	FOR A=1 TO CANT_MAX
		IF VARIABLE[A]
			IF VEZ=1
				VEZ=2
				?? PADR(ELCLI,TEXTO[A,2])
				?? PAIP
			ELSE
				IF CTRL[A]
					IF A=8
						?? STR(DB,XACDIGI,2)
						?? PAIP
						?? STR(HB,XACDIGI,2)
						?? PAIP
						?? STR(CUT,XACDIGI,2)
						?? PAIP
						?? STR(DB-HB,XACDIGI,2)
						?? PAIP
					ELSE
						?? SPACE(XACDIGI)
						?? PAIP
					ENDIF
				ELSE
					?? SPACE(TEXTO[A,2])
					?? PAIP
				ENDIF
			ENDIF
		ENDIF
	NEXT
RETURN .T.
