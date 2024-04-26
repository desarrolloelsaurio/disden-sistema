*************************************************
*-- Programa: lisofe4.prg
*-- Fecha   : 12/20/90 08:18pm
*-- Version : G. REINER
*-- Notas   : listado de ofertas - por teclado
************************************************
STOR NUL TO RESPUESTA
DEFI POPU aud FROM 7,25 MESS 'Imprime Membrete ? '
DEFI BAR 1 OF aud PROM ' 1. Imprime Membrete'
DEFI BAR 2 OF aud PROM ' 2. Sin Membrete'
ON SELE POPU aud DO resp1
ACTI POPU aud
IF !EMPTY(RESPUESTA)
	memb=respuesta
	SET ESCA ON
	ON ESCAPE DO aboprin
	prm=""
	IF !PRIN()
		DO impresor
	ENDI
	DEFI WIND win FROM 10,0 TO 14,79 DOUB
	=INIPRIN()
	finmer=RECCOUNT("MER")
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
	DO WHIL .T.
		STOR NUL TO RESPUESTA
		SET DEVICE TO SCRE
		DO infic WITH finmer,"Producto a Listar"
		IF !EMPTY(RESPUESTA)
			GO respuesta
			IF LEN(ALLT(artic))#3
				respuesta='SI'
				ACTI WIND win
				@ 1,1 SAY artic
				@ 1,25 SAY detalle
				@ 1,60 SAY 'CONFIRMA ? ' GET respuesta PICT '@M SI,NO'
				READ
				DEAC WIND win
				IF respuesta="SI"
					SET DEVICE TO PRINT
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
					ENDI
				ENDI
			ENDI
		ELSE
			EXIT
		ENDI
	ENDD
	***
	=SAYTEX_2()
	EJECT PAGE
	ENDP
	=FINIMP()
	RELE WIND win
ENDI
RELE POPU aud
RETURN
