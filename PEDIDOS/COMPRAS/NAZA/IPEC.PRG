*:*********************************************************************
*-- Programa: IPEC.prg
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : R. 'EL BATA'
*-- Notas   : INGRESA NOTAS DE PEDIDO PROVEEDORES
*--           MODIFICACION 26-03-92
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 07-27-92 06:43pm RECORTE TIPOFAC.
*:**********************************************************************
m.unitario = busuni()
ULPR=HORA_ULP()
IF CHEQSEG()
	DEFINE WINDOW win2 FROM ipedr,ipedc TO ipedr+ipedla,ipedc+ipedan TITL " Ingreso de Notas de Pedido " SHAD COLOR SCHE 8 NONE
	DO WHILE .T.
		ACTI WIND win2
		DO pecmask
		SELE pec
		SCAT MEMV BLAN
		SELE pro
		STORE nul TO respuesta
		IF !EMPTY(elipro("",1,13))
			m.procod = pro.procod
			ACTI WIND win2
			@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
			@ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
			@ 3,nul SAY pro.localidad
			SELE pec
			@ 1,66 GET m.pedido PICT "@Z 9999999999";
				MESS 'Ingrese Nro de Pedido [ENTER] p/menu'
			READ
			IF !EMPTY(m.pedido)
				SELE pec
				IF !SEEK (STR(m.pedido)+m.procod)
					SELE mar
					STORE nul TO respuesta
					IF !EMPTY(ELIEMP(' [ESC] para Men£ ',2,53))
						m.marca = MIX.NU1
						nada = MIX.TEXTO1
						ACTI WIND win2
						@ 2,53 GET nada
						CLEA GETS
						m.fechaem = DATE()
						@ 3,53 GET m.fechaem
						READ
						DO WHILE m.fechaem>DATE()
							DO cartel2 WITH "La fecha no puede ser mayor","","a la fecha del d¡a de HOY",""
							m.fechaem = DATE()
							@ 3,53 GET m.fechaem
							READ
						ENDDO
						SELE mix
						STORE nul TO respuesta
						ACTI WIND win2
						IF !EMPTY(elipag("",4,15))
							m.condpago1 = LEFT(MIX.TEXTO2,2)
							nada = mix.texto1
							ACTI WIND win2
							@ 4,15 GET nada PICT "@R 999-999-999-999-999-999"
							CLEAR GETS
							@ 4,53 GET m.presup1 PICT "999,999,999,999.99"
							READ
							ACTI WIND win2
							STORE nul TO respuesta
							IF !EMPTY(elipag("",5,15))
								m.condpago2 =LEFT(MIX.TEXTO2,2)
								nada = mix.texto1
								ACTI WIND win2
								@ 5,15 GET nada PICT "@R 999-999-999-999-999-999"
								CLEAR GETS
								@ 5,53 GET m.presup2 PICT "999,999,999,999.99"
								READ
								ACTI WIND win2
								SELE mix
								STORE nul TO respuesta
								IF !EMPTY(elipag("",6,15))
									m.condpago3 = LEFT(MIX.TEXTO2,2)
									nada = mix.texto1
									ACTI WIND win2
									@ 6,15 GET nada PICT "@R 999-999-999-999-999-999"
									CLEAR GETS
									@ 6,53 GET m.presup3 PICT "999,999,999,999.99"
									READ
								ENDIF
							ENDIF
						ENDIF
						ren=10
						kok=nul
						DO WHILE .T.
							nada=m.pedido
							SELE pe1
							SCAT MEMV BLANK
							m.pedido = nada
							m.marca  = 1
							m.procod = pro.procod
							IF ren>22
								ACTI WIND win2
								DO WHILE ren>10
									ren=ren-1
									@ ren,c1 SAY SPACE(16)
									@ ren,c2 SAY SPACE(29)
									@ ren,c3 SAY SPACE(5)
									@ ren,c4 SAY SPACE(6)
									@ ren,c5 SAY SPACE(10)
									@ ren,c6 SAY SPACE(7)
								ENDDO
							ENDIF
							ACTI WIND win2
							STORE nul TO respuesta
							IF !EMPTY(elimer("",ren,c1))
								m.articulo   = mer.articulo
								m.descripcio = LEFT(mer.merca,29)
								ACTI WIND win2
								@ ren ,c1 GET m.articulo
								@ ren ,c2 GET m.descripcio
								CLEAR GETS
								IF m.descripcio#SPACE(29)
									nada = '  '
									ACTI WIND win2
									@ ren, c3 GET m.talle PICTURE "@Z 99.99"
									READ
									IF (m.talle < xatalmin .OR. m.talle > xatalmax) .AND. m.talle > nul
										DO cartel2 WITH "EL TALLE DEBE SER ENTRE "+ALLTRIM(STR(xatalmin)),""," Y "+ALLTRIM(STR(xatalmax)),""
										@ ren,c1 SAY SPACE(15)
										@ ren,c2 SAY SPACE(29)
										@ ren,c3 SAY SPACE(5)
										LOOP
									ENDIF
									ACTI WIND win2
									m.unidad=m.unitario
									ACTI WIND win2
									@ ren, c4 GET unid(m.unidad) PICT "xxxxxx"
									CLEAR GETS
									@ ren, c5 GET m.cantidad PICT "@Z 9999999999"
									READ
									IF m.cantidad>nul
										SELE pe1
										=men_lin(grabando)
										DO flok WITH "PE1"
										APPE BLAN
										GATH MEMV
										=repuse()
										STOR kok+1 TO kok
										UNLO IN pe1
										ren=ren+1
									ELSE
										DO cartel2 WITH "DEBE TENER UNA CANTIDAD","","(NO PUEDE SER CERO)",""
										@ ren,c1 SAY SPACE(15)
										@ ren,c2 SAY SPACE(29)
										@ ren,c3 SAY SPACE(11)
										@ ren,c4 SAY SPACE(10)
									ENDIF
								ELSE
									EXIT
								ENDIF
							ENDDO
							IF !EMPTY(kok)
								IF confirma("Grabar la nota de pedido",.T.,17,10)
									=men_lin(grabando)
									SELE pec
									DO flok WITH "PEC"
									APPE BLAN
									GATH MEMV
									=repuse()
									UNLO IN pec
								ELSE
									SELE pe1
									DO flok WITH "PE1"
									DELE FOR pe1.pedido=m.pedido .AND. pe1.procod=m.procod
									UNLO IN pe1
								ENDIF
							ENDIF
						ENDIF
					ELSE
						=cartel2("LA NOTA DE PEDIDO NRO "+ALLTRIM(STR(m.pedido))," DEL PROVEEDOR "+pro.proveedor," YA FUE EMITIDA","")
					ENDIF
				ENDIF
			ELSE
				EXIT
			ENDIF
		ENDDO
		=RELEWIN("win2")
	ELSE
		=IAUDI()
	ENDIF
RETURN MEN_LIN(BOTOM)
