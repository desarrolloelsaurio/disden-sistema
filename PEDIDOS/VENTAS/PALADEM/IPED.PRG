********************************************************************
*-- Programa: IPED.PRG
*-- Fecha   : 04-30-92 03:26pm
*-- Versi¢n : G. REINER
*-- Notas   : GENERA PEDIDO A CLIENTES
*--	Modificaci¢n GOYO 12-17-92 13:00am (Correcci¢n Grabacion en FAX)
*-- Modificaci¢n GOYO 01-12-93 01:47pm (Adapt. de remito a Pedido)
**********************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	DO WHIL .T.
		STOR NUL TO kok,PUNTERO
		picu="9999999999.99"
		=win1()
		ACTI WIND WIN
		ULPR=PROGRAM()
		=cabpan()
		store 1 to pag,c1,NADPED
		c2=12
		c3=43
		store 52 to c4,c5
		c6=63
		REBLA=remImask(.t.,.t.)
		STOR .T. TO sigue
		STOR .F. TO fuera
		DIME carga[3]
		STORE '' TO ARTANT
		ON KEY LABEL TAB KEYBOARD ARTANT
		stor nul to respuesta,carga,pretot,CANTOT,CLIPRE,NADA9,NADA10,PUNMAR
		IF !EMPTY(jannro)
			SELE PED
			SCAT MEMV BLAN
			IF FORGRL("PEDIDO",1,"PED","PEDIDO")
				ren=9
				RELE REXITO
				STORE NUL TO PUNTERO,NAMER,rexito
				if iped1()
					exit
				ENDI
			ELSE
				EXIT
			ENDI                                       && COND. PAGO
		ENDIF
		IF !empty(PUNTERO) .and. !empty(pretot)      && OJO
			IF sigue
				IF confirma("el PEDIDO",.T.,20,30)
					m.fecha=DATE()
					m.usuario=usador
					m.valoriz=masiva(pretot,PER.condiva)
					=agrabar("PED")
					STORE RECNO() TO naregi
					=AGRABAR('PEX',@REXITO)
					SELE DOC
					m.PEDIDO=m.NADPED+1
					registro=str(PUNMAR)
					=LOCK() .OR. LOK("DOC")
					REPL DOC.NUMERO WITH M.PEDIDO
					UNLO IN DOC
					=RELEWIN('WIN')
					acti SCRE
					IF LEFT(JANNAME,5)="ANTON"
						DO lPEDiGA WITH .T.,.f.
					ENDIF
					STOR .F. TO salir
				ELSE
					EXIT
				ENDI
			ENDI
		endif
	enddo
ELSE
	=iaudi()
ENDI
UNLO ALL
=MEN_LIN(BOTOM)
ON KEY LABEL TAB
DEAC WIND ALL
RETURN
