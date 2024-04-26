***************************************************
*-- Programa: LcajPZ.PRG
*-- Fecha   : 05-04-92 03:48pm
*-- Version : R. 'EL BATA'/G. REINER
*-- Notas   : IMPRESION DE caja POR PANTALLA
****************************************************
STORE HORA_ulp(program()) to ulpr
if cheqseg()
	STORE "" TO TTL,CTRL,HAY,CASOS,ACLA,LINEA,TT
	=LCAJPZ0()
	=WIN0()
	pag=1
	=cabpan()
	GO TOP
	ELGAS=CAJ.GASTO
	ELGAS1=iif(xseek(ELGAS,'mix','gascod'),MIX.texto1,"")
	=IIF(paracual="P",tit_LIN(1,ELGAS+":"+ALLTRIM(ELGAS1)),TIT_LIN(1))
	SCAN
		IF ROW()>21 .OR. ELGAS#CAJ.GASTO
			IF !tlcajpz(1,NUL,'SUBTOTAL')
				EXIT
			ENDIF
			if ELGAS#CAJ.GASTO .AND. variable[9]
				STOR NUL TO ttl[9],TTL[10],TTL[11]
				store .t. to hay
			endif
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			ELGAS=CAJ.GASTO
			ELGAS1=iif(xseek(ELGAS,'mix','gascod'),MIX.texto1,"")
			=IIF(paracual="P",tit_LIN(2,ELGAS+":"+ALLTRIM(ELGAS1)),TIT_LIN(2))
		ENDIF
		=lcajpz1()
	ENDSCAN
	if last()#27
		=tlcajpz(2,casos,'TOTAL')
	endif
	=opcaj(JANNRO,.F.,.T.)
	=iaud(FISC)
	=RELEWIN('win')
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)

function tlcajpz
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
		=INKEY(NUL,'HM')
	endif
return last()#27
