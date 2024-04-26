********************************************************************
*-- Programa: IFACD.prg
*-- Fecha   : 11-14-91 03:24pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA FACTURAS PROVEEDORES SIN NOTA DE PEDIDO
*-- Modificaci¢n GOYO
*-- Modificaci¢n GOYO 07-23-92 01:11am marca . empresa
*-- Modificaci¢n GOYO 08-24-92 01:00pm varios
*:*********************************************************************
PARA tipopec, ABRE,ABR,ABR1,tit_sin,tit_pl
DECL fechas[6], montocuot[6]
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	picu="99,999,999,999.99999"
	SELE fad
	SCAT MEMV BLAN
	montotot=0
	=MOVEWIN(10,0,20,79,'WIN2'," Ingreso de "+tit_sin+" de Proveedores ")
	DO fcdmask
	SELE pro
	STOR nul TO respuesta
	IF !EMPTY(elipro("",1,13))
		m.procod=pro.procod
		ACTI WIND win2
		@ 1,2 SAY ALLTRIM(pro.procod)+" "+ALLTRIM(pro.proveedor)
		@ 2,nul SAY ALLTRIM(pro.domicilio)+" T.E."+ALLTRIM(pro.telefono)
		@ 3,nul SAY pro.localidad
		m.factura=SPACE(14)
		@ 1,59 GET m.factura PICT "@!"
		READ
		M.FACTURA=Q_FAC(M.FACTURA)
		IF RIGHT(m.factura,8)#'00000000'
			@ 1,59 GET m.factura PICT "@!"
			CLEA GETS
			SELE far
			SET ORDER TO TAG FACTURA
			IF SEEK(m.factura+m.procod)
				=movewin(19,5,23,25,'win11',' *** MENSAJE *** ')
				@ 1,nul SAY PADC("YA FUE FACTURADA",20)
				=INKEY(nul,'hm')
				=RELEWIN("win11")
			ELSE
				m.procod2=m.procod
				m.factura2=m.factura
				SCAT MEMV BLAN
				m.fechaem=DATE()
				m.procod=m.procod2
				m.factura=m.factura2
				STOR nul TO respuesta
				IF !EMPTY(eliemp(' [ESC] para Men£ ',2,53))
					*					m.marca=MIX.NU1
					nada=mIX.TEXTO1
					ACTI WIND win2
					@ 2,53 GET nada
					CLEA GETS
					@ 3,53 GET m.fechaem
					READ
					respuesta=nul
					m.condpago=elipag("",7,25)
					ACTI WIND win2
					IF !EMPTY(m.condpago)
						M.CONDPAGO=LEFT(MIX.TEXTO2,2)
						m.nada=TRAN(mix.texto1, "@R 999-999-999-999-999-999")
						@ 4,25 GET m.nada
						CLEA GETS
						m.cotiz=xacotiz
						m.moneda=xamoneda
						@ 5,25 GET m.cotiz PICT "999,999,999,999.99"
						@ 6,25 GET m.moneda PICT "@M "+xadols+","+xauss
						READ
						m.coefi=IIF(m.moneda=xaus,1,m.cotiz)
						respuesta=0
						IF !EMPTY(eligas("",7,25))
							ACTI WIND win2
							M.GASTO=MIX.TEXTO2
							m.nada=mix.texto2+'/'+MIX.TEXTO1
							@ 7,25 GET m.nada
							CLEA GETS
						ENDI
						MOVE WIND WIN2 TO 0,0
						=MOVEWIN(10,0,23,45,'WIN10',' *** TOTAL '+tit_sin+' *** ')
						@ 1,1 SAY "MONTO "+padr(abr,12)+":"
						@ 2,1 SAY "MONTO DESCUENTO    :"
						@ 3,1 SAY "MONTO NETO GRAVADO :"
						@ 4,1 SAY "MONTO I.V.A.       :"
						@ 5,1 SAY "MONTO IMPUESTO 1)  :"
						@ 6,1 SAY "MONTO IMPUESTO 2)  :"
						@ 7,1 SAY "MONTO EXENTO       :"
						@ 8,1 SAY "RECARGO FINANCIERO :"
						@ 9,1 SAY "PERCEPCION         :"
						@10,1 SAY "MONTO TOTAL "+padr(abr,7)+":"
						STOR NUL TO m.descuento,m.montotot
						@ 1,21 GET m.montotot PICT picu
						READ
						@ 2,21 GET m.descuento PICT picu
						READ
						m.montobru=m.montotot - m.descuento
						@ 3,21 SAY m.montobru PICT picu
						m.montoiva=m.montobru*xaciva(1,2) / 100
						m.montoot2=m.montobru*xaciva(1,4) / 100
						m.montoot3=m.montobru*xaciva(1,6) / 100
						STORE 0 TO m.montoexe, m.montoref, m.montoper
						@ 4,21 GET m.montoiva PICT picu
						@ 5,21 GET m.montoot2 PICT picu
						@ 6,21 GET m.montoot3 PICT picu
						@ 7,21 GET m.montoexe PICT picu
						@ 8,21 GET m.montoref PICT picu
						@ 9,21 GET m.montoper PICT picu
						READ
						m.montonet = m.montobru+m.montoiva+m.montoot2+m.montoot3+;
						m.montoexe+m.montoref+m.montoper
						m.montonet=round(m.montonet,5)
						@ 10,21 SAY m.montonet PICT picu
						=XSEEK(m.condpago,'mix','PAGCOD')
						m.nadacuo=STRTRAN(TRAN(mix.texto1, "@R 999-999-999-999-999-999"),"-000")
						m.nadacuo=STRTRAN(m.NADACUO,"-   ")
						m.nrocuotas=(LEN(alltrim(m.nadacuo))+1)/4
						=MOVEWIN(12,46,23,79,'WIN11',' *** CUOTAS PAGO *** ')
						m.montocuot=ROUND(m.montonet / m.nrocuotas,5)
						m.montoaux=NUL
						FOR I=1 TO m.nrocuotas
							m.montoaux=m.montoaux+montocuot[I]
						NEXT
						diff=m.montonet-m.montoaux
						if diff#0
							montocuot[1]=montocuot[1]+diff
						endif
						montocuot[nrocuotas]=montocuot[nrocuotas]+m.montonet - m.montoaux
						m.montoaux=NUL
						DO WHILE m.montoaux#m.montonet
							FOR I=1 TO m.nrocuotas
								fechas[I]=VAL(SUBST(m.nadacuo,4*I-3,3))+m.fechaem
								@ I, 1 GET fechas[I] PICT "@D"
								@ I,10 GET montocuot[i] PICT picu
							NEXT
							READ
							m.montoaux=NUL
							FOR I=1 TO m.nrocuotas
								m.montoaux=m.montoaux+montocuot[i]
							NEXT
						ENDDO
						IF confirma("Grabar "+tit_sin+" del Proveedor",.T.,10,10)
							=RELEWIN("win10")
							=RELEWIN("win11")
							SELE ccp
							m.nada=m.procod
							m.nada1=m.moneda
							m.fechave=DATE()
							FOR I=1 TO m.nrocuotas
								IF !EMPTY(fechas[i]) .AND. !EMPTY(montocuot[i])
									SCAT MEMV BLAN
									m.compr=ABRE+" "+m.factura
									m.procod=m.nada
									m.fechaop=m.fechaem
									m.detalle="Rec. "+ABR1+" N§ "+m.factura
									m.comprre=ABRE
									m.numerore=m.factura
									m.moneda=m.nada1
									m.fechave=fechas[i]
									m.monto=montocuot[i]
									m.equivale=m.monto / m.cotiz
									=AGRABAR("CCP")
								ENDI
							NEXT
							M.monto=montotot
							M.tipo=ABRE
							=AGRABAR("FAR")
						ELSE
							=RELEWIN("win10")
							=RELEWIN("win11")
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
