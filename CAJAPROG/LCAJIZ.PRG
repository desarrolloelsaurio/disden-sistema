***************************************************
*-- Programa: LcajIZ.PRG
*-- Fecha   : 07-17-92 10:50am
*-- Version : R. 'EL BATA'/G. REINER
*-- Notas   : IMPRESION DE caja POR IMPRESORA
****************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	STORE "" TO TTL,CTRL,HAY,CASOS,ACLA,LINEA,TT
	=LCAJPZ0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_(3)
	GO TOP
	ELGAS=CAJ.GASTO
	ELGAS1=iif(xseek(ELGAS,'mix','gascod'),MIX.texto1,"")
	IF PARACUAL="P"
		? ELGAS
		?? ":"
		?? ELGAS1
	ENDIF
	=_LIN(.T.)
	SCAN
		IF ELGAS#CAJ.GASTO
			ELGAS=CAJ.GASTO
			ELGAS1=iif(xseek(ELGAS,'mix','gascod'),MIX.texto1,"")
			? linea
			IF _PLINENO<59
				? ELGAS
				?? ":"
				?? ELGAS1
				=_LIN(.T.)
			ENDIF
		ENDIF
		IF _PLINENO>63
			=tlcajiz(1,NUL,'SUBTOTAL')
			eject page
			=cabpri1()
			=tit_(4)
			IF PARACUAL="P"
				? ELGAS
				?? ":"
				?? ELGAS1
			ENDIF
			=_LIN(.T.)
		ENDIF
		=lcajpz1()
	ENDSCAN
	endp
	=tlcajiz(2,casos,'TOTAL')
	?
	=finimp()
	=opcaj(JANNRO,.F.,.T.)
	=iaud(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

function tlcajiz
	parameter cosa,COSA1,COSA2
	private cosa,COSA1,COSA2
	if !hay
	return fin_lin(cosa,COSA1)
else
	VEZ=1
	? LINEA
	? PAIP
	FOR A=1 TO CANT_MAX
		IF VARIABLE[A]
			IF VEZ=1
				VEZ=2
				?? PADR(COSA2,TEXTO[A,2])
				?? PAIP
			ELSE
				IF CTRL[A]
					?? STR(TTL[A],XACDIGI,2)+PAIP
				ELSE
					?? SPACE(TEXTO[A,2])+PAIP
				ENDIF
			ENDIF
		ENDIF
		ENDF
	endif
return .t.
