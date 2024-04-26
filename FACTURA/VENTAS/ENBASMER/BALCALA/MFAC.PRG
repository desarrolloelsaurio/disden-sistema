*********************************************************************
*-- Programa: MFAC.PRG
*-- Fecha   : 01-19-92 07:57pm
*-- Versi¢n : G. REINER
*-- Notas   : MUESTRA FACTURA EMITIDA
********************************************************************************
PARAMETER ESPERA
PRIVATE ESPERA
ulpr=hora_ulp(program())
IF cheqseg()
	STOR nul TO kok
	picu="99999999999.99"
	picu1='99999999'
	picu2='999.99'
	=win1()
	pag=1
	=cabpan()
	SELE MER
	SET ORDER TO tag articulo
	rebla=factmask(.t.)
	c1=1
	c2=18
	c3=36
	c4=44
	c5=53
	c6=65
	DIME carga[3]
	STOR nul TO carga,pretot
	SELE fac
	SCAT MEMV
	=xseek(fac.codcli,'PER','codcli')
	m->clipre=PER.precio
	m->cliiva=PER.condiva
	ACTI WIND win
	@ 1,1 SAY ALLTRIM(PER.codcli)+" "+ALLTRIM(PER.cliente)
	@ 2,1 SAY ALLTRIM(PER.domicilio)+" T.E."+ALLTRIM(PER.telefonos)
	=xseek(PER.localidad,'mix','ciucod')
	nada=mix->texto1
	=xseek(mix->nu1,'mix','prvcod')
	@ 3,1 SAY ALLTRIM(nada)+" "+ALLTRIM(mix->texto1)
	@ 4,1 SAY ALLTRIM(xaciva(PER.condiva,1))+" "+ALLTRIM(PER.nroiva)
	@ 5,13 get janname
	@ 6,13 get m->factura
	SELE via
	IF XSEEK(m->codvia,'VIA','CODVIA')
		nada=via->codvia
		ACTI WIND win
		@ 1,54 get nada
		=xseek(m.condpago,'mix','pagcod')
		STOR mix->texto1 TO nada
		nada=TRANSF(nada,"@R 999-999-999-999-999-999")
		nada1=ALLTRIM(STRTRAN(nada,'-000',SPACE(4)))
		@ 2,57 GET nada1
		STOR nada1 TO m->conpago
		STOR CTOD("01/01/80") TO nada1
		STOR DATE() TO nada2,fechaem
		STOR xauss TO nada9
		@ 4,62 GET fac->fechaem
		nn=iif(fac->moneda=left(xauss,1),xauss,xadols)
		@ 5,70 GET nn
		STOR fac->cotiz TO nada10
		@ 6,56 GET nada10 PICT picu
		clea gets
		STOR NUL TO casos
		stor 90 TO t1
		stor RECNO() TO regi
		STOR 10 TO ren
		SELE FAX
		=SEEK(FAC.FACTURA)
		SCAN whil factura=fac.factura
			@ ren,1 say left(FAX->articulo,10)
			=xseek(FAX.articulo,'mer','articulo')
			@ ren,12 say mer.merca
			@ ren,45 say str(fax.cantidad,4)
			@ ren,52 say str(fax.monto1,10,2)
			xt=fax.monto1*fax.cantidad
			@ ren,64 say str(xt,12,2)
			ren=ren+1
			IF REN>22
				=MEN_LIN('[TECLA] PARA CONTINUAR - [ESC] PARA FIN')
				IF ESPERA .OR. INKEY(nul)=27
					EXIT
				ELSE
					=MEN_LIN(BOTOM)
					=FACTMASK(.F.)
					REN=10
				ENDIF
			ENDIF
		ENDs
		IF LASTKEY()#27 .AND. !ESPERA
			=MEN_LIN('[TECLA] PARA CONTINUAR CON TOTALES - [ESC] PARA FIN')
			IF INKEY(nul)#27
				=FACTMASK(.F.)
				sele fac
				ren=21
				@ 22,15 say "TOTAL:"
				@ 22,62 SAY STR(MONTONET,14,2)
				IF !EMPTY(MONTOOT3)
					@ REN,15 say XACI[3]+':'
					@ REN,62 SAY STR(MONTOOT3,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(MONTOOT2)
					@ REN,15 say XACI[2]
					@ REN,62 SAY STR(MONTOOT2,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(MONTOIVA)
					@ REN,15 say XACI[1]
					@ REN,62 SAY STR(MONTOIVA,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(DESCUENTO)
					@ REN,15 say "NETO"
					@ REN,62 SAY STR(MONTOBRU,14,2)
					REN=REN-1
					@ REN,15 say 'DESCUENTO'
					@ REN,62 SAY STR(DESCUENTO,14,2)
					REN=REN-1
				ENDIF
				IF !EMPTY(MONTO)
					@ REN,15 say 'BRUTO'
					@ REN,62 SAY STR(MONTO,14,2)
					REN=REN-1
				ENDIF
				IF !ESPERA
					=INKEY(nul,'HM')
				ENDIF
			ENDIF
		ENDIF
		IF !ESPERA
			=relewin("win")
		ENDIF
	ENDIF
ELSE
	=iaudi()
ENDI
=men_lin(botom)
RETURN
