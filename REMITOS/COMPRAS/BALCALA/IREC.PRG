*:*********************************************************************
*-- Programa: irec
*-- Fecha   : 06/06/91 04:30pm
*-- Versi¢n : goyo
*-- Notas   : INGRESA REMITO PROVEEDORES
*--           MODIFICACION 26-03-92
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 07-27-92 06:43pm RECORTE TIPOFAC.
*:**********************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=MOVEWINN(NUL,NUL,24,79,'WIN2')
	REBLA=Recmask()
	SELE rec
	SCAT MEMV BLAN
	SELE pro
	STORE nul TO respuesta,puntero,pexito
	IF !EMPTY(elipro("",1,13))
		m.procod = pro.procod
		@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
		@ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
		@ 3,nul SAY pro.localidad
		SELE rec
		@ 1,53 GET m.remito PICT "@!";
		MESS 'Ingrese Nro de remito [ENTER] p/menu'
		READ
		M.remito=Q_FAC(M.remito)
		@ 1,53 GET M.remito
		CLEA GETS
		M.ELNUMERO=M.REMITO
		IF !EMPTY(m.remito) .AND. RIGHT(M.remito,8)#'00000000'
			SELE rec
			IF !SEEK(m.remito+m.procod)
				nada = JANNAME
				@ 2,53 GET nada
				CLEA GETS
				m.FECHAEM= DATE()
				@ 3,53 GET m.FECHAEM
				READ
				DO WHILE m.fechaem>DATE()
					DO cartel2 WITH "La fecha no puede ser mayor","","a la fecha del d¡a de HOY",""
					m.fechaem = DATE()
					@ 3,53 GET m.fechaem
					READ
				ENDDO
				ren=8
				=XMERP()
				IF Irec1()
					IF confirma("Grabar el Remito de Proveedor",.T.,17,10)
						M.REMITO=M.ELNUMERO
						M.NUMERO=M.ELNUMERO
						M.FECHAREM=M.FECHAEM
						=AGRABAR("rec")
						=AGRABAR("re1",@PEXITO)
						store '' to m.cCODVIA
						SET ORDER TO TAG ARTICULO IN MER
						FOR A=1 TO ALEN(PEXITO,1)
							store m.FECHAEM to m.FECHAOP
							store PEXITO[A,3] to m.ARTICULO
							store '02' to m.OPK
							store 'RC' to m.DOCREF
							store M.REMITO to m.NRODOCREF
							store '' to m.CLIENTE
							store 'Remito de Compra ' to m.DETALLE
							store PEXITO[A,4] to m.ENTRADA
							store 0 to m.SALIDA
							store pexito[a,5] to m.ENPESO
							=AGRABAR("KAR")
							SELE MER
							IF SEEK(M.ARTICULO)
								REGISTRO=STR(RECNO())
								=LOCK() .OR. LOK()
								REPL STOCK WITH STOCK+M.ENTRADA
								IF MER.DISCRIM
									REPL STOCKPES WITH STOCKPES+M.ENPESO
								ENDIF
								UNLO IN MER
							ENDIF
						NEXT
						=IAUD(M.remito+PAIP+PRO.PROCOD)
					ENDIF
				ENDIF
				sele mer
				SET ORDER TO TAG ARTICULO
			ELSE
				=cartel2("EL REMITO N§ "+ALLTRIM(m.remito)," DEL PROVEEDOR "+ALLTRIM(pro.proveedor)," YA FUE INGRESADA","NO SE PUEDE MODIFICAR")
			ENDIF
		ENDIF
	ENDIF
	=RELEWIN("win2")
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
