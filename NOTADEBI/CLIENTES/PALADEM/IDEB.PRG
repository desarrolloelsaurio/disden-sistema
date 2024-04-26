*********************************************************************************
*-- Programa: IDEB.PRG
*-- Fecha   : 10/10/91
*-- Versi¢n : G. REINER
*-- Notas   : INGRESO DE NOTA DE DEBITO
*--           POR MONTO FIJO
*-- Modificaci¢n GOYO 06-25-92 02:37pm (de icre a ideb)
*-- Modificaci¢n GOYO 07-22-92 11:37pm marca -> empresa
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STOR NUL TO kok
	PICU="99999999999.99"
	DO WHIL .T.
		DEFI WIND WIN FROM 0,0 TO 12,79 foot ALLTRIM(JANNAME) TITL "Nota de D‚bito" COLO SCHE 3
		=centWIN("WIN")
		@ 1,1 SAY "Cliente:"
		@ 5,1 SAY "Empresa   :"
		@ 1,42 SAY "Nota de D‚bito N§:"
		@ 3,42 SAY "Fecha de emisi¢n:"
		@ 4,42 SAY "Moneda en que se emite:"
		@ 5,42 SAY "Cotizaci¢n:"
		@ 7,1 SAY "N§ de la Factura relacionada:"
		@ 8,1 SAY "Concepto:"
		STOR NUL TO pretot,nadafac,nadamon
		STOR SPACE(30) TO nadacon
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
			STOR nada+" "+nada1 TO nada
			@ 1,1 GET nada
			CLEA GETS
			@ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
			=XSEEK(PER.localidad,"MIX",'CIUCOD')
			nada=mix.texto1
			=XSEEK(RIGHT(mix.TEXTO2,2),"MIX",'PRVCOD')
			@ 3,1 SAY Alltrim(nada) +" "+Alltrim(mix.texto1)
			@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+ " "+Alltrim(PER.nroiva)
			IF LASTKEY()#27
				STOR NUL TO respuesta
				IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
					STOR 1 TO m.marca,nadmar
					nada=JANNAME
					acti wind win
					@ 5,13 GET nada
					CLEA GETS
					PUNMAR=(M.MARCA-1)*20+5
					GO PUNMAR IN DOC
					REGISTRO=STR(PUNMAR)
					STOR doc.numero TO m.factura,nanocrei
					@ 1,62 GET m.factura
					read
					SELE fac
					SIGUE=IIF(!SEEK(m.factura),.T.,IIF(fac.tipo="ND",.F.,.T.))
					IF sigue
						CLEA GETS
						STOR {} TO nada1
						STOR DATE() TO nada2,fechaem
						STOR xauss TO nada9
						STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
						@ 3,60  GET m.fechaem PICT "@D" RANGE nada1,nada2;
						MESS "Fecha de emisi¢n de la Nota de D‚bito- [ESC] para Salir"
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
						STOR nadafac TO nada
						SELE fac
						IF !SEEK(nada)
							DO cartel2 WITH "EL NUMERO DE FACTURA"+STR(nadafac),"NO CORRES[PONDE A","UNA EXISTENTE",""
							LOOP
						ENDI
						@ 8,11 GET nadacon PICT "@!"
						read
						move wind win to nul,nul
						DEFI WIND WIN1 FROM 0,0 TO 8,40 foot ALLTRIM(JANNAME) TITL "Detalle de la Nota de D‚bito" COLO SCHE 3
						=centwin("win1")
						RELE MONTOS
						DIME MONTOS[3]
						STORE NUL TO MONTOS,m.bruto,m.nogravado
						@ 1,1 say "MONTO GRAVADO"
						@ 1,20 GET M.BRUTO pict '99,999.99'
						FOR XA=1 TO 3
							IF !EMPTY(xaci[XA])
								IF !EMPTY(XACIVA[PER.CONDIVA,XA*2])
									@ $+1,1 SAY XACI[PER.CONDIVA,XA]
									@ $,20 GET MONTOS[XA] PICT '99,999.99'
								ENDIF
							ENDIF
						NEXT
						@ $+1,1 SAY "NO GRAVADO"
						@ $,20 GET M.NOGRAVADO pict '99,999.99'
						@ $+1,1 SAY "TOTAL"
						READ
						IF LAST()#27
							TOTAL=M.BRUTO+M.NOGRAVADO+MONTOS[1]+MONTOS[2]+MONTOS[3]
							IF !EMPTY(TOTAL)
								STOR kok+1 TO kok
								m.tipo="ND"
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
						EXIT
					ENDI
				ELSE
					=relewin("WIN")
					EXIT
				ENDIF
			ELSE
				=relewin("WIN")
				EXIT
			ENDIF
		ELSE
			=relewin("WIN")
			EXIT
		ENDI                                         && CLIENTE
		IF !EMPTY(kok)
			M.MOIVA=MONTOS[1]
			M.MOOT2=MONTOS[2]
			M.MOOT3=MONTOS[3]
			M.NETO=M.TOTAL
			=MOVEWin(11,nul,18,79,'WIN1',"Discriminaci¢n")
			@ 1,2 SAY "FECHA DE EMISION: " GET m.fechaem PICT "@D"
			@ 1,40 SAY "MONTO BRUTO: "
			@ 1,60 GET M.bruto PICT PICU
			FOR XA=1 TO 3
				IF !EMPTY(MONTOS[XA])
					@ $+1,40 SAY xaci[xA]+": "
					@ $,60 GET MONTOS[XA] PICT PICU
				ENDI
			NEXT
			@ $+1,40 SAY "NO GRAVADO"
			@ $,60 GET M.NOGRAVADO PICT PICU
			@ $+1,40 SAY "MONTO NETO: "
			@ $,60 GET neto PICT PICU
			CLEA GETS
			acti SCRE
			IF confirma("la Nota de D‚bito",.T.,19,40)
				REGISTRO=STR(PUNMAR)
				=LOCK() .OR. LOK("DOC")
				REPL DOC.NUMERO WITH m.factura+1
				UNLO IN DOC
				ACTI SCRE
				nanocrei=m.factura
				IF SUCU#'0002'
					=FLOCK("CCL") .OR. FLOK("ccl")
					SELE ccl
					STOR ROUND(neto/nada10,4) TO nada17
					APPE BLANK
					REPL ccl.codcli WITH m.codcli, ccl.fechaop WITH m.fechaem, ccl.fechave WITH {}
					REPL ccl.detalle WITH nadacon, ccl.compr WITH ("FAC.N§"+STR(nadafac,9))
					REPL ccl.comprre WITH "ND", ccl.numerore WITH NANOCREI, ccl.monto WITH neto
					REPL ccl.moneda WITH nada9, ccl.equivale WITH nada17, ccl.fecha WITH DATE(), ccl.usuario WITH usador
					UNLO in ccl
				ENDIF
				SELE fac
				APPE BLANK
				m.fechave=m.fechaem
				m.codvia=""
				m.moneda=nada9
				m.cotiz=nada10
				m.tipo='ND'
				GATH memv
				REPL fac.montobru WITH bruto, fac.montoiva WITH moiva, fac.montoot2 WITH moot2
				REPL fac.montoot3 WITH moot3, fac.montonet WITH neto, FAC.EXENTO WITH M.NOGRAVADO
				=REPUSE()
				acti SCRE
				copias=1
				=relewin("WIN1")
				acti SCRE
				=DISP_ND(.T.)
				UNLO in fac
				STOR .F. TO salir
				EXIT
			ELSE
				STOR .F. TO salir
				SELE fac
				=FLOCK("fac") .OR. FLOK("FAC")
				SET ORDER TO
				DELE FOR fac.factura=m.factura .AND. fac.marca=m.marca
				SET ORDER TO TAG FACTURA
				UNLO in fac
				=relewin("WIN1")
				EXIT
			ENDI                                       &&CONFIRMA
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
