********************************************************************************
*-- Programa: LCIUP.PRG
*-- Fecha   : 06/10/91 11:28am
*-- Version : G. REINER
*-- Notas   : LISTADO DE CIUDADES POR PANTALLA
*-- VERSION BALCALA/RAFULS
********************************************************************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

ulpr=hora_ulp(program())
if cheqseg()
	SELE mix
	SET ORDER TO TAG IIF(TYPE("ORDCIU")='U' .OR. ORDCIU,'CIUCOD','CIUTEX')
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	acla='|POS.|CODIGO|'+PADC("CIUDAD",20)+paip+PADC("PROVINCIA",20)+'|C.P.|C.TEL|'
	m.linea=REPL("=",LEN(acla))
	tt='Listado de Ciudades'
	=tit_lin(1)
	SCAN
	#IF "Win" $ vers()
		IF ROW()>(WROWS()-4)
	#ELSE
		IF ROW()>21
		#ENDIF
			if !fin_lin(1,nul)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=tit_lin(2)
		ENDIF
		scat memv
		M.REGANT=RECNO()
		NADA=IIF(xseek(RIGHT(m.TEXTO2,2),'mix','prvcod'),MIX.TEXTO1,SPACE(20))
		GO M.REGANT
		? PAIP
		?? STR(RECNO(),4)
		?? paip
		?? SubsTR(M.TEXTO2,7,6)
		?? PAIP
		?? m.texto1
		?? paip
		?? nada
		?? paip
		?? SubsTR(M.TEXTO2,7,6)
		?? paip
		?? LEFT(m.texto2,5)
		?? PAIP
		stor casos+1 TO casos
	ENDSCAN
	=fin_lin(2,casos)
	=RELEWIN('win')
=IAUD("")
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
