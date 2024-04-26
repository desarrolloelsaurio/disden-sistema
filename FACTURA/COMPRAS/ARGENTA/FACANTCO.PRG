***************************************************************************
*-- Programa: IFACD.prg
*-- Fecha   : 01-31-92
*-- Versi¢n : V.LEEGSTRA
*-- Notas   : INGRESA FACTURAS PROVEEDORES
***************************************************************************
parameter producto
ipedr=0
ipedc=0
ipedla=24
ipedan=79
c1=1
c2=42
c3=49
c4=60
decl fechas[6], montocuot[6]
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	picu="999999999.99"
	NADALIN="³"+space(40)+"³"+space(6)+"³"+space(10)+"³"+space(14)+"³"
	=movewinn(ipedr,ipedc,ipedr+ipedla,ipedc+ipedan,'WIN2')
	sele fad
	scat memv blan
	montotot=0
	do fcdmask
	sele pro
	stor 0 to respuesta
	if !EMPTY(elipro("",1,13))
		m.procod=pro.procod
		naprove=pro.proveedor
		acti wind win2
		@ 1,1 say alltrim(pro.procod) + " " + alltrim(pro.proveedor)
		@ 2,1 say alltrim(pro.domicilio) + " T.E." + alltrim(pro.telefono)
		@ 3,1 say pro.localidad
		m.factura=0
		@ 1,64 get m.factura pict "@Z 9999999999"
		read
		if m.factura>0
			sele far
			if seek(str(m.factura)+m.procod)
				DEFI wind win11 from 19,5 to 23,25 doub titl ' *** MENSAJE *** ' shad colo sche 8
				acti wind win11
				@ 1,0 say padc("YA FUE FACTURADA",20)
				=inkey(0)
				rele wind win11
			else
				m.procod2=m.procod
				m.factura2=m.factura
				scat memv blan
				m.fechaem=date()
				m.procod=m.procod2
				m.factura=m.factura2
				acti wind win2
				@ 3,53 get m.fechaem
				read
				respuesta=0
				m.condpago=elipag("",7,25)
				acti wind win2
				if !EMPTY(m.condpago)
					regpag=recno()
					m.nada=tran(mix.texto1, "@R 999-999-999-999-999-999")
					nada=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
					@ 4,25 get m.nada
					clea gets
					m.cotiz=xacotiz
					m.moneda=xamoneda
					@ 5,25 get m.cotiz pict "@Z 999,999,999,999.99"
					@ 6,25 get m.moneda pict "@M "+xadols+","+xauss
					read
					m.coefi=iif(m.moneda=xauss,1,m.cotiz)
					ren=10
					if producto
						do while .t.
							sele fad
							m.nada=m.factura
							scat memv blan
							m.factura=m.nada
							m.procod=pro.procod
							acti wind win2
							if ren>22
								FOR REN=REN TO 10 STEP -1
									@ ren,0 SAY NADALIN
									ENDF
								endi
								stor 0 TO respuesta
								if !EMPTY(elimer("",ren,c1))
									m.articulo=mer.rubro+mer.variedad+mer.calidad
									m.detalle=left(chrtran(mer.palpopup," ",""),40)
									ACTI WIND win2
									*                             SELE rem
									*                             set order to remmer
									*                             SET DELE OFF
									*                             nada=right(m.articulo,6)+' '
									*                             IF SEEK(nada)
									@ ren ,c1 GET m.detalle
									*                                clea gets
									*                             ELSE
									*                                do cartel2 with "La mercader¡a",m.detalle,"NO pertenece al remitente",alltrim(naprove)
									*                                @ ren,0 SAY NADALIN
									*                                loop
									*                             ENDIF
									SET DELE ON
								else
									m.articulo=space(13)
									m.detalle=space(40)
								endi
								if !empty(m.detalle)
									nada='  '
									acti wind win2
									@ ren, c2 get m.cantidad pict "@Z 999999"
									read
									if m.cantidad>0
										montounit=0
										@ ren, c3 get m.montounit pict "@Z 9999999.99"
										read
										m.monto=m.montounit * m.cantidad
										@ ren, c4 get m.monto pict "@Z 99999999999.99"
										clea gets
										m.montotot=m.montotot + m.monto
										sele fad
										acti scre
										@ 24,0 say grabando colo sche 19
										do flok with "fad"
										appe blan
										gath memv
										do repuse
										unlo in fad
										ren=ren+1
									else
										do cartel2 with "DEBE TENER UNA CANTIDAD","","(NO PUEDE SER CERO)",""
										@ ren,0 SAY NADALIN
									endi
								else
									exit
								endi
							enddo
							m.gasto=' '
						else
							montotot=1
							respuesta=0
							m.gasto=eligas("",7,25)
							acti wind win2
							if !EMPTY(m.gasto)
								m.nada=mix.texto2
								@ ren,c1 say "Gasto:" get m.nada
								clea gets
							endi
						endi                                 && producto
						if !empty(montotot)
							=movewin(12,0,23,50,'win10',' *** TOTAL FACTURA *** ')
							@ 1,3 SAY "MONTO TOTAL FACTURA : "
							@ 2,3 SAY "MONTO DESCUENTO     : "
							@ 3,3 SAY "MONTO NETO GRAVADO  : "
							@ 4,3 SAY "MONTO I.V.A.        : "
							@ 5,3 SAY "MONTO IMPUESTO 1)   : "
							@ 6,3 SAY "MONTO IMPUESTO 2)   : "
							@ 7,3 SAY "MONTO EXENTO        : "
							@ 8,3 SAY "MONTO TOTAL FACTURA : "
							m.descuento=0
							if producto
								m.montotot=m.montotot * m.coefi
								@ 1,24 SAY TRAN(m.montotot,picu)
							else
								m.montotot=0
								@ 1,24 get m.montotot pict picu
								read
							endi
							@ 2,24 GET m.descuento PICT picu
							READ
							m.montobru=m.montotot - m.descuento
							@ 3,24 SAY TRAN(m.montobru,picu)
							m.montoiva=m.montobru * xaciva(1,2) / 100
							m.montoot2=m.montobru * xaciva(1,4) / 100
							m.montoot3=m.montobru * xaciva(1,6) / 100
							m.montoexe=0
							@ 4,24 GET m.montoiva  PICT picu
							@ 5,24 GET m.montoot2  PICT picu
							@ 6,24 GET m.montoot3  PICT picu
							@ 7,24 GET m.montoexe  PICT picu
							READ
							m.montonet=m.montobru + m.montoiva + m.montoot2 + m.montoot3 + m.montoexe
							@ 8,24 SAY TRAN(m.montonet,picu)
							GO m.regpag IN mix
							m.nadacuo=STRTRAN(TRAN(mix.texto1, "@R 999-999-999-999-999-999"),"-000")
							m.nrocuotas=(LEN(m.nadacuo)+1)/4
							=movewin(12,51,23,79,'win11',' *** CUOTAS PAGO *** ')
							m.montocuot=round(m.montonet / m.nrocuotas,2)
							m.montoaux=0
							FOR I=1 TO m.nrocuotas
								m.montoaux=m.montoaux + montocuot[I]
								ENDF
								montocuot[nrocuotas]=montocuot[nrocuotas] + m.montonet - m.montoaux
								m.montoaux=0
								do while m.montoaux#m.montonet
									FOR I=1 TO m.nrocuotas
										fechas[I]=VAL(SUBST(m.nadacuo,4*I-3,3))+m.fechaem
										@ I, 1 get fechas[I]    pict "@D"
										@ I,10 get montocuot[i] pict picu
										ENDF
										read
										m.montoaux=0
										for i=1 to m.nrocuotas
											m.montoaux=m.montoaux + montocuot[i]
											ENDF
										enddo
										if confirma("Grabar la factura del proveedor",.t.,10,10)
											rele wind win10,win11
											acti scre
											@ 24,0 say grabando colo sche 19
											SELE ccp
											DO flok WITH "ccp"
											m.nada=m.procod
											m.nada1=m.moneda
											m.fechave=date()
											FOR I=1 TO m.nrocuotas
												if !empty(fechas[i]) .and. !empty(montocuot[i])
													SCAT MEMV BLAN
													m.compr="FA"+STR(m.factura)
													m.procod=m.nada
													m.fechaop=m.fechaem
													m.detalle="Rec. FACT N§ "+ALLTRIM(STR(m.factura))
													m.comprre="FA"
													m.numerore=m.factura
													m.moneda=m.nada1
													APPE BLAN
													m.fechave=fechas[i]
													m.monto=montocuot[i]
													m.equivale=m.monto / m.cotiz
													GATH MEMV
													DO repuse
												endi
												ENDF
												UNLO IN ccp
												SELE far
												DO flok WITH "far"
												APPE BLAN
												GATH MEMV
												REPL monto WITH montotot
												REPL tipo with "FA"
												do repuse
												UNLO IN far
											else
												=relewin('win10')
												=relewin('win11')
												sele fad
												do flok with "fad"
												dele for fad.factura=m.factura .and. fad.procod=m.procod
												unlo in fad
											endi
										endi
									endi
								endi
							endi
						endi
						=relewin('win2')
					else
						=iaudi()
					endi
					=men_lin(botom)
				return
