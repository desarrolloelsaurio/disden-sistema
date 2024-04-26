*:*********************************************************************
*-- Programa: RPEC1.PRG
*-- Fecha   : 06/12/91 03:24pm
*-- Version : R. 'EL BATA'
*-- Notas   : REEMPLAZA PRODUCTOS EN UNA LINEA DE LA NOTA DE PEDIDO PROVEEDORES
*:**********************************************************************
DECLARE produto[16]
SELE pec
SCAT MEMV
STORE productiva TO tipopec
STORE RECNO() TO ff
registro=STR(ff)
STORE  =HORA_ULP(PROGRAM()) TO ulpr
IF cheqseg()
	ACTI WIND win2
	CLEA
	=lock("pec") .or. lok('PEC')
	SELE pe1
	ft=""
	ft2=""
	SCAN FOR pedido=m.pedido .AND. procod=m.procod
		IF entregado<cantidad
			ft=ft+ALLTRIM(STR(RECNO()))+","
		ENDIF
		ft2=ft2+ALLTRIM(STR(RECNO()))+","
	ENDSCAN
	ft2=LEFT(ft2,LEN(ft2)-1)
	IF LEN(ft)>0
		ft=LEFT(ft,LEN(ft)-1)
		cuantos=OCCURS(",",ft)+1
		registro = ft
		DO lok WITH 'pe1'
	ENDIF
	SELE pec
	STORE 17 TO COL
	SCAT MEMVAR
	IF EMPTY(pec.fechaent)
		desdecual = 1
		DO WHILE .T.
			DO mpec WITH ft, desdecual
			hastacual=desdecual+13
			IF hastacual>cuantos
				hastacual=cuantos
			ENDIF
			ren=9
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
									@ ren ,c1 GET m.articulo
									nada = mer.merca
									@ ren ,c2 GET nada
									IF m.color>0
										nada1=buscol(SUBSTR(m.articulo,12,2),7)
										@ ren, c6 GET nada1
									ENDIF
								ELSE
									IF tipopec="T"
										SELE tel
										SET ORDER TO 1
										SEEK LEFT(m.articulo,10)
										@ ren ,c1 GET m.articulo
										nada = tel.tela
										@ ren ,c2 GET nada
										IF m.color>0
											GO m.color IN ("MIX")
											nada1 = LEFT(mix.texto1,7)
											@ ren, c6 GET nada1
										ENDIF
									ELSE
										IF tipopec="A"
											SELE avi
											SET ORDER TO 1
											SEEK LEFT(m.articulo,10)
											@ ren ,c1 GET m.articulo
											nada = avi.avios
											@ ren ,c2 GET nada
											IF m.color>0
												GO m.color IN ("MIX")
												nada1 = LEFT(mix.texto1,7)
												@ ren, c6 GET nada1
											ENDIF
										ELSE
											@ ren ,c1 GET m.articulo
											@ ren ,c2 GET m.descripcio
										ENDIF
									ENDIF
								ENDIF
								@ ren, c3 GET m.cantidad PICT "9999999999"
								CLEAR GETS
								STORE nul TO respuesta
								IF !EMPTY(elimer("",ren,c1))
									m.articulo   = mer.articulo
									m.descripcio = mer.merca
									ACTI WIND win2
									@ ren ,c1 GET m.articulo
									@ ren ,c2 GET m.descripcio
									CLEAR GETS
								ENDIF
								IF m.descripcio#SPACE(30)
									ACTI WIND win2
									IF pe1.entregado = 0
										SELE pe1
										REPLACE articulo   WITH m.articulo
										REPLACE descripcio WITH m.descripcio
										DO repuse
									ELSE
										DO cartel2 WITH "FUE PARCIALMENTE ENTREGADO","SE GENERARA UNA NUEVA LINEA","POR LA CANTIDAD PENDIENTE",""
										SELE pe1
										nada=cantidad-entregado
										REPLACE cantidad WITH entregado
										DO repuse
										m.cantidad = nada
										m.entregado = 0
										APPEND BLANK
										GATH MEMV
										DO repuse
										nada=IIF(I=1,0,AT(",",ft,I-1))
										nada1=IIF(I=cuantos,LEN(ft)+1,AT(",",ft,I))
										ft = STUFF(ft, nada, nada1-nada,"")
										IF ft==""
											ft=ALLTRIM(STR(RECNO()))
										ELSE
											ft=ft+","+ALLTRIM(STR(RECNO()))
										ENDIF
										UNLO IN pe1
										registro = ft
										DO lok WITH 'PE1'
									ENDIF
									=iaud(str(m.pedido)+pro.procod)
									SELE pe1
								ENDIF
							ENDIF
						ENDIF
					ENDIF
				ENDIF
				EXIT
			ENDDO
			IF opcion = ii+1 .OR. cuantos=0
				EXIT
			ENDIF
		ENDDO
	ELSE
		DO mpec WITH ft2, 1
		DEFINE WINDOW win10 FROM 21,5 TO 24,69 DOUB TITL ' *** MENSAJE *** ' SHAD COLO SCHE 8
		ACTI WIND win10
		@ 0,0 SAY PADC("FUE TOTALMENTE ENTREGADO",63)
		@ 1,0 SAY PADC("EL DIA "+DTOC(pec.fechaent),63)
		=INKEY(nul)
		RELE WIND win10
	ENDIF
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
