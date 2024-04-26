********************************************************
*-- Programa: SENIA.PRG
*-- Fecha   : 01-26-92 05:13pm
*-- Versi¢n : G. REINER
*-- Notas   : RECEPCION DE SE¥A
*-- Modificaci¢n GOYO 07-23-92 01:11am marca -> empresa
********************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR nul TO kok
	DO WHIL .T.
		DO win1
		picu="99999999999.99"
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
		@ 5,1 SAY "Marca     :"
		@ 6,1 SAY "Factura N§:"
		@ 1,45 SAY biaja+":"
		@ 2,45 SAY "Cond. Pago:"
		@ 4,45 SAY "Fecha de emisi¢n:"
		@ 5,45 SAY "Moneda en que se factura:"
		@ 6,45 SAY "Cotizaci¢n:"
		STOR .T. TO sigue
		STOR .F. TO fuera
		DIME carga[3]
		STOR nul TO carga,pretot
		SELE fac
		SCAT MEMV BLAN
		SELE PER
		STOR nul TO respuesta
		IF !EMPTY(elicli(" - [ESC] para Salir",2,nul))
			IF !EMPTY(xaciva[PER.condiva,1])
				m.codcli=PER.codcli
				m.zona =PER.zona
				m.clipre=PER.precio
				m.cliiva=PER.condiva
				ACTI WIND win
				@ 1,1 SAY ALLTRIM(PER.codcli)+" "+ALLTRIM(PER.cliente)
				@ 2,1 SAY ALLTRIM(PER.domicilio)+" T.E."+ALLTRIM(PER.telefonos)
				=xseek(PER.localidad,'mix','ciucod')
				nada=mix.texto1
				=xseek(right(mix.texto2,2),'mix','prvcod')
				@ 3,1 SAY ALLTRIM(nada)+" "+ALLTRIM(mix.texto1)
				@ 4,1 SAY ALLTRIM(xaciva(PER.condiva,1))+" "+ALLTRIM(PER.nroiva)
				IF LASTKEY()#27
					STOR nul TO respuesta
					IF !EMPTY(eliemp(' [ESC] para Men£ ',2,53))
						STOR 1 TO m.marca,nadmar
						nada=mix.texto1
						@ 5,13 SAY janname
						PUNMAR=(M.MARCA-1)*20+5
						GOTO punmar IN doc
						STOR doc.numero TO m.factura
						@ 6,13 get m.factura
						read
						SELE fac
						IF !SEEK(STR(m.factura)+STR(m.marca)) .and. !empty(m.factura)
							m.nadfac=m.factura
							SELE via
							STOR nul TO respuesta
							IF !EMPTY(elivia("",5,11))
								m.codvia=via.codvia
								ACTI WIND win
								@ 1,54 SAY m.codvia
								if xSEEK(m.codvia+'01'+m.zona,'vix','viajadat')
									STOR nul TO respuesta
									IF !EMPTY(elipag("",6,13))
										m.condpago=left(mix.texto2,2)
										STOR mix.texto1 TO nada
										nada=TRANSF(nada,"@R 999-999-999-999-999-999")
										nada1=ALLTRIM(STRTRAN(nada,'-000',SPACE(4)))
										ACTI WIND win
										@ 2,57 GET nada1
										CLEA GETS
										STOR nada1 TO m.conpago
										STOR CTOD("01/01/80") TO nada1
										STOR DATE() TO nada2,fechaem
										STOR xauss TO nada9
										STOR "@M "+ALLTRIM(xauss)+","+ALLTRIM(xadols) TO nn
										@ 4,62  GET m.fechaem PICT "@D" RANGE nada1,nada2;
										MESS "Fecha de emisi¢n de la Factura - [ESC] para Salir"
										READ
										IF LASTKEY()=27
											RELE WIND win
											EXIT
										ENDI
										@ 5,70 GET nada9 PICT nn MESS "Moneda en que se Factura"
										READ
										STOR xacotiz TO nada10
										@ 6,56 GET nada10 PICT picu MESS "Cotizaci¢n de la fecha - [ESC] para Salir"
										READ
										UNLO IN fac
										ren=9
										namer=nul
										STOR .T. TO CONTI
										SELE fax
										SCAT MEMV BLANK
										m.factura=nadfac
										m.marca=nadmar
										m.usacurva="  "
										ren=ren+1
									ELSE
										RELE WIND win
										EXIT
									ENDI
								ELSE
									DO cartel2 WITH UPPER(biaja),"NO","AUTORIZADO","CORRIJA E INTENTE NUEVAMENTE"
									RELE WIND win
									kok=nul
									EXIT
								ENDI
							ENDI
						ELSE
							DO cartel2 WITH "EL NUMERO DE FACTURA"+STR(m.factura),"CORRESPONDE A UNA ","YA EXISTENTE",""
							LOOP
						ENDI
					ELSE
						RELE WIND win
						EXIT
					ENDI
				ELSE
					RELE WIND win
					EXIT
				ENDI
			ELSE
				DO cartel2 WITH 'Condici¢n de I.V.A. del Cliente',ALLTRIM(PER.cliente),'NO EXISTE','POR FAVOR, CORRIJA Y REINTENTE'
				RELE WIND win
				ACTI SCRE
				EXIT
			ENDI
			IF sigue                                   && OJO
				ACTI WIND WIN
				@ 10,18 SAY "SE¥A"
				@ 10,65 GET PRETOT PICT PICU MESS 'Monto de la Se¤a Entregada'
				read
				STOR 40 TO col1
				STOR 60 TO col2
				if pretot>0
					STOR nul TO neto,moiva,moot2,moot3,bruto,nada8
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF !EMPTY(xaciva[m.cliiva,A*2])
								IF xaciva[m.cliiva,A*2+1]="NO"
									neto=pretot
									nada8=nada8+(xaciva[m.cliiva,A*2]/100)
									bruto=ROUND(neto/(1+nada8),2)
									moiva=ROUND(bruto*xaciva[m.cliiva,2]/100,2)
									moot2=ROUND(bruto*xaciva[m.cliiva,4]/100,2)
									moot3=ROUND(bruto*xaciva[m.cliiva,6]/100,2)
								ELSE
									bruto=pretot
									IF A=1
										moiva=porcen(pretot,xaciva[A*2])-pretot
									ELSE
										IF A=2
											moot2=porcen(pretot,xaciva[A*2])-pretot
										ELSE
											IF A=3
												moot3=porcen(pretot,xaciva[A*2])-pretot
											ENDI
										ENDI
									ENDI
									neto=ROUND(bruto+moiva+moot2+moot3,2)
								ENDI
							ENDI
						ENDI
					NEXT
					IF nada9#xamoneda
						IF xamoneda=xauss
							STOR ROUND(moiva*nada10,2) TO moiva
							STOR ROUND(moot2*nada10,2) TO moot2
							STOR ROUND(moot3*nada10,2) TO moot3
						ENDI
					ELSE
						IF xamoneda=xadols
							STOR ROUND(moiva*nada10,2) TO moiva
							STOR ROUND(moot2*nada10,2) TO moot2
							STOR ROUND(moot3*nada10,2) TO moot3
						ENDI
					ENDI
					IF nada9=xauss
						STOR neto-(bruto+moiva+moot2+moot3) TO nada
						IF !EMPTY(nada)
							STOR (bruto+nada) TO bruto
						ENDI
					ENDI
					STOR " " TO nada2
					STOR nul TO nada3
					=xseek(m.condpago,'mix','pagcod')
					STOR mix.texto1 TO nada2
					STOR 1 TO i
					FOR A=4 TO 16 STEP 3
						STOR VAL(SUBSTR(nada2,A,3)) TO nada5
						IF EMPTY(nada5)
							EXIT
						ENDI
						STOR i+1 TO i
					NEXT
					DEFINE WIND win1 FROM 7,0 TO 16+i,79 TITL "Condiciones de Pago" SHAD COLOR SCHEME 8
					ACTI WIND win1
					rng=1
					@ rng,2 SAY "FECHA DE EMISION: " GET m.fechaem PICT "@D"
					@ RNG,col1 SAY "MONTO NETO A PAGAR: "
					@ RNG,col2 GET neto PICT picu
					STOR rng+1 TO j
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF !EMPTY(xaciva[m.cliiva,A*2])
								@ j,col1 SAY xaci[A]+": "
								xax=IIF(A=1,moiva,IIF(A=2,moot2,moot3))
								@ j,col2 GET xax PICT picu
								STOR j+1 TO j
							ENDI
						ENDI
					NEXT
					CLEA GETS
					DIME fec[6]
					STOR {} TO fec
					ant=j+2
					STOR ant TO j
					STOR 1 TO posfec
					STOR i*3 TO i
					FOR A=1 TO i STEP 3
						STOR m.fechaem TO nada1
						STOR VAL(SUBSTR(nada2,A,3)) TO nada6
						STOR nada6+nada1 TO nada1
						IF EMPTY(VAL(SUBSTR(nada2,A,3))) .AND. i=3
							@ j,2 SAY "CUOTA " GET nada1 PICT "@D" MESS "Fecha de vencimiento de la factura"
							STOR nada1 TO nada11
							STOR nada1 TO fec[1]
							EXIT
						ELSE
							@ j,2 SAY "CUOTA "+STR(posfec,1)+": " GET nada1 PICT "@D" MESS "Fecha de vencimiento de la factura"
							STOR nada1 TO nada11
							STOR nada1 TO fec[POSFEC]
							posfec=posfec+1
						ENDI
						STOR j+1 TO j
					NEXT
					CLEA GETS
					DIME nad[7]
					STOR i/3 TO i
					ant1=ant
					IF i#1
						STOR ROUND(neto/i,2) TO nad
						DO WHIL .T.
							STOR nul TO nada,K
							DO WHIL K<i
								STOR K+1 TO K
								@ ant,col1 SAY "MONTO "+STR(K,1)+": "
								@ ant,col2 GET nad[K] PICT picu
								STOR nada+nad[K] TO nada
								ant=ant+1
							ENDD
							IF nada#neto
								STOR neto-nada TO nada
								STOR nad[1]+nada TO nad[1]
								@ ant1,col2 GET nad[1] PICT picu
							ENDI
							CLEA GETS
							ACTI SCRE
							@ 24,nul say PADC("Confirme/Modifique el monto",80)
							ACTI WIND win1
							STOR nul TO K,nada2
							ant1=ant1-1
							DO WHIL K<i
								STOR K+1 TO K
								@ ant1+K,col2 GET nad[K] PICT picu
								READ
								STOR ROUND(nada2+nad[K],2) TO nada2
							ENDD
							IF nada2=neto
								STOR K TO nad[7]
								EXIT
							ENDI
							?? CHR(7)
						ENDD
					ELSE
						STOR 1 TO nad[7]
						@ 2,col1 SAY "MONTO BRUTO: "
						@ 2,col2 GET bruto PICT picu
						STOR 2 TO i
						FOR A=1 TO 3
							IF !EMPTY(xaci[A])
								IF !EMPTY(xaciva[m.cliiva,A*2])
									STOR i+1 TO i
									@ i,col1 SAY xaci[A]+": "
									xax=IIF(A=1,moiva,IIF(A=2,moot2,moot3))
									@ i,col2 GET xax PICT picu
								ENDI
							ENDI
						NEXT
						STOR i+1 TO i
						@ i,col1 SAY "MONTO NETO A PAGAR: "
						@ i,col2 GET neto PICT picu
						CLEA GETS
						STOR neto TO nad[1]
					ENDI
					IF confirma("la Factura",.T.,20,30)
						=FLOCK("FAC") .OR. FLOK("FAC")
						SELE fac
						APPE BLAN
						m.fecha=DATE()
						m.usuario=usador
						GATH MEMV
						SELE fac
						REPL fac.fechave WITH nada11
						REPL fac.montobru WITH bruto, fac.montoiva WITH moiva, fac.montoot2 WITH moot2
						REPL fac.montoot3 WITH moot3, fac.montonet WITH neto,fac.descuento WITH m.descuento
						REPL fac.moneda WITH nada9, fac.cotiz WITH nada10,fac.monto WITH m.monto
						RELE WIND win1
						RELE CHEQUE
						DIME cheque[3,4]
						STOR NUL TO tarjeta,cheques,efecaus,efecdol,sumpag,cheque,NUTAR,TARTAR,senia,senia1
						DO icobp WITH neto,.F.
						SELE DOC
						registro=STR(punmar)
						=LOCK() .OR. lok("DOC")
						GO punmar IN doc
						REPL doc.numero WITH nadfac+1
						m.factura=m.factura+1
						UNLO IN doc
						DEFI WIND win1 FROM 7,9 TO 13,70 TITL " DATOS DEL CLIENTE " DOUB SHAD COLO SCHE 8
						ACTI WIND win1
						STORE SPACE(40) TO CLNAME,CLADRE
						STORE PADR("ROSARIO",40) TO CLLOCA
						@ 1,1 SAY 'APELLIDO Y NOMBRE' GET CLNAME
						@ 2,1 SAY 'DOMICILIO        ' GET CLADRE
						@ 3,1 SAY 'LOCALIDAD        ' GET CLLOCA
						READ
						RELE WIND WIN1
						ACTI SCRE
						IF .t.
							ACTI SCRE
							DO lfacB WITH .T.
						ENDI
						UNLO IN fac
						STOR .F. TO salir
						EXIT
					ELSE
						STOR .F. TO salir
					ENDI
					IF salir
						EXIT
					ENDI
				ELSE
					EXIT
				ENDI
			ELSE
				EXIT
			ENDI
		ELSE
			EXIT
		ENDI
	ENDD
	DEAC WIND ALL
ELSE
	=iaudi()
ENDI
=MEN_LIN(BOTOM)
RETURN
