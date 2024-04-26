*:*********************************************************************
*-- Programa: ICRE.PRG
*-- Fecha   : 06-09-92 05:43pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA NOTA DE CREDITO PROVEEDORES
*-- Modificaci¢n GOYO 5/4/92
*-- Modificaci¢n GOYO 06-09-92 05:43pm (adaptacion a Nota de Cr‚dito)
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*:*********************************************************************
DECL fechas[6], montocuot[6]
m.unitario=busuni()
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	picu="@Z 99,999,999,999.99999"
	nadalin="³"+SPACE(13)+"³"+SPACE(14)+"³"+SPACE(5)+"³"+SPACE(4)+"³"+SPACE(4)+"³"+SPACE(8)+"³"+SPACE(10)+"³"+SPACE(13)+"³"
	DEFI WINDOW win2 FROM ipedr,ipedc TO ipedr+ipedla,ipedc+ipedan TITL " Ingreso de Notas de Pedido " SHAD COLOR SCHE 8 NONE
	SELE fad
	SCAT MEMV BLAN
	montotot=nul
	ACTI WIND win2
	DO fcdmask
	SELE pro
	STOR nul TO respuesta
	IF !EMPTY(elipro("",1,13))
		m.procod=pro.procod
		ACTI WIND win2
		@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
		@ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
		@ 3,nul SAY pro.localidad
		m.factura=nul
		@ 1,66 GET m.factura PICT "@Z 9999999999"
		READ
		IF m.factura>nul
			SELE far
			IF SEEK(STR(m.factura)+m.procod)
				=movewin(19,5,23,25,'win11',' *** MENSAJE *** ')
				@ 1,nul SAY PADC("YA FUE FACTURADA",20)
				=INKEY(nul)
				=RELEWIN("win11")
			ELSE
				m.procod2=m.procod
				m.factura2=m.factura
				SCAT MEMV BLAN
				m.fechaem=DATE()
				m.procod=m.procod2
				m.factura=m.factura2
				STOR nul TO respuesta
				IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
					m.marca=mix.nu1
					nada=mix.texto1
					ACTI WIND win2
					@ 2,53 GET nada
					CLEA GETS
					@ 3,53 GET m.fechaem
					READ
					respuesta=nul
					m.condpago=elipag("",7,25)
					ACTI WIND win2
					IF !EMPTY(m.condpago)
						m.nada=TRAN(mix.texto1, "@R 999-999-999-999-999-999")
						@ 4,25 GET m.nada
						CLEA GETS
						m.cotiz=xacotiz
						m.moneda=xamoneda
						@ 5,25 GET m.cotiz PICT "@Z 999,999,999,999.99"
						@ 6,25 GET m.moneda PICT "@M "+xadols+","+xauss
						READ
						m.coefi=IIF(m.moneda=xaus,1,m.cotiz)
						montotot=1
						respuesta=nul
						m.gasto=eligas("",7,25)
						ACTI WIND win2
						IF !EMPTY(m.gasto)
							m.nada=mix.texto2
							@ 7,25 GET m.nada
							CLEA GETS
						ENDI
						IF !EMPTY(montotot)
							=movewin(10,nul,23,45,'win10',' *** TOTAL FACTURA *** ')
							@ 1,1 SAY "MONTO TOTAL N. CRED:"
							@ 2,1 SAY "MONTO DESCUENTO    :"
							@ 3,1 SAY "RECARGO FINANCIERO :"
							@ 4,1 SAY "MONTO NETO GRAVADO :"
							@ 5,1 SAY "MONTO I.V.A.       :"
							@ 6,1 SAY "MONTO IMPUESTO 1)  :"
							@ 7,1 SAY "MONTO IMPUESTO 2)  :"
							@ 8,1 SAY "MONTO EXENTO       :"
							@ 9,1 SAY "PERCEPCION         :"
							@10,1 SAY "MONTO TOTAL FACTURA:"
							store nul to m.descuento,m.montoref
							m.montotot=nul
							@ 1,21 GET m.montotot PICT picu
							READ
							@ 2,21 GET m.descuento PICT picu
							@ 3,21 GET m.montoref  PICT picu
							READ
							m.montobru=round(m.montotot - m.descuento+m.montoref,2)
							m.montoiva=round(m.montobru * xaciva(1,2) / 100,2)
							m.montoot2=round(m.montobru * xaciva(1,4) / 100,2)
							m.montoot3=round(m.montobru * xaciva(1,6) / 100,2)
							STORE nul tO m.montoexe, m.montoper
							@ 4,21 GET m.montobru  PICT PICU
							@ 5,21 GET m.montoiva  PICT picu
							@ 6,21 GET m.montoot2  PICT picu
							@ 7,21 GET m.montoot3  PICT picu
							@ 8,21 GET m.montoexe  PICT picu
							@ 9,21 GET m.montoper  PICT picu
							READ
							m.montonet = m.montobru + m.montoiva + m.montoot2 + m.montoot3 + ;
							m.montoexe + m.montoref + m.montoper
							m.montonet=round(m.montonet,2)
							@ 10,21 SAY TRAN(m.montonet,picu)
							GO m.condpago IN mix
							m.nadacuo=STRTRAN(TRAN(mix.texto1, "@R 999-999-999-999-999-999"),"-000")
							m.nrocuotas=(LEN(m.nadacuo)+1)/4
							=movewin(12,46,23,79,'win11',' *** CUOTAS PAGO *** ')
							m.montocuot=ROUND(m.montonet / m.nrocuotas,2)
							m.montoaux=nul
							FOR I=1 TO m.nrocuotas
								m.montoaux=m.montoaux + montocuot[I]
							NEXT
							diff=m.montonet-m.montoaux
							if diff#nul
								montocuot[1]=montocuot[1]+diff
							endif
							montocuot[nrocuotas]=montocuot[nrocuotas] + m.montonet - m.montoaux
							m.montoaux=nul
							DO WHILE m.montoaux#m.montonet
								FOR I=1 TO m.nrocuotas
									fechas[I]=VAL(SUBST(m.nadacuo,4*I-3,3))+m.fechaem
									@ I, 1 GET fechas[I]    PICT "@D"
									@ I,10 GET montocuot[i] PICT picu
								NEXT
								READ
								m.montoaux=nul
								FOR I=1 TO m.nrocuotas
									m.montoaux=m.montoaux + montocuot[i]
								NEXT
							ENDDO
							IF confirma("Grabar la factura del proveedor",.T.,10,10)
								=RELEWIN("win11")
								=RELEWIN("win10")
								=men_lin(grabando)
								SELE ccp
								DO flok WITH "ccp"
								m.nada=m.procod
								m.nada1=m.moneda
								m.fechave=DATE()
								FOR I=1 TO m.nrocuotas
									IF !EMPTY(fechas[i]) .AND. !EMPTY(montocuot[i])
										SCAT MEMV BLAN
										m.compr="FA"+STR(m.factura)
										m.procod=m.nada
										m.fechaop=m.fechaem
										m.detalle="N. Cred. S/Fact N§ "+ALLTRIM(STR(m.factura))
										m.comprre="NC"
										m.numerore=m.factura
										m.moneda=m.nada1
										APPE BLAN
										m.fechave=fechas[i]
										m.monto=montocuot[i]
										m.equivale=m.monto / m.cotiz
										GATH MEMV
										=repuse()
									ENDI
								NEXT
								UNLO IN ccp
								SELE far
								=FLOCK("FAR") .OR. flok("far")
								APPE BLAN
								GATH MEMV
								REPL monto WITH 0-montotot
								REPL tipo WITH "NC"
								REPL productiva WITH '  '
								=repuse()
								UNLO IN far
								SELE fad
							ELSE
								=RELEWIN("win11")
								=relewin("win10")
								SELE fad
								=FLOCK() .OR. flok("fad")
								DELE FOR fad.factura=m.factura .AND. fad.procod=m.procod
								UNLO IN fad
							ENDI
						ENDI
					ENDI
				ENDI
			ENDI
		ENDI
	ENDI
	=RELEWIN("win2")
ELSE
	=iaudi()
ENDI
=men_lin(botom)
RETURN
