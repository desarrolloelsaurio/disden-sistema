*********************************************************************************
*-- Programa: IDEB.PRG
*-- Fecha   : 09/27/91
*-- Versi¢n : V.LEEGSTRA
*-- Notas   : INGRESO DE NOTA DE DEBITO
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STOR NUL TO kok
	DO WHILE .T.
		define wind win FROM 1,nul TO 14,79 TITL "Nota de D‚bito" colo sche 8 shad
		=cabpan1()
		ACTI WIND win
		@ 1,1 SAY "Cliente:"
		@ 5,1 SAY "Marca     :"
		@ 6,1 SAY "Nota de D‚bito N§:"
		@ 2,42 SAY "Cond. Pago:"
		@ 4,42 SAY "Fecha de emisi¢n:"
		@ 5,42 SAY "Moneda en que se emite:"
		@ 6,42 SAY "Cotizaci¢n:"
		@ 8,1 SAY "N§ de la Factura relacionada:"
		@ 9,1 SAY "Monto:"
		@ 10,1 SAY "Concepto:"
		STOR NUL TO pretot,nadafac,nadamon
		stor SPACE(30) TO nadacon
		X30=repl("!",30)
		SELE fac
		SCAT memv BLAN
		SELE PER
		STOR NUL TO respuesta
		IF !EMPTY(elicli(" - [ESC] para Salir",2,0))
			m.codcli=PER.codcli
			m.zona  =PER.zona
			m.clipre=PER.precio
			m.cliiva=PER.condiva
			acti wind win
			nada=Alltrim(PER.codcli)
			nada1=Alltrim(PER.cliente)
			stor nada+" "+nada1 TO nada
			@ 1,1 GET nada
			CLEA GETS
			@ 2,1 SAY Alltrim(PER.domicilio) + " T.E." + Alltrim(PER.telefonos)
			=XSEEK(PER.localidad,"MIX",'CIUCOD')
			nada=mix.texto1
			=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
			@ 3,1 SAY Alltrim(nada)  + " " + Alltrim(mix.texto1)
			@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+ " " + Alltrim(PER.nroiva)
			IF LASTKEY()#27
				STOR NUL TO respuesta
				IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
					stor 1 TO m.marca,nadmar
					nada=JANNAME
					acti wind win
					@ 5,13 GET JANNAME
					PUNMAR=(M.MARCA-1)*20+5
					GO PUNMAR IN DOC
					REGISTRO=STR(PUNMAR)
					STOR doc.numero TO m.factura,nanodebi
					@ 6,20 GET m.factura
					read
					SELE fac
					SEEK (m.factura)
					IF !FOUND()
						SELE mix
						STOR NUL TO respuesta
						IF !EMPTY(elipag("",6,13))
							m.condpago=RECNO("mix")
							nada=mix.texto1
							acti wind win
							FOR A=4 TO 16 STEP 3
								stor VAL(SUBSTR(nada,A,3)) TO nada5
								IF EMPTY(nada5)
									stor SUBSTR(nada,1,A-1) TO nada
									stor SUBSTR(nada,1,3) TO nada1
									FOR I=4 TO A-1 STEP 3
										stor nada1+"-"+SUBSTR(nada,I,3) TO nada1
									NEXT
									EXIT
								ENDIF
							NEXT
							stor nada1 TO m.conpago
							@ 2,54 GET nada1
							CLEA GETS
							stor CTOD("01/01/80") TO nada1
							stor DATE() TO nada2,fechaem
							stor xauss TO nada9
							stor "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
							@ 4,60  GET m.fechaem pict "@D" RANGE nada1,nada2;
							MESS "Fecha de emisi¢n de la Nota de D‚bito- [ESC] para Salir"
							READ
							IF LASTKEY()=27
								=relewin("WIN")
								EXIT
							ENDIF
							@ 5,66 GET nada9 pict nn MESS "Moneda en que se emite"
							READ
							stor xacotiz TO nada10
							@ 6,54 GET nada10 pict "99999999999.99" MESS "Cotizaci¢n de la fecha - [ESC] para Salir"
							READ
							IF LASTKEY()=27
								=relewin("WIN")
								EXIT
							ENDIF
							@ 8,31 GET nadafac pict "9999999999" MESS "N§ de la Factura relacionada:"
							READ
							stor STR(nadafac)+STR(nadmar) TO nada
							SELE fac
							IF !SEEK(nada)
								DO cartel2 WITH "EL NUMERO DE FACTURA"+STR(nadafac),"NO CORRES[PONDE A","UNA EXISTENTE",""
								LOOP
							ENDIF
							@ 9,8 GET nadamon PICTU "99999999999.99" MESS "Monto de la Nota de D‚bito"
							@ 10,11 GET nadacon pict "&X30"
							READ
							stor kok+1 to kok
							m.tipo="ND"
							m.fechave=m.fechaem
							m.codvia=""
							m.moneda=nada9
							m.cotiz=nada10
							m.fecha=DATE()
							m.usuario=usador
						ELSE
							=relewin("WIN")
							EXIT
						ENDIF                                && COND. PAGO
					ELSE
						DO cartel2 WITH "EL NUMERO DE FACTURA"+STR(m.factura),"CORRESPONDE A UNA ","YA EXISTENTE",""
						LOOP
					ENDIF
				ELSE
					=relewin("WIN")
					EXIT
				ENDIF                                    && MARCA
			ELSE
				=relewin("WIN")
				EXIT
			ENDIF                                      && LASTKEY
		ELSE
			=relewin("WIN")
			acti SCRE
			EXIT
		ENDIF                                        && CLIENTE
		montneto=nadamon
		IF kok#0
			DO WHILE .T.
				IF FLOCK("fac")
					STOR NUL TO moiva,moot2,moot3,bruto
					su=NUL
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF xaciva[m.cliiva,A*2]#0
								su=su+xaciva[m.cliiva,A*2]
							ENDIF
						ENDIF
					NEXT
					su=1+su/100
					IF nada9#xauss
						stor montneto*nada10 TO neto
					ELSE
						stor montneto TO neto
					ENDIF
					stor neto/su TO bruto
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF xaciva[m.cliiva,A*2]#0
								IF A=1
									moiva=porcen(bruto,xaciva[A*2])-bruto
								ELSE
									IF A=2
										moot2=porcen(bruto,xaciva[A*2])-bruto
									ELSE
										IF A=3
											moot3=porcen(bruto,xaciva[A*2])-bruto
										ENDIF
									ENDIF
								ENDIF
							ENDIF
						ENDIF
					NEXT
					moiva=ROUND(moiva,2)
					moot2=ROUND(moot2,2)
					moot3=ROUND(moot3,2)
					stor neto-(bruto+moiva+moot2+moot3) TO nada
					IF !EMPTY(nada)
						stor (bruto+nada) TO bruto
					ENDIF
					IF nada9=xadols
						stor neto/nada10 TO neto
						stor bruto/nada10 TO bruto
					ENDIF
					stor " " TO nada2
					STOR NUL TO nada3
					stor 40 TO col1
					stor 60 TO col2
					=xseek(m.condpago,'mix','pagcod')
					stor mix.texto1 TO nada2
					stor 1 TO I
					FOR A=4 TO 16 STEP 3
						stor VAL(SUBSTR(nada2,A,3)) TO nada5
						IF EMPTY(nada5)
							EXIT
						ENDIF
						stor I+1 TO I
					NEXT
					define wind win1 FROM 10,nul TO 18+I,79 TITL "Condiciones de Pago" shad colo sche 8
					acti wind win1
					@ 1,2 SAY "FECHA DE EMISION: " GET m.fechaem pict "@D"
					@ 1,col1 SAY "MONTO BRUTO: "
					@ 1,col2 GET bruto pict "99999999999.99"
					stor 2 TO J
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF xaciva[m.cliiva,A*2]#0
								@ J,col1 SAY xaci[A]+": "
								IF A=1
									@ J,col2 GET moiva pict "99999999999.99"
								ELSE
									IF A=2
										@ J,col2 GET moot2 pict "99999999999.99"
									ELSE
										@ J,col2 GET moot3 pict "99999999999.99"
									ENDIF
								ENDIF
								stor J+1 TO J
							ENDIF
						ENDIF
					NEXT
					@ J,col1 SAY "MONTO NETO A PAGAR: "
					@ J,col2 GET neto pict "99999999999.99"
					CLEA GETS
					DIME fec[6]
					stor {} TO fec
					stor 2 TO J
					stor I*3 TO I
					FOR A=1 TO I STEP 3
						stor m.fechaem TO nada1
						stor VAL(SUBSTR(nada2,A,3)) TO nada6
						stor nada6+nada1 TO nada1
						IF EMPTY(VAL(SUBSTR(nada2,A,3))) .AND. I=3
							@ 6,2 SAY "FECHA DE VENCIMIENTO" GET nada1 pict "@D" MESS "Fecha de vencimiento de la factura"
							stor nada1 TO nada11
							stor nada1 TO fec[1]
							EXIT
						ELSE
							@ J+4,2 SAY "FECHA DE VENCIMIENTO "+STR(J-1,1)+": " GET nada1 pict "@D" MESS "Fecha de vencimiento de la factura"
							stor nada1 TO nada11
							stor nada1 TO fec[J-1]
						ENDIF
						stor J+1 TO J
					NEXT
					CLEA GETS
					DIME nad[7]
					stor I/3 TO I
					IF I#1
						stor ROUND(neto/I,2) TO nad
						DO WHILE .T.
							STOR NUL TO nada
							STOR NUL TO k
							DO WHILE k<I
								stor k+1 TO k
								@ k+5,col1 SAY "MONTO "+STR(k,1)+": "
								@ k+5,col2 GET nad[K] pict "99999999999.99"
								stor nada+nad[K] TO nada
							ENDDO
							IF nada#neto
								stor neto-nada TO nada
								stor nad[1]+nada TO nad[1]
								@ 6,col2 GET nad[1] pict "99999999999.99"
							ENDIF
							CLEA GETS
							acti SCRE
							@ 24,nul SAY padc("Confirme/Modifique el monto",80)
							acti wind win1
							STOR NUL TO k
							STOR NUL TO nada2
							DO WHILE k<I
								stor k+1 TO k
								@ k+5,col2 GET nad[K] pict "99999999999.99"
								READ
								stor ROUND(nada2+nad[K],2) TO nada2
							ENDDO
							IF nada2=neto
								stor k TO nad[7]
								EXIT
							ENDIF
							?CHR(07)
						ENDDO
					ELSE
						@ 6,col1 SAY "MONTO NETO A PAGAR: "
						@ 6,col2 GET neto pict "99999999999.99"
						CLEA GETS
						nad[1]=neto
						nad[7]=1
					ENDIF                                  && I#1
					ACTI SCRE
					IF confirma("la Nota de D‚bito",.T.,19,40)
						REGISTRO=STR(PUNMAR)
						DO LOK WITH "DOC"
						STOR doc.numero TO m.factura,nanodebi
						REPL DOC.NUMERO WITH DOC.NUMERO+1
						UNLO IN DOC
						do FLOK with "ccl"
						SELE ccl
						FOR k=1 TO nad[7]
							IF nada9#xadols
								stor ROUND(nad[K]/nada10,4) TO nada17
							ELSE
								stor nad[K] TO nada17
							ENDIF
							APPE BLANK
							REPL ccl.codcli WITH m.codcli, ccl.fechaop WITH m.fechaem, ccl.fechave WITH fec[K]
							REPL ccl.detalle WITH nadacon, ccl.compr WITH ("FAC.N§"+str(nadafac,9))
							REPL ccl.comprre WITH "ND", ccl.numerore WITH nanodebi, ccl.monto WITH nad[K]
							REPL ccl.moneda WITH nada9, ccl.equivale WITH nada17, ccl.fecha WITH DATE(), ccl.usuario WITH usador
						NEXT
						UNLO in ccl
						SELE fac
						APPE BLANK
						m.fechave=m.fechaem
						m.codvia=""
						m.moneda=nada9
						m.cotiz=nada10
						M.TIPO='ND'
						GATH MEMV
						REPL fac.montobru WITH bruto, fac.montoiva WITH moiva, fac.montoot2 WITH moot2
						REPL fac.montoot3 WITH moot3, fac.montonet WITH neto
						=REPUSE()
						=relewin("WIN1")
						acti scre
						copias=1
						DO ldebi
						UNLO in fac
						stor .F. TO salir
						EXIT
					ELSE
						stor .F. TO salir
						SELE fac
						do FLOK with "fac"
						set order to
						dELE ALL FOR fac.factura=m.factura .AND. fac.marca=m.marca
						set order to 1
						UNLO in fac
						=relewin("WIN1")
						EXIT
					ENDIF                                  &&CONFIRMA
				ELSE
					@ 24,nul SAY Espere COLO sche 19
				ENDIF                                    && IF FLOCK(FAC)
			ENDDO
			IF salir
				EXIT
			ENDIF
		ELSE
			EXIT
		ENDIF                                        && KOK#0
	ENDDO
	deac wind ALL
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
