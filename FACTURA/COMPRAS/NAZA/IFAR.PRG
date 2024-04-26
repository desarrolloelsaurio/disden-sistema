*:*********************************************************************
*-- Programa: Ifar.prg
*-- Fecha   : 11-18-91 10:20am
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : FACTURA DE NOTAS DE PEDIDO PROVEEDORES
*:*********************************************************************
DECLARE produto[16]
DECLARE fechas[6], montocuot[6]
SELE pec
STORE RECNO() TO ff
registro=STR(ff)
regpec=registro
SCAT MEMV
STORE productiva TO tipopec
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	ACTI WIND win2
	=LOCK() .OR. lok('PEC')
	SELE pe1
	STORE "" TO fts,ftb,ft
	STORE '99,999,999,999.99' TO picu2
	STORE '@R 999-999-999-999-999-999' TO picu4
	SCAN FOR pedido=m.pedido .AND. procod=m.procod .AND. cantidad>facturado
		ft=ft+ALLTRIM(STR(RECNO()))+","
	ENDSCAN
	IF LEN(ft)>0
		ft=LEFT(ft,LEN(ft)-1)
		cuantos=OCCURS(",",ft)+1
		montotot = 0
		registro = ft
		DO lok WITH 'PE1'
		SELE pec
		STORE 17 TO COL
		SCAT MEMVAR
		DO mrec WITH ft, 1, .F.
		DEFINE WINDOW win10 FROM 15,5 TO 23,69 SHAD COLO SCHE 8
		ACTI WIND win10
		m.factura = 0
		m.fechaem = DATE()
		@ 1,3 SAY "NRO FACTURA PROVEEDOR :"
		@ 2,3 SAY "FECHA DE EMISION      :"
		@ 3,3 SAY "CONDICION DE PAGO     :"
		@ 4,3 SAY "COTIZACION DEL "+PADC(xadol,7)+":"
		@ 5,3 SAY PADL("FACTURA EN "+PADC(xadols,4)+" O "+PADC(xauss,4),22)+":"
		@ 1,27 GET m.factura PICT "@Z 9999999999"
		READ
		IF m.factura > 0
			@ 2,27 GET m.fechaem
			READ
			SELE far
			IF SEEK(STR(m.factura)+m.procod)
				DEFINE WINDOW win11 FROM 19,5 TO 23,25 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
				ACTI WIND win11
				@ 1,0 SAY PADC("YA FUE FACTURADA",20)
				=INKEY(nul )
				RELE WIND win10
				RELE WIND win11
			ELSE
				respuesta = 0
				m.condpago = elipag("",3,27)
				ACTI WIND win10
				IF m.condpago # 0
					m.nadacuo = STRTRAN(TRAN(mix.texto1, picu4),"-000")
					m.nrocuotas = (LEN(m.nadacuo)+1)/4
					m.nada = TRAN(mix.texto1, picu4)
					@ 3,27 GET m.nada
					CLEAR GETS
					m.cotiz  = xacotiz
					m.moneda = xamoneda
					@ 4,27 GET m.cotiz PICT "@Z 999,999,999,999.99"
					@ 5,27 GET m.moneda PICT "@M "+xadols+","+xauss
					READ
					m.coefi = IIF(m.moneda=xaus,1,m.cotiz)
					RELE WIND win10
					desdecual = 1
					DO WHILE .T.
						DO mrec WITH ft, desdecual, .F.
						hastacual=desdecual+13
						IF hastacual>cuantos
							hastacual=cuantos
						ENDIF
						ren=10
						ii=1
						FOR I=desdecual TO hastacual
							nada=IIF(I=1,1,AT(",",ft,I-1)+1)
							nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
							GO VAL(SUBSTR(ft, nada, nada1-nada)) IN pe1
							produto[II]=LEFT(pe1.articulo,13)
							ren=ren+1
							ii=ii+1
						NEXT
						DO WHILE .T.
							FOR I=1 TO ii-1
								@ I+9 ,c1 PROMPT produto[I]
							NEXT
							@ 24, 30 PROMPT "\<ANTERIOR"
							@ 24, 45 PROMPT "\<SALIR"
							@ 24, 60 PROMPT "\<POSTERIOR"
							opcion = 0
							MENU TO opcion
							IF !EMPTY(opcion)
								IF opcion = ii
									IF desdecual-14>=1
										desdecual=desdecual-14
									ELSE
										LOOP
									ENDIF
								ELSE
									IF opcion = ii+1
										EXIT
									ELSE
										IF opcion = ii+2
											IF desdecual+14<=cuantos
												desdecual=desdecual+14
											ELSE
												LOOP
											ENDIF
										ELSE
											SELE pe1
											I = opcion + desdecual - 1
											nada=IIF(I=1,1,AT(",",ft,I-1)+1)
											nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
											GO VAL(SUBSTR(ft, nada, nada1-nada))
											SCAT MEMV
											ren = opcion + 9
											IF tipopec="M"
												SELE mer
												SET ORDER TO 1
												SEEK LEFT(m.articulo,13)
												nada2 = LEFT(m.articulo,13)
												@ ren ,c1 GET nada2
												nada = LEFT(mer.merca,29)
												@ ren ,c2 GET nada
											ELSE
												IF tipopec="T"
													SELE tel
													SET ORDER TO 1
													SEEK LEFT(m.articulo,10)
													nada2 = LEFT(m.articulo,10)
													@ ren ,c1 GET nada2
													nada = LEFT(tel.tela,29)
													@ ren ,c2 GET nada
												ELSE
													IF tipopec="A"
														SELE avi
														SET ORDER TO 1
														SEEK LEFT(m.articulo,10)
														nada2 = LEFT(m.articulo,10)
														@ ren ,c1 GET nada2
														nada = LEFT(avi.avios,29)
														@ ren ,c2 GET nada
													ELSE
														nada = LEFT(m.descripcio,29)
														@ ren ,c1 GET m.articulo
														@ ren ,c2 GET nada
													ENDIF
												ENDIF
											ENDIF
											IF m.color>0
												GO m.color IN ("MIX")
												nada1 = LEFT(mix.texto1,7)
												@ ren, c6  GET nada1
											ENDIF
											@ ren, c3 GET m.talle        PICT "99.99"
											@ ren, c4 GET unid(m.unidad) PICT "xxxxxx"
											m.cuanto = m.cantidad - m.facturado
											@ ren, c5 GET m.cuanto PICT "@Z 9999999999"
										ENDIF
										CLEA GETS
										DEFINE WINDOW win10 FROM 0,5 TO 5,63 SHAD COLO SCHE 8
										ACTI WIND win10
										m.cuanto = m.cantidad - m.facturado
										m.preciouni  = 0
										@ 1,3 SAY "CANT. FACTURADA :" GET m.cuanto PICT "@Z 9999999999";
										VALID m.cuanto <= m.cantidad - m.facturado
										@ 2,3 SAY "COSTO UNITARIO  :" GET m.preciouni PICT "@Z 999,999,999,999.99"
										READ
										RELE WIND win10
										IF m.cuanto > 0
											SELE fad
											APPE BLANK
											GATH MEMV
											REPL detalle WITH m.descripcio
											DO repuse
											REPL cantidad WITH m.cuanto
											REPL monto    WITH m.preciouni * m.cuanto
											m.montotot = m.montotot + monto
											ftb=ftb+ALLTRIM(STR(RECNO()))+","
											SELE pe1
											REPL facturado WITH m.facturado + m.cuanto
											DO repuse
											fts=fts+ALLTRIM(STR(RECNO()))+","
										ENDIF
										SELE pe1
									ENDIF
								ENDIF
							ENDIF
							EXIT
						ENDDO
						IF opcion = ii+1 .OR. cuantos=0
							EXIT
						ENDIF
					ENDDO
					IF !EMPTY(m.montotot)
						DO lfar WITH .T.
						DEFINE WINDOW win10 FROM 12,5 TO 23,56 SHAD COLO SCHE 8
						ACTI WIND win10
						m.descuento = 0
						m.montotot = m.montotot * m.coefi
						@ 1,3 SAY "MONTO TOTAL FACTURA : "
						@ 2,3 SAY "MONTO DESCUENTO     : "
						@ 3,3 SAY "MONTO NETO GRAVADO  : "
						@ 4,3 SAY "MONTO I.V.A.        : "
						@ 5,3 SAY "MONTO IMPUESTO 1)   : "
						@ 6,3 SAY "MONTO IMPUESTO 2)   : "
						@ 7,3 SAY "MONTO EXENTO        : "
						@ 8,3 SAY "MONTO TOTAL FACTURA : "
						@ 1,24 SAY TRAN(m.montotot,picu2)
						@ 2,24 GET m.descuento PICT picu2
						READ
						m.montobru = m.montotot - m.descuento
						@ 3,24 SAY TRAN(m.montobru,picu2)
						m.montoiva = m.montobru * xaciva(1,2) / 100
						m.montoot2 = m.montobru * xaciva(1,4) / 100
						m.montoot3 = m.montobru * xaciva(1,6) / 100
						m.montoexe = 0
						@ 4,24 GET m.montoiva  PICT picu2
						@ 5,24 GET m.montoot2  PICT picu2
						@ 6,24 GET m.montoot3  PICT picu2
						@ 7,24 GET m.montoexe  PICT picu2
						READ
						m.montonet = m.montobru + m.montoiva + m.montoot2 + m.montoot3 + m.montoexe
						@ 8,24 SAY TRAN(m.montonet,picu2)
						DEFINE WINDOW win11 FROM 12,51 TO 23,79 DOUB TITL ' *** CUOTAS PAGO *** ' SHAD COLO SCHE 8
						ACTI WIND win11
						montocuot = m.montonet / m.nrocuotas
						montoact = 0
						DO WHILE montoact # montonet
							FOR I = 1 TO m.nrocuotas
								fechas[I] = VAL(SUBST(m.nadacuo,4*I-3,3))+m.fechaem
								@ I, 1 GET fechas[I]    PICT "@D"
								@ I,10 GET montocuot[i] PICT "99999,999,999.99"
							NEXT
							READ
							montoact=0
							FOR I=1 TO m.nrocuotas
								montoact = montoact + montocuot[i]
							NEXT
						ENDDO
						IF confirma("Grabar la factura del proveedor",.T.,4,10)
							ACTI SCRE
							@ 24,0 SAY PADC(grabando,80,'*') COLO SCHE 19
							SELE ccp
							DO flok WITH "ccp"
							m.nada  = m.procod
							m.nada1 = m.moneda
							SCAT MEMV BLAN
							m.procod   = m.nada
							m.fechaop  = m.fechaem
							m.detalle  = "RECEPCION FACTURA NRO "+ALLTRIM(STR(m.factura))
							m.compr    = "N.P. "+ALLTRIM(STR(m.pedido))
							m.comprre  = "FA"
							m.numerore = m.factura
							m.moneda   = m.nada1
							FOR I = 1 TO m.nrocuotas
								APPE BLAN
								m.fechave = fechas[i]
								m.monto   = montocuot[i]
								m.equivale = m.monto * m.coefi / m.cotiz
								GATH MEMV
								DO repuse
							NEXT
							UNLO IN ccp
							SELE far
							DO flok WITH "far"
							APPE BLAN
							GATH MEMV
							REPL monto WITH montotot
							REPL tipo  WITH "FA"
							DO repuse
							UNLO IN far
							UNLO IN fad
*						IF imprime("Factura del Proveedor",.T.,10,10)*
*							copias=copias("Factura del Proveedor",.T.,10,10)
*							DO lfari1
*						ENDIF
						ELSE
							SELE fad
							DO flok WITH "fad"
							ftb=LEFT(ftb,LEN(ftb)-1)
							fts=LEFT(fts,LEN(fts)-1)
							DO WHILE LEN(ftb) > 0
								nada = AT(",",ftb)-1
								IF nada>0
									nada1 = SUBSTR(ftb, 1, nada)
									ftb  = SUBSTR(ftb, nada+2)
								ELSE
									nada1 = ftb
									ftb = ""
								ENDIF
								GO VAL(nada1) IN fad
								nada = AT(",",fts)-1
								IF nada>0
									nada1 = SUBSTR(fts, 1, nada)
									fts  = SUBSTR(fts, nada+2)
								ELSE
									nada1 = fts
									fts = ""
								ENDIF
								GO VAL(nada1) IN pe1
								SELE pe1
								REPL facturado WITH facturado - fad.cantidad
								SELE fad
								DELETE
							ENDDO
							UNLO IN fad
						ENDIF
						=RELEWIN("win11")
						=RELEWIN("win10")
					ENDIF
				ENDIF
			ENDIF
		ELSE
			=RELEWIN("win10")
		ENDIF
	ENDIF
ELSE
	=iaudI()
ENDIF
RETURN
