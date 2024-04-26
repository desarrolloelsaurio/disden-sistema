**********************************************************************
*-- Programa: ZPED
*-- Fecha   : 08-09-92 11:46pm
*-- Versi¢n : G. REINER
*-- Notas   : GENERACION DIRECTA DE NOTA DE PEDIDO
*-- Modificaci¢n GOYO 07-23-92 01:11am marca  -> empresa
*-- Modificaci¢n GOYO 08-04-92 04:03pm adaptacion de facx a iped
*-- Modificaci¢n GOYO adaptacion iped->zped
********************************************************************************
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
	STOR .T. TO salir
		RELE TALE,FAXT,fechas,montocuot,fec,nad
		picu="99999999999.99"
		faxt=.f.
		=win1()
		pag=1
		=cabpan()
		REBLA=CUADRO("4 7 23 0 1 16 34 11 14")
		@ 8,1 SAY "ARTICULO"
		@ 8,18 SAY "MERCADERIA"
		@ 8,36 SAY "TAL/CUR"
		@ 8,44 SAY "CANTIDAD"
		@ 8,53 SAY "PRECIO UNI."
		@ 8,66 SAY "PRECIO TOTAL"
		c1=1
		c2=18
		c3=36
		c4=44
		c5=53
		c6=65
		@ 1,1 SAY "Cliente:"
		@ 5,1 SAY "Empresa   :"
		@ 6,1 SAY "Pedido  N§:"
		@ 1,45 SAY "Viajante:"
		@ 2,45 SAY "Cond. Pago:"
		@ 4,45 SAY "Fecha de emisi¢n:"
		STOR .T. TO sigue
		STOR .F. TO fuera
		STOR NUL TO pretot
		sele PED
		scat memv
		STOR NUL TO respuesta,CANART
		IF XSEEK(M.CODCLI,'PER','CODCLI')
			m.codcli=PER.codcli
			m.zona =PER.zona
			m.clipre=PER.precio
			m.cliiva=PER.condiva
			acti wind win
			@ 1,1 SAY Alltrim(PER.codcli)+" "+Alltrim(PER.cliente)
			@ 2,1 SAY Alltrim(PER.domicilio)+" T.E."+Alltrim(PER.telefonos)
			=XSEEK(PER.localidad,'MIX','CIUCOD')
			nada=mix.texto1
			=XSEEK(RIGHT(MIX.TEXTO2,2),'MIX','PRVCOD')
			@ 3,1 SAY Alltrim(nada)+" "+Alltrim(mix.texto1)
			@ 4,1 SAY Alltrim(xaciva(PER.condiva,1))+" "+Alltrim(PER.nroiva)
			if LASTKEY()#27
				SELE MIX
				STOR NUL TO respuesta
				IF .T.
					STOR 1 TO m.marca,nadmar
					nada=JANNAME
					acti wind win
					@ 5,13 SAY JANNAME
					@ 6,13 GET M.pedido
					CLEA GETS
					SELE PEX
					if SEEK(m.CODCLI)
						NADREM=M.pedido
						SELE via
						STOR NUL TO respuesta
						IF XSEEK(M.CODVIA,'VIA','CODVIA')
							m.codvia=via.codvia
							acti wind win
							@ 1,54 SAY m.codvia
							SELE vix
							if xSEEK(m.codvia+'01'+m.zona,'vix','viajadat')
								SELE mix
								STOR NUL TO respuesta
								IF XSEEK(M.CONDPAGO,'MIX','PAGCOD')
									m.condpago=left(mix.texto2,2)
									stor mix.texto1 TO nada
									NADA=TRANSF(NADA,"@R 999-999-999-999-999-999")
									NADA1=ALLTRIM(STRTRAN(NADA,'-000',SPACE(4)))
									acti wind win
									@ 2,57 GET nada1
									clea GETS
									@ 4,62  GET m.fechaem PICT "@D"
									CLEA GETS
									ren=10
									STORE NUL TO PUNTERO
									=iped1()
								ELSE
									=RELEwin('win')
								ENDI                             && COND. PAGO
							ELSE
								DO cartel2 WITH "VIAJANTE","NO","AUTORIZADO","CORRIJA E INTENTE NUEVAMENTE"
								=relewin('win')
							ENDI
						ENDI
					ELSE
						=cartel2("LA NOTA DE PEDIDO"+STR(m.pedido),"NO TIENE DATOS DISPONIBLES","IMPOSIBLE AGREGAR","USE LA OPCION DE INGRESO")
					=RELEwin('win')
					ENDI
				ELSE
					=RELEwin('win')
				ENDI
			ELSE
				=RELEwin('win')
			ENDI
		ELSE
			=RELEwin('win')
			acti SCRE
		ENDI
		IF ISARRAY(@FAXT)
			IF !empty(ALEN(FAXT,1))
				MONTO=PRETOT
				=FLOCK() .OR.  FLOK("peX")
				IF CONFIRM1("las Ampliaciones del Pedido",.T.,20,30)
				=MEN_LIN(GRABANDO)
					=AGRABAR("pex",@FAXT)
					=RELEWIN('WIN')
					RELE TALE,FAXT
					STOR .F. TO salir
				ENDI
			ENDIF
		ENDIF
ELSE
	=iaudi()
ENDI
UNLO ALL
=MEN_LIN(BOTOM)
RETURN
