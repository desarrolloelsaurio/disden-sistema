***********************************
*-- Programa: lisprop2.prg
*-- Fecha   : 02-06-92 01:59am
*-- Version : G. REINER
*-- Notas   : listado de ofertas (m.texto de publicidad) - por proveedor
**********************************************************************
STOR NUL TO RESPUESTA
DEFI POPU aud FROM 7,25 MESS 'Imprime Membrete ? '
DEFI BAR 1 OF aud PROM ' 1. Imprime Membrete'
DEFI BAR 2 OF aud PROM ' 2. Sin Membrete'
ON SELE POPU aud DO resp1
ACTI POPU aud
IF !EMPTY(RESPUESTA)
	memb=respuesta
	GO TOP
	prm=""
	IF !PRIN()
		DO impresor
	ENDI
	=INIPRIN()
	PRIN
	_WRAP=.F.
	IF memb=1
		DO pagehead
		?
		?
	ENDI
	_WRAP=.T.
	_ALIGNMENT="CENTER"
	=SAYTEX_1(m.texto1,m.texto2)
	_WRAP=.F.
	?
	??? CHR(27)
	??? 'x1'
	SCAN FOR &fisc
		IF LEN(LTRIM(RTRIM(detalle)))#0
			IF LEN(LTRIM(RTRIM(artic)))=3
				psc=RECNO()
				ttx=detalle
			ELSE
				IF SUBSTR(artic,2,2)#"XX"
					IF prm#LEFT(artic,3)
						prm=LEFT(artic,3)
						IF _PLINENO>55
							=FINPROP2()
						ELSE
							?
							??? CHR(27)
							??? "x0"
							??? CHR(27)
							??? "~21"
							?? ttx
							??? CHR(27)
							??? "~20"
							??? CHR(27)
							??? "x1"
						ENDIF
					ENDI
					IF LEN(MER.PROPAG)=0
						? detalle
					ELSE
						XX=LTRIM(RTRIM(DETALLE))+':'
						IF LEN(XX)<40
							XX=PADR(XX,40)
						ENDI
						? XX
					ENDI

					?? ' '
					?? STR(Q_precio(),10,2)
					A=IMP_PRO()
					IF _PLINENO>60
						=FINPROP2(.T.)
					ENDI
				ENDI
			ENDI
		ENDI
	ENDSCAN
	vez=0
	TTX='VARIOS                                  '
	SET ORDER TO TAG proveedor
	LOCATE FOR &fisc1
	SCAN WHILE &fisc1
		IF !EMPTY(detalle)
			IF LEN(TRIM(RTRIM(artic)))#3
				IF SUBSTR(artic,2,2)='XX'
					IF vez=0
						vez=1
						?
						??? CHR(27)
						??? "x0"
						??? CHR(27)
						??? "~21"
						?? 'VARIOS                                  '
						??? CHR(27)
						??? "~20"
						??? CHR(27)
						??? "x1"
					ENDI
					IF LEN(MER.PROPAG)=0
						? detalle
					ELSE
						XX=LTRIM(RTRIM(DETALLE))+':'
						IF LEN(XX)<40
							XX=XX+SPACE(40-LEN(XX))
						ENDI
						? XX
					ENDI
					?? ' '
					?? STR(Q_precio(),10,2)
					A=IMP_PRO()
					IF _PLINENO>60
						=FINPROP2()
					ENDI
				ENDI
			ENDI
		ENDI
	ENDS
	***
	=SAYTEX_2()
	***
	EJECT PAGE
	ENDP
	=FINIMP()
ENDI
RELE POPU aud
RETURN

FUNCTION FINPROP2
	PARAMETER SINTIT
	=SAYTEX_2()
	EJECT PAGE
	_WRAP=.T.
	=SAYTEX_1(m.texto1,m.texto2,.T.)
	_WRAP=.F.
	?
	?
	IF !SINTIT
	??? CHR(27)
	??? "x0"
	??? CHR(27)
	??? "~21"
	?? ttx
	ENDIF
	??? CHR(27)
	??? "~20"
	??? CHR(27)
	??? "x1"
RETURN .T.
