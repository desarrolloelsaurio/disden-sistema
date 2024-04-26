*:*********************************************************************
*-- Programa: idebc1.prg
*-- Fecha   : 12-10-91 05:21pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : DEVOLUCION DE FACTURA DE PROVEEDORES
*:*********************************************************************
SELE far
STORE RECNO() TO ff
registro=STR(ff)
regfar=VAL(registro)
SCAT MEMV
STORE far.monto TO montoant
STORE productiva TO tipopec
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	IF far.anulada
		DEFINE WINDOW win11 FROM 18,5 TO 23,25 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
		ACTI WIND win11
		@ 1,0 SAY PADC("NOTA DE DEBITO YA ANULADA",20)
		@ 2,0 SAY PADC("EL DIA:"+DTOC(far.fecha),20)
		=INKEY(nul )
		RELE WIND win11
	ELSE
		ACTI WIND win2
		DO lok WITH 'FAR'
		SELE fad
		ft=""
		SCAN FOR factura=m.factura .AND. procod=m.procod
			ft=ft+ALLTRIM(STR(RECNO()))+","
		ENDSCAN
		IF LEN(ft)>0
			ft=LEFT(ft,LEN(ft)-1)
			cuantos=OCCURS(",",ft)+1
			registro = ft
			DO lok WITH 'FAD'
			STORE 17 TO COL
			DO lfar WITH .F.
			DEFINE WINDOW win10 FROM 18,5 TO 23,69 SHAD COLO SCHE 8
			ACTI WIND win10
			m.fechaem = DATE()
			m.debito=0
			@ 1,3 SAY "NRO DE NOTA DE DEBITO :"
			@ 2,3 SAY "FECHA DE EMISION      :"
			@ 1,27 GET m.debito PICT "@Z 9999999999"
			READ
			IF m.debito > 0
				@ 2,27 GET m.fechaem
				READ
				RELE WIND win10
				SELE far
				IF SEEK(STR(m.debito)+m.procod)
					DEFINE WINDOW win11 FROM 19,5 TO 23,25 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
					ACTI WIND win11
					@ 1,0 SAY PADC("NOTA DE DEBITO EMITIDA",20)
					=INKEY(nul )
					RELE WIND win11
				ELSE
					IF confirma("la nota de debito",.T.,4,10)
						ACTI SCRE
						@ 24,0 SAY PADC(grabando,80,'*') COLO SCHE 19
						SELE far
						GO regfar
						SELE ccp
						DO flok WITH "ccp"
						APPE BLAN
						m.fechaop  = m.fechaem
						m.detalle  = "NOTA DEVOL N§"+ALLTRIM(STR(m.debito))
						m.compr    = "F.A. "+ALLTRIM(STR(m.factura))
						m.comprre  = "ND"
						m.numerore = m.debito
						m.fechave  = m.fechaem
						m.monto    = far.montonet
						m.equivale = IIF(far.moneda=xadols,m.monto/far.cotiz,m.monto)
						m.tipo = ' '
						GATH MEMV
						DO repuse
						UNLO IN ccp
						SELE fad
						IF SEEK(STR(far.factura)+far.procod)
							STORE '' TO fff
							SCAN FOR far.factura=fad.factura .AND. far.procod=fad.procod
								REPLACE devuelta WITH fad.cantidad
								fff=fff+','+ALLTRIM(STR(RECNO()))
							ENDS
							DO WHILE LEN(fff)>0
								fff=SUBSTR(fff,2)
								ffc=AT(",",fff)
								ffn=IIF(ffc>0,ffc-1,LEN(fff))
								GO VAL(LEFT(fff,ffn))
								fff=IIF(ffc>0,SUBSTR(fff,ffc),'')
								SCAT MEMV
								APPE BLAN
								m.factura=m.debito
								m.cantidad= -(m.cantidad)
								GATH MEMV
								DO repuse
							ENDDO
						ENDIF
						SELE far
						DO flok WITH "far"
						REPL anulada WITH .T.
						DO repuse
						APPE BLAN
						STORE -(m.montoant)  TO m.monto
						STORE -(m.descuento) TO m.descuento
						STORE -(m.montobru) TO m.montobru
						STORE -(m.montoiva) TO m.montoiva
						STORE -(m.montoot2) TO m.montoot2
						STORE -(m.montoot3) TO m.montoot3
						STORE -(m.montonet) TO m.montonet
						STORE -(m.montoexe) TO m.montoexe
						GATH MEMV
						REPL tipo  WITH "ND"
						REPL factura WITH m.debito
						DO repuse
						UNLO IN far
						SELE fad
						SCAN FOR far.factura=factura .AND. far.procod=procod
							IF tipopec="M"
								SELE pre
								formu=LEFT(fad.articulo,13)+RIGHT("000"+ALLTRIM(STR(fad.talle*10)),3)
								IF SEEK(formu)
									REPL stock WITH stock - fad.cantidad
									DO repuse
								ENDI
								SELE kar
								APPE BLAN
								REPL fechaop WITH m.fechaem
								REPL articulo WITH formu
								REPL opk WITH 5
								REPL docref WITH 'ND'
								REPL nrodocref WITH m.debito
								REPL cliente WITH procod
								REPL detalle WITH 'Devolucion Nø:'+ALLTRIM(STR(m.debito))
								REPL salida WITH fad.cantidad
								REPL proveedor WITH .T.
								DO repuse
							ELSE
								IF tipopec="T"
									SELE tel
									IF SEEK (LEFT(fad.articulo,10))
										REPL stock WITH stock - fad.cantidad
										DO repuse
									ENDIF
									SELE kar
									APPEND BLANK
									REPL articulo WITH tel.telcod
									REPL unidad WITH tel.unidad
								ELSE
									IF tipopec="A"
										SELE avi
										IF SEEK (LEFT(fad.articulo,10))
											REPL stock WITH stock - fad.cantidad
											DO repuse
										ENDIF
										SELE kar
										APPEND BLANK
										REPL articulo WITH avi.avicod
										REPL unidad WITH avi.unidad
									ELSE
										SELE kar
										APPEND BLANK
										REPL articulo WITH fad.articulo
										REPL unidad WITH m.unidad
									ENDI
								ENDI
								REPL fechaop WITH m.fechaem
								REPL opk WITH 5
								REPL detalle WITH 'Devolucion Nø:'+ALLTRIM(STR(fad.factura))
								REPL salida WITH fad.cantidad
								REPL numero WITH fad.factura
								REPL proveedor WITH pro.procod
								REPL proveedor WITH .T.
								=repuse()
							ENDI
							SELE fad
						ENDS
					ENDIF
				ENDIF
			ELSE
				RELE WIND win10
			ENDIF
		ENDIF
		UNLO IN fad
	ENDIF
ELSE
	=IAUDI()
ENDIF
RETURN

