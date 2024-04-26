*********************************************************************************
*-- Programa: ICRE1.PRG
*-- Fecha   : 10/10/91
*-- Versi¢n : G. REINER
*-- Notas   : INGRESO DE NOTA DE CREDITO
*--           POR MONTO FIJO
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	picu="99999999999.99"
	STOR NUL TO kok
	STOR mix.nu1 TO m.marca,nadmar
	nadaemp=mix.texto1
	DO WHIL .T.
		DEFI wind win FROM 1,nul TO 13,79 TITL "Nota de Cr‚dito" colo sche 8 shad
		acti wind win
		@ 1,1 SAY "Cliente:"
		@ 5,1 SAY "Marca     :"
		@ 1,42 SAY "Nota de Cr‚dito N§:"
		@ 3,42 SAY "Fecha de emisi¢n:"
		@ 4,42 SAY "Moneda en que se emite:"
		@ 5,42 SAY "Cotizaci¢n:"
		@ 7,1 SAY "N§ de la Factura relacionada:"
		@ 8,1 SAY "Monto:"
		@ 9,1 SAY "Concepto:"
		STOR NUL TO pretot,nadafac,nadamon
		STOR SPACE(30) TO nadacon
		x30=REPL("!",30)
		SELE fac
		SCAT memv BLAN
		SELE PER
		STOR NUL TO respuesta
		IF !EMPTY(elicli(" - [ESC] para Salir",2,1))
			m.codcli=PER.codcli
			m.zona=PER.zona
			m.clipre=PER.precio
			m.cliiva=PER.condiva
			acti wind win
			nada=Alltrim(PER.codcli)
			nada1=Alltrim(PER.cliente)
			STOR nada+" "+nada1 TO nada
			@ 1,1 GET nada
			CLEA GETS
			@ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
			=XSEEK(PER.localidad,'MIX','CIUCOD')
			nada=mix.texto1
			=XSEEK(RIGHT(MIX.TEXTO2,2),"MIX",'PRVCOD')
			@ 3,1 SAY Alltrim(nada) +" "+Alltrim(mix.texto1)
			@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+ " "+Alltrim(PER.nroiva)
			IF LASTKEY()#27
				@ 5,13 GET nadaemp
				CLEA GETS
				PUNMAR=(M.MARCA-1)*20+5
				STORE GETDOC(PUNMAR) TO m.factura,nanocrei
				@ 1,62 GET m.factura
				read
				SELE fac
				SIGUE=IIF(!SEEK(m.factura),.T.,IIF(fac.tipo="NC",.F.,.T.))
				IF sigue
					elvia=fac.codvia
					CLEA GETS
					STOR {} TO nada1
					STOR DATE() TO nada2,fechaem
					STOR xauss TO nada9
					STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
					@ 3,60  GET m.fechaem PICT "@D" RANGE nada1,nada2;
					MESS "Fecha de emisi¢n de la Nota de Cr‚dito- [ESC] para Salir"
					READ
					IF LASTKEY()=27
						=relewin("WIN")
						EXIT
					ENDI
					@ 4,66 GET nada9 PICT nn MESS "Moneda en que se emite"
					READ
					STOR xacotiz TO nada10
					@ 5,54 GET nada10 PICT PICU MESS "Cotizaci¢n de la fecha - [ESC] para Salir"
					READ
					IF LASTKEY()=27
						=relewin("WIN")
						EXIT
					ENDI
					@ 7,31 GET nadafac PICT "9999999999" MESS "N§ de la Factura relacionada:"
					READ
					STOR nadafac TO nada,PAANULAR
					SELE fac
					IF !SEEK(nada)
						DO cartel2 WITH "LA FACTURA "+STR(nadafac),"NO EXISTE","POR FAVOR","REVISE Y REINTENTE"
						LOOP
					ENDI
					ELVIAJANTE=FAC.CODVIA
					DO WHIL nadamon=NUL
						@ 8,8 GET nadamon PICTU PICU MESS "Monto de la Nota de Cr‚dito"
						@ 9,11 GET nadacon PICT "&X30"
						READ
					ENDDO
					STOR kok+1 TO kok
					m.tipo="NC"
					m.fechave=m.fechaem
					m.codvia=""
					m.moneda=nada9
					m.cotiz=nada10
					m.fecha=DATE()
					m.usuario=usador
				ELSE
					=cartel2("EL NUMERO DE FACTURA"+STR(m.factura),"CORRESPONDE A UNA ","YA EXISTENTE","")
					LOOP
				ENDI
			ELSE
				=relewin("WIN")
				EXIT
			ENDI
		ELSE
			=relewin("WIN")
			acti SCRE
			EXIT
		ENDI                                         && CLIENTE
		montneto=nadamon
		IF !EMPTY(kok)
			DO WHIL .T.
				IF FLOCK("FAC") .OR. FLOK("fac")
					STOR NUL TO moiva,moot2,moot3,bruto
					su=NUL
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF xaciva[m.cliiva,A*2]#0
								su=su+xaciva[m.cliiva,A*2]
							ENDI
						ENDI
					NEXT
					su=1+su/100
					NETO=IIF(nada9#xauss,montneto*nada10,montneto)
					STOR neto/su TO bruto
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF !empty(xaciva[m.cliiva,A*2])
								IF A=1
									moiva=bruto*xaciva[m.cliiva,A*2]/100
								ELSE
									IF A=2
										moot2=bruto*xaciva[m.cliiva,A*2]/100
									ELSE
										IF A=3
											moot3=bruto*xaciva[m.cliiva,A*2]/100
										ENDI
									ENDI
								ENDI
							ENDI
						ENDI
					NEXT
					moiva=ROUND(moiva,2)
					moot2=ROUND(moot2,2)
					moot3=ROUND(moot3,2)
					STOR neto-(bruto+moiva+moot2+moot3) TO nada
					IF !EMPTY(nada)
						STOR (bruto+nada) TO bruto
					ENDI
					STOR NUL TO nada3
					STOR 40 TO col1
					STOR 60 TO col2
					=MOVEWin(11,nul,18,79,'WIN1',"Discriminaci¢n")
					@ 1,2 SAY "FECHA DE EMISION: " GET m.fechaem PICT "@D"
					@ 1,col1 SAY "MONTO BRUTO: "
					@ 1,col2 GET bruto PICT PICU
					STOR 2 TO J
					FOR A=1 TO 3
						IF !EMPTY(xaci[A])
							IF xaciva[m.cliiva,A*2]#0
								@ J,col1 SAY xaci[A]+": "
								IF A=1
									@ J,col2 GET moiva PICT PICU
								ELSE
									IF A=2
										@ J,col2 GET moot2 PICT PICU
									ELSE
										@ J,col2 GET moot3 PICT PICU
									ENDI
								ENDI
								STOR J+1 TO J
							ENDI
						ENDI
					NEXT
					@ J,col1 SAY "MONTO NETO: "
					@ J,col2 GET neto PICT PICU
					CLEA GETS
					acti SCRE
					IF confirma("la Nota de Cr‚dito",.T.,19,40)
						REGISTRO=STR(PUNMAR)
						=LOCK("DOC") .OR. LOK("DOC")
						REPL DOC.NUMERO WITH m.factura+1
						UNLO IN DOC
						ACTI SCRE
						nanocrei=m.factura
						=FLOCK("CCL") .OR. FLOK("ccl")
						SELE ccl
						STOR ROUND(neto/nada10,4) TO nada17
						APPE BLANK
						REPL ccl.codcli WITH m.codcli, ccl.fechaop WITH m.fechaem, ccl.fechave WITH {}
						REPL ccl.detalle WITH nadacon, ccl.compr WITH ("FAC.N§"+STR(nadafac,9))
						REPL ccl.comprre WITH "NC", ccl.numerore WITH NANOCREI, ccl.monto WITH neto
						REPL ccl.moneda WITH nada9, ccl.equivale WITH nada17, ccl.fecha WITH DATE(), ccl.usuario WITH usador
						=RESTACCL(PER.CODCLI,M.PAANULAR,M.NETO,.T.)
						UNLO in ccl
						SELE fac
						m.fechave=m.fechaem
						m.codvia=elvia
						m.moneda=nada9
						m.cotiz=nada10
						m.tipo='NC'
					    M.CODVIA=FAC.CODVIA
						insert into fac from memv
						REPL FAC.MONTO WITH MONTOBRU
						REPL fac.montobru WITH bruto, fac.montoiva WITH moiva, fac.montoot2 WITH moot2
						REPL fac.montoot3 WITH moot3, fac.montonet WITH neto
						=REPUSE()
						acti SCRE
						copias=1
						=relewin("WIN1")
						acti SCRE
						=DISP_CRE(.T.,.F.)
						UNLO in fac
						STOR .F. TO salir
						EXIT
					ELSE
						STOR .F. TO salir
						SELE fac
						=FLOCK("fac") .OR. FLOK("FAC")
						SET ORDER TO
						DELE ALL FOR fac.factura=m.factura
						SET ORDER TO tag factura
						UNLO in fac
						=relewin("WIN1")
						EXIT
					ENDI                                   &&CONFIRMA
				ELSE
					=MEN_LIN(ESPERE)
				ENDI                                     && IF FLOCK(FAC)
			ENDDO
			IF salir
				EXIT
			ENDI
		ELSE
			EXIT
		ENDI
	ENDDO
	deac wind ALL
ELSE
	=iaudi()
ENDI
=MEN_LIN(BOTOM)
RETURN
