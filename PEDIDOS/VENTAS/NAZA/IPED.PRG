**********************************************************************
*-- Programa: IPED
*-- Fecha   : 08-04-92 04:02pm
*-- Versi¢n : G. REINER
*-- Notas   : GENERACION DIRECTA DE NOTA DE PEDIDO
*-- Modificaci¢n GOYO 07-23-92 01:11am marca  -> empresa
*-- Modificaci¢n GOYO 08-04-92 04:03pm adaptacion de facx a iped
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STOR .T. TO salir
	DO WHIL .T.
		RELE TALE,FAXT,fechas,montocuot,fec,nad
		picu="99999999999.99"
		faxt=.f.
		=win1()
		pag=1
		=cabpan()
		REBLA=CUADRO("4 7 23 0 1 16 34 11 14")
		@ 8,1 SAY "ARTICULO"
		@ 8,18 SAY "MERCADERIA"
		@ 8,36 SAY "TAL/CUR"
		@ 8,44 SAY "CANTIDAD"
		@ 8,53 SAY "PRECIO UNI."
		@ 8,66 SAY "PRECIO TOTAL"
		c1=1
		c2=18
		c3=36
		c4=44
		c5=53
		c6=65
		@ 1,1 SAY "Cliente:"
		@ 5,1 SAY "Empresa   :"
		@ 6,1 SAY "Pedido  N§:"
		@ 1,45 SAY "Viajante:"
		@ 2,45 SAY "Cond. Pago:"
		@ 4,45 SAY "Fecha de emisi¢n:"
		STOR .T. TO sigue
		STOR .F. TO fuera
		STOR NUL TO pretot
		sele PED
		scat memv blan
		SELE PER
		STOR NUL TO respuesta,CANART
		IF !empty(elicli(" - [ESC] para Salir",2,0))
			m.codcli=PER.codcli
			m.zona =PER.zona
			m.clipre=PER.precio
			m.cliiva=PER.condiva
			acti wind win
			@ 1,1 SAY Alltrim(PER.codcli)+" "+Alltrim(PER.cliente)
			@ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
			=XSEEK(PER.localidad,'MIX','CIUCOD')
			nada=mix.texto1
			=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
			@ 3,1 SAY Alltrim(nada)+" "+Alltrim(mix.texto1)
			@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+" "+Alltrim(PER.nroiva)
			if LASTKEY()#27
				SELE MIX
				STOR NUL TO respuesta
				IF !empty(eliemp(' [ESC] para Men£ ',2,53))
					STOR 1 TO m.marca,nadmar
					nada=JANNAME
					acti wind win
					@ 5,13 SAY JANNAME
					PUNMAR=(M.MARCA-1)*20+1
					GOTO PUNMAR IN DOC
					STOR DOC.NUMERO TO m.pedido
					@ 6,13 GET M.pedido
					READ
					SELE PED
					if !SEEK(m.pedido) .AND. !EMPTY(M.pedido)
						NADREM=M.pedido
						SELE via
						STOR NUL TO respuesta
						IF !empty(elivia("",5,11))
							m.codvia=via.codvia
							acti wind win
							@ 1,54 SAY m.codvia
							SELE vix
							if xSEEK(m.codvia+'01'+m.zona,'vix','viajadat')
								SELE mix
								STOR NUL TO respuesta
								IF !empty(elipag("",6,13))
									m.condpago=left(mix.texto2,2)
									stor mix.texto1 TO nada
									NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
									NADA1=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
									acti wind win
									@ 2,57 GET nada1
									clea GETS
									STOR nada1 TO m.conpago
									STOR {01/01/80} TO nada1
									STOR DATE() TO nada2,fechaem
									STOR xauss TO nada9
									STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
									@ 4,62  GET m.fechaem PICT "@D" RANGE nada1,nada2;
									MESS "Fecha de emisi¢n del Pedido - [ESC] para Salir"
									READ
									IF LASTKEY()=27
										=RELEwin('win')
										EXIT
									ENDI
									ren=10
									STORE NUL TO PUNTERO
									=iped1()
								ELSE
									=RELEwin('win')
									EXIT
								ENDI                             && COND. PAGO
							ELSE
								DO cartel2 WITH "VIAJANTE","NO","AUTORIZADO","CORRIJA E INTENTE NUEVAMENTE"
								=relewin('win')
								EXIT
							ENDI
						ENDI
					ELSE
						DO cartel2 WITH "EL NUMERO DE PEDIDO"+STR(m.pedido),"CORRESPONDE A UNA ","YA EXISTENTE",""
						LOOP
					ENDI
				ELSE
					=RELEwin('win')
					EXIT
				ENDI
			ELSE
				=RELEwin('win')
				EXIT
			ENDI
		ELSE
			=RELEwin('win')
			acti SCRE
			EXIT
		ENDI
		IF ISARRAY(@FAXT)
			IF !empty(ALEN(FAXT,1))
				MONTO=PRETOT
				DO WHIL .T.
					IF FLOCK("ped")
						STOR NUL TO neto,moiva,moot2,moot3,bruto,nada8
						stor 1 to sidis,nodis
						for a=1 to 3
							IF !EMPTY(xaci[A])
								if xaciva[m.cliiva,a*2+1]="SI"
									store (1+(xaciva[m.cliiva,a*2]/100))*sidis to sidis
								else
									store (1+(xaciva[m.cliiva,a*2]/100))*nodis to nodis
								endif
							endif
							endfor
							STOR " " TO nada2
							STOR NUL TO nada3
							=xseek(m.condpago,'mix','pagcod')
							STOR mix.texto1 TO nada2,nax1
							NAx1=TRANSF(NAx1,"@R 999-999-999-999-999-999")
							NAx=len(ALLTRIM(STRTRAN(nax1,'-000',SPACE(4))))
							IF CONFIRM1("el Pedido",.T.,20,30)
								=MEN_LIN(GRABANDO)
								registro=str(PUNMAR)
								DO LOK WITH "DOC"
								GO PUNMAR IN DOC
								REPL DOC.NUMERO WITH M.pedido+1
								UNLO IN DOC
								=AGRABAR("PED")
								=AGRABAR("pex",@FAXT)
								SELE PEX
								=FLOCK("pex") .OR. FLOK("pex")
								*                     =XSEEK(STR(M.pedido)+STR(1),'PEX','pedido')
								=RELEWIN('WIN')
								acti SCRE
								*                     DO lPEDIF WITH .T.,.f.
								RELE TALE,FAXT
								STOR .F. TO salir
								M.pedido=M.pedido+1
								EXIT
							ELSE
								EXIT
							ENDI
						ELSE
							=MEN_LIN(ESPERE)
						ENDI
					ENDD
					IF salir
						EXIT
					ENDI
				ELSE
					EXIT
				ENDIF
			ELSE
				EXIT
			ENDIF
		ENDD
		deac wind ALL
	ELSE
		=iaudi()
	ENDI
	UNLO ALL
	=MEN_LIN(BOTOM)
RETURN
