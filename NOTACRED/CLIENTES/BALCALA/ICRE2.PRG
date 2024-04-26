*********************************************************************************
*-- Programa: ICRE2.PRG
*-- Fecha   : 05-22-92 02:58am
*-- Versi¢n : G. REINER
*-- Notas   : DEVOLUCION COMPLETA FACTURA
*-- Modificaci¢n GOYO 12-17-92 10:38am (agrego disp_fac)
********************************************************************************
PRIV FAXT
ulpr=hora_ulp(program())
if cheqseg()
	=MEN_LIN("FACTURA A ANULAR")
	IF ELIFAC()
		DO MFAC WITH .T.
		IF CONFIRMA('Anular la Factura',.t.,10,0)
			PAANULAR=FAC.FACTURA
			=RELEWIN("WIN")
			M.PUNMAR=(JANNRO-1)*20+5
			GO M.PUNMAR IN DOC
			m.factur=doc.numero
			store date() to emis
			=movewin(10,10,15,60,'win',' Datos de la Nota de Cr‚dito ')
			@ 1,1 say 'N§ NOTA DE CREDITO' GET M.FACTUR PICT '9999999999' MESS 'N£mero de Nota de Cr‚dito'
			@ 2,1 say 'FECHA DE EMISION    ' GET EMIS
			READ
			IF LAST()#27 .AND. !EMPTY(M.FACTUR) .and. emis>=fac.fECHAEM
				SELE FAC
				SCAT MEMV
				IF !XSEEK(M.FACTUR,'FAC','FACTURA')
					=MEN_LIN("GENERANDO NOTA DE CREDITO")
					=FLOCK() .OR. FLOK("FAC")
					INSERT INTO FAC FROM MEMV
					repl factura with m.factur
					repl fechaem with emis,fechave with emis
					repl monto with 0-M.monto
					repl descuento with 0-M.descuento
					repl montobru with 0-M.montobru
					repl montoiva with 0-M.montoiva
					repl montoot2 with 0-M.montoot2
					repl montoot3 with 0-M.montoot3
					repl montonet with 0-M.montonet
					=REPUSE()
					REPL TIPO WITH 'NC'
					UNLO IN FAC
					STORE M.EMIS TO FECHAOP,FECHAVE
					STORE 'DEV. TOTAL FACTURA N§ '+alltrim(str(m.PAANULAR)) to m.detalle
					STORE "FAC.N§ "+ALLTRIM(STR(M.FACTURA)) TO M.COMPR
					STORE 'NC' TO M.COMPRRE
					STORE M.FACTUR TO M.NUMERORE
					STORE M.MONTONET TO M.MONTO
					STORE M.MONTONET/M.COTIZ TO M.EQUIVALE
					STORE .T. TO M.PAGADA
					SELE CCL
					=FLOCK() .OR. FLOK("CCL")
					INSERT INTO CCL FROM MEMV
					=REPUSE()
					=RESTACCL(PER.CODCLI,M.PAANULAR,M.MONTONET,.T.)
					UNLO IN CCL
					SELE fax
					seek(m.PAANULAR)
					posok=recno()
					=flock() .or. flok("FAX")
					TMP=GENTMP()
					copy to (TMP) while factura=M.PAANULAR
					SELE 0
					USE (TMP) ALIAS TEMP
					REPL ALL FACTURA WITH M.FACTUR ;
					CANTIDAD WITH 0-CANTIDAD ;
					UNIDADES WITH 0-UNIDADES
					SELE TEMP
					USE
					SELE FAX
					APPE FROM (TMP)
					UNLO IN FAC
					SELE kar
					=flock("kar") .or. flok("kar")
					SELE FAX
					go posok
					SCAN WHIL fax.factura=M.PAANULAR
						nacanti=fax.cantidad
						SELE kar
						APPE BLANK
						REPL kar.fechaop WITH M.EMIS,kar.articulo WITH fax.articulo, kar.cliente WITH m.codcli
						REPL kar.opk WITH '0D', kar.detalle WITH "DEVOL. FACTURA COMPLETA"
						REPL kar.SALIDA WITH NUL, kar.ENTRADa WITH nacanti, kar.docref WITH "NC", kar.nrodocref WITH Q_FAC(SUCU+"-"+ALLTRIM(STR(m.factura)))
						REPL KAR.ENPESO WITH FAX.UNIDADES
						=repuse()
						SELE fax
						if xseek(fax.articulo,'mer','articulo')
							sele mer
							=lock() .or. lok(str(recno("mer")),"MER")
							IF MER.DISCRIM
								REPL MER.STOCKPES WITH MER.stockPES+abs(FAX.cantidad)
								REPL MER.STOCK WITH MER.STOCK+abs(FAX.UNIDADES)
							ELSE
								REPL MER.stock WITH MER.stock+abs(FAX.cantidad)
							ENDIF
							unlo in mer
						endif
					ENDS
					UNLO IN kar
					SELE DOC
					GOTO PUNMAR
					=LOCK() .OR. LOK(STR(RECNO("DOC")),"DOC")
					REPL doc.numero WITH M.FACTUR+1
					UNLO IN DOC
					=DISP_FAC(.T.,.F.,.T.)
				ELSE
					DO Cartel2 WITH "EL NUMERO DE FACTURA"+STR(m.factur),"CORRESPONDE A UNA ","YA EXISTENTE",""
				ENDIF
			ENDIF
		ENDIF
		=RELEWIN("WIN")
	endif
ELSE
	=iaudi()
ENDI
RETURN MEN_LIN(BOTOM)
