*******************************************************
*-- Programa: lisofe3.prg
*-- Fecha   : 12/20/90 08:17pm
*-- Version : G. REINER
*-- Notas   : listado de ofertas - por caracteristica
******************************************************
STOR NUL TO RESPUESTA
DEFI POPU aud FROM 7,25 MESS 'Imprime Membrete ? '
DEFI BAR 1 OF aud PROM ' 1. Imprime Membrete'
DEFI BAR 2 OF aud PROM ' 2. Sin Membrete'
ON SELE POPU aud DO resp1
ACTI POPU aud
IF !EMPTY(RESPUESTA)
	memb=respuesta
	GO TOP
	LOCATE FOR &fisc
	IF !EOF()
		prm=""
		IF !PRIN()
			DO impresor
		ENDI
		=INIPRIN()
		PRIN
		_WRAP=.F.
		***********
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
		************
		SCAN WHIL &fisc
			IF !EMPTY(detalle)
				IF LEN(ALLT(artic))=3
					psc=RECNO()
					ttx=detalle
				ELSE
					IF SUBSTR(artic,2,2)#"XX"
						IF prm#LEFT(artic,3)
							prm=LEFT(artic,3)
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
						ENDI
						IF EMPTY(MER.PROPAG)
							? detalle
						ELSE
							XX=ALLT(DETALLE)+':'
							IF LEN(XX)<40
								XX=PADR(XX,40)
							ENDI
							? XX
						ENDI
						?? ' '
  					?? STR(Q_precio(),10,2)
						A=IMP_PRO()
						IF _PLINENO>60
							***********
							=SAYTEX_2()
							EJECT PAGE
							_WRAP=.T.
							=SAYTEX_1(m.texto1,m.texto2,.T.)
							_WRAP=.F.
							?
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
						ENDI
					ENDI
				ENDI
			ENDI
		ENDS
		***
		=SAYTEX_2()
		EJECT PAGE
		ENDP
		=FINIMP()
	ENDI
ENDI
RELE POPU aud
RETURN
