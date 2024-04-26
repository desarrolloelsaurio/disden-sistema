****************************************
*-- Programa: REMI.PRG
*-- Fecha   : 04-30-92 03:26pm
*-- Versi¢n : G. REINER
*-- Notas   : GENERA REMITO INTERNO
*****************************************
ulpr=hora_ulp(program())
if cheqseg()
	DO WHIL .T.
		STORE .T. TO INTERNA
		STOR NUL TO kok,PUNTERO
		picu="9999999999.99"
		=win1()
		ULPR=PROGRAM()
		=cabpan()
		store 1 to pag,c1
		c2=12
		c3=43
		store 52 to c4,c5
		c6=63
		REBLA=remImask(.t.)
		STOR .T. TO sigue
		STOR .F. TO fuera
		DIME carga[3]
		STORE '' TO ARTANT
		ON KEY LABEL TAB KEYBOARD ARTANT
		stor nul to respuesta,carga,pretot,CANTOT
		IF jannro#0
			STOR jannro TO m.marca,nadmar
			nada=mix.texto1
			@ 5,13 SAY janname
			JANNRO=M.NADMAR
			M.PUNMAR=(JANNRO-1)*20+4
			GO M.PUNMAR IN DOC
			m.Remito=doc.numero
			@ 6,13 GET M.Remito
			READ
			if !EMPTY(M.REMITO) .AND. ;
   			 !xSEEK(M.REMITO,'rem','Remito') .and. ;
				 Last()#27
				NADrem=M.REMITO
				STOR NUL TO respuesta
				sele rem
				scat memv blan
				m.Remito=nadrem
				SELE via
				STOR NUL TO respuesta
				IF !empty(elivia("",1,55))
					m.codvia=via.codvia
					m.codcli=''
					acti wind win
					@ 1,54 SAY m.codvia
					STOR CTOD("01/01/80") TO nada1
					STOR DATE() TO nada2,fechaem
					STOR xauss TO nada9
					STOR "@M "+Alltrim(xauss)+","+Alltrim(xadols) TO nn
					@ 4,62  GET m.fechaem PICT "@D" RANGE nada1,nada2;
					MESS "Fecha de emisi¢n del Remito - [ESC] para Salir"
					READ
					IF LASTKEY()=27
						=RELEwin('win')
						EXIT
					ENDI
					ren=9
					namer=NUL
					DO WHILE .T.
						acti wind win
						STOR .T. TO conti
						SELE rex
						SCAT memv BLANK
						m.Remito=nadrem
						m.marca=nadmar
						STORE NUL TO M.PESO
						ren=ren+1
						STOR NUL TO respuesta
						IF !empty(elimer(" a Remitir - [ESC] para Salir - [TAB] Repite ",ren,c1)) && OJO
							store namer+1 to namer
							STOR mer.articulo TO m.articulo
							store alltrim(m.articulo) to ARTANT
							acti wind win
							@ ren,c1 SAY LEFT(m.articulo,10)
							@ ren,c2 SAY LEFT(mer.merca,30)
							SELE rex
							store 0 to sope
							IF MER.DISCRIM
								@ ren,c3 GET m.cantidad PICTU '99999.99';
								MESS " Peso a Remitir "
								READ
								STORE 0 TO RESPUESTA
								m.sope=INFIC('Ctdd. Unid. '+alltrim(mer.merca),9999999)
							ELSE
								@ ren,c3 GET m.cantidad PICTU '99999';
								MESS " Cantidad a Remitir "
								READ
							ENDIF
							IF empty(m.cantidad)
								@ ren,nul SAY rebla
								ren=ren-1
								LOOP
							ENDI
							m.max=m.cantidad
							REGISTRO=STR(RECNO("MER"))
							=LOCK(REGISTRO,'MER') .OR. LOK('MER')
							if mer.discrim
								IF MER.stockpes<m.cantidad
									m.max=MER.stockpes
								ENDI
							else
								IF MER.stock<m.cantidad
									m.max=MER.stock
								ENDI
							endif
							UNITARIO=PORCEN(MER.COSTO,MER.precio1)
							unitario=round(unitario,2)
							IF empty(m.max) .OR. m.max<NUL
								=mensaj1(" NO HAY EXISTENCIA PARA ESE ARTICULO")
								@ ren,nul SAY rebla
								ren=ren-1
								CONTI=.F.
								UNLO IN MER
								LOOP
							ELSE
								IF m.max#m.cantidad
									@ ren,c2 SAY 'ATENCION S¢lo puede enviar' COLO I
									IF MER.DISCRIM
										@ ren,c3 GET m.max PICTU '99999.99'
									ELSE
										@ ren,c3 say m.max PICTU '99999'
									ENDIF
									=INKEY(NUL)
									@ ren,nul SAY rebla
									m.cantidad=m.max
									@ ren,c1 SAY m.articulo
									@ ren,c2 SAY mer.merca
								ENDI
							ENDI
							STOR NUL TO nada
							UNITARIO=round(unitario*XACOTIZ,2)
							m.monto=unitario
							@ ren,c5 GET unitario PICT "9999999.99" RANGE NUL,9999999.99;
							MESS "Confirma/Modifica el Precio Unitario" COLO sche 1
							READ
							IF LASTKEY()=27
								STOR .F. TO sigue
								STOR .T. TO fuera
								=RELEwin('win')
								EXIT
							ENDI
							m.monto1=unitario
							NACA=m.cantidad*unitario
							@ ren,c6 SAY NACA PICT picu
							STOR naca TO nada
							IF conti
								IF confirm1('Los Datos Ingresados',.T.,20,30)
									STOR ROUND(pretot+nada,2) TO pretot
									STOR CANTOT+M.CANTIDAD TO CANTOT
									PUNTERO=PUNTERO+1
									DIME REXITO[PUNTERO,6]
									REXITO[PUNTERO,1]=M.nadrem
									REXITO[PUNTERO,2]=M.ARTICULO
									REXITO[PUNTERO,3]=M.cantidad
									REXITO[PUNTERO,4]=Iif(mer.discrim,M.sope,NUL)
									=REPUSE1(@REXITO,PUNTERO,5)
									@ 8,C6 SAY pretot pict picu
									@ 8,C3 SAY CANTOT PICT '9999999'
									store .t. to sigue,fuera
								ELSE
									@ ren,nul SAY rebla
									ren=ren-1
								ENDI                             && confirma
								IF ren>22
									=remimask(.f.)
									ren=9
								ENDI
							ELSE
								IF LASTKEY()=27
									STOR .T. TO sigue,FUERA
									EXIT
								ELSE
									REN=REN-IIF(REN>9,1,NUL)
								ENDIF
							ENDI                               && elige mercaderia
							IF ren>21
								=remimask(.f.)
								ren=9
							ENDI
						ELSE
							IF LAST()=27
								fuera=PUNTERO<1
								EXIT
							ELSE
								REN=REN-1
							ENDIF
						ENDIF
					ENDD                                   && WHIL .t.
					IF fuera
						exit
					ENDI
				ELSE                                     && ELIVIA
					loop
				ENDIF                                    &&ELIVIA
			ELSE                                       &&REMITO EXISTE
				if found()
					=cartel2("EL REMITO"+STR(m.Remito),;
					"YA FUE EMITIDO",;
					"POR FAVOR",;
					"REVISE Y REINTENTE")
				endif
				exit
			ENDI                                       &&REMITO EXISTE
		ELSE
			EXIT
		ENDIF
		IF PUNTERO>0
			IF sigue
				IF confirma("el Remito",.T.,20,30)
					m.fecha=DATE()
					m.usuario=usador
					M.VALORIZ=PRETOT
					=AGRABAR("REM")
					STORE RECNO() TO naregi
					=AGRABAR("REX",@REXITO)
					registro=str(PUNMAR)
					DO LOK WITH "DOC"
					GO PUNMAR IN DOC
					REPL DOC.NUMERO WITH M.REMITO+1
					UNLO IN DOC
					SELE rex
					=xseek(m.Remito,'rex','remito')
					SCAN WHIL rex.Remito=m.Remito
						SELE MER
						IF XSEEK(REX.ARTICULO,'MER','ARTICULO')
							SELE kar
							=FLOCK("KAR") .OR. LOK("KAR")
							APPE BLANK
							REPL kar.fechaop WITH REM.FECHAEM
							REPL kar.articulo WITH rex.articulo
							REPL kar.opk WITH '04'
							repl kar.docref WITH "RI"
							REPL kar.nrodocref WITH Q_FAC(SUCU+'-'+ALLTRIM(STR(REM.Remito)))
							REPL kar.CODVIA  WITH REM.CODVIA
							REPL kar.detalle WITH "REMITO DE VIAJANTE"
							REPL kar.entrada WITH NUL
							REPL kar.salida WITH REX.CANTIDAD
							IF MER.DISCRIM
								REPL KAR.ENPESO WITH REX.peso
							ENDIF
							=repuse()
							UNLO IN KAR
						ENDIF
						SELE rex
					ENDS
					=RELEWIN('WIN')
					acti SCRE
					*IF LEFT(JANNAME,5)="ARCO "
					*   DO lremiA WITH .T.,.f.
					*ELSE
					*   DO lremiL WITH .T.,.f.
					*ENDIF
					UNLO in rem
					STOR .F. TO salir
					SELE DOC
					GOTO PUNMAR
					=LOCK() .OR. LOK(STR(RECNO("DOC")),"DOC")
					REPL doc.numero WITH M.REMITO+1
					UNLO IN DOC
				ELSE
					STOR .F. TO salir
					EXIT
				ENDI
			ENDI
		endif
	enddo
ELSE
	=iaudi()
ENDI
UNLO ALL
=MEN_LIN(BOTOM)
ON KEY LABEL TAB
DEAC WIND ALL
RETURN
