*********************************************************************
*-- Programa: MFAC.PRG
*-- Fecha   : 01-19-92 07:57pm
*-- Versi¢n : G. REINER
*-- Notas   : MUESTRA FACTURA EMITIDA
********************************************************************************
PARAMETER ESPERA
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STOR nul TO kok
	picu="99999999999.99"
	picu1='99999999'
	picu2='999.99'
	=win1()
	pag=1
	=cabpan()
	SELE MER
	SET ORDER TO 1
	REBLA=LMFAC()
	c1=1
	c2=18
	c3=36
	c4=44
	c5=53
	c6=65
	@ 1,1 SAY "Cliente:"
	@ 5,1 SAY "Marca     :"
	@ 6,1 SAY "Factura N§:"
	@ 1,45 SAY biaja+":"
	@ 2,45 SAY "Cond. Pago:"
	@ 4,45 SAY "Fecha de emisi¢n:"
	@ 5,45 SAY "Moneda en que se factura:"
	@ 6,45 SAY "Cotizaci¢n:"
	DIME carga[3]
	STOR nul TO carga,pretot
	SELE fac
	SCAT MEMV
	=XSEEK(FAC.CODCLI,'PER','CODCLI')
	m.clipre=PER.precio
	m.cliiva=PER.condiva
	ACTI WIND win
	@ 1,1 SAY ALLTRIM(PER.codcli)+" "+ALLTRIM(PER.cliente)
	@ 2,1 SAY ALLTRIM(PER.domicilio)+" T.E."+ALLTRIM(PER.telefonos)
	=XSEEK(PER.localidad,"MIX",'CIUCOD')
	nada=mix.texto1
	=XSEEK(mix.nu1,"MIX",'PRVCOD')
	@ 3,1 SAY ALLTRIM(nada)+" "+ALLTRIM(mix.texto1)
	@ 4,1 SAY ALLTRIM(xaciva(PER.condiva,1))+" "+ALLTRIM(PER.nroiva)
	STOR nul TO respuesta
	nada=JANNAME
	ACTI WIND win
	@ 5,13 get nada
	@ 6,13 get m.factura
	IF XSEEK(m.codvia,'VIA','CODVIA')
		nada=via.codvia
		ACTI WIND win
		@ 1,54 get nada
		SELE mix
		=xseek(m.condpago,'mix','pagcod')
		STOR mix.texto1 TO nada
		nada=TRANSF(nada,"@R 999-999-999-999-999-999")
		nada1=ALLTRIM(STRTRAN(nada,'-000',SPACE(4)))
		@ 2,57 GET nada1
		STOR nada1 TO m.conpago
		STOR CTOD("01/01/80") TO nada1
		STOR DATE() TO nada2,fechaem
		STOR xauss TO nada9
		@ 4,62 GET fac.fechaem
		nn=iif(fac.moneda=left(xauss,1),xauss,xadols)
		@ 5,70 GET nn
		STOR fac.cotiz TO nada10
		@ 6,56 GET nada10 PICT picu
		clea gets
		STOR NUL TO casos
		stor 90 TO t1
		stor ((xatalmax-xatalmin)/xatalstep)+1 TO ccol
		DIME ct(ccol)
		ANCHOR=3
		stor (ccol*ANCHOR+ccol) TO nadatale
		SELE fax
		SEEK STR(FAC.FACTURA)+STR(1)
		stor RECNO() TO regi
		STOR NUL TO max_reg
		SCAN whil fax.factura=fac.factura
			store max_reg+1 to max_reg
		ends
		dime matriz[max_reg,ccol+3]
		store ' ' to matriz
		GOTO regi
		STOR NUL TO nadacan,nadacanu,nadareg
		stor SPACE(ANCHOR) TO ct
		stor .T. TO lnada10
		stor .F. TO lnada12
		store 1 to max_mat
		SCAN whil fax.factura=fac.factura
			store .f. to agrega
			for a=1 to max_mat
				if matriz[a,1]=LEFT(fax.articulo,13) .and. matriz[a,2]=fax.monto1
					if empty(fax.curva)
						stor matriz[a,(((fax.talle-xatalmin)/xatalstep)+4)]+fax.cantidad TO matriz[a,(((fax.talle-xatalmin)/xatalstep)+4)]
					else
						SELE cur
						IF SEEK(fax.curva)
							SCAN whil cur.curva=fax.curva
								stor matriz[a,(((cur.talle-xatalmin)/xatalstep)+4)]+cur.cantidad*fax.cantidad TO matriz[a,(((cur.talle-xatalmin)/xatalstep)+4)]
							ends
						endif
					endif
					store .t. to agrega
					exit
				endif
			NEXT
			if !agrega
				store LEFT(fax.articulo,13) to matriz[max_mat,1]
				store fax.monto1 to matriz[max_mat,2]
				store fax.color to matriz[max_mat,3]
				for b=4 to ccol+3
					STOR NUL TO matriz[max_mat,b]
				NEXT
				if empty(fax.curva)
					stor fax.cantidad TO matriz[max_mat,(((fax.talle-xatalmin)/xatalstep)+4)]
				else
					SELE cur
					IF SEEK(fax.curva)
						SCAN whil cur.curva=fax.curva
							stor cur.cantidad*fax.cantidad TO matriz[max_mat,(((cur.talle-xatalmin)/xatalstep)+4)]
						ends
					endif
					sele fax
				endif
				store max_mat+1 to max_mat
			endif
		endscan
		sele mer
		set order to 1
		STOR NUL TO nadacant
		ren=10
		for a=1 to max_mat-1
			if XSEEK(left(matriz[a,1],13),'MER','ARTICULO')
				@ ren,1 say left(mer.articulo,13)
				@ reN,15 say left(mer.merca,15)
				?? '' AT 31
				STOR NUL TO NADACAN
				FOR I=1 TO ccol
					if matriz[a,i+3]=NUL
						?? space(ANCHOR)
					else
						?? str(matriz[a,i+3],ANCHOR)
						NADACAN=NADACAN+matriz[a,i+3]
					endif
					IF I#CCOL
						?? paip
					ENDIF
				NEXT
				?? "³"
				?? STR(nadacan,4)
				nadacant=nadacant+nadacan
				?? "³"
				?? STR(MATRIZ[A,2],7,2)
				?? "³"
				?? STR(MATRIZ[A,2]*nadacan,11,2)
				ren=ren+1
			ENDIF
			IF REN>22
				IF ESPERA
					=LMFAC1()
					EXIT
				ENDIF
				=MEN_LIN('[TECLA] PARA CONTINUAR - [ESC] PARA FIN')
				IF INKEY(NUL,'HM')=27
					EXIT
				ELSE
					=MEN_LIN(SPACE(80))
					=LMFAC()
					REN=10
				ENDIF
			ENDIF
		NEXT
		IF LASTKEY()#27
			IF ESPERA
				=LMFAC1()
			ELSE
				=MEN_LIN('[TECLA] PARA CONTINUAR CON TOTALES - [ESC] PARA FIN')
				IF INKEY(NUL)#27
					=LMFAC()
					=INKEY(NUL,'HM')
					=LMFAC1()
				ENDIF
			ENDIF
		ENDIF
		IF !ESPERA
			DEAC WIND ALL
		ENDIF
	ENDIF
ELSE
	=iaudi()
ENDI
=MEN_LIN(BOTOM)
RETURN
FUNCTION LMFAC
	rebla=CUADRO("6 7 23 0 2 13 15 23 4 7 11 14")
	@ 8,1 SAY "ARTICULO"
	@ 8,16 SAY "MERCADERIA"
	@ 8,36 SAY "TALLES"
	@ 8,55 SAY "CANT"
	@ 8,60 SAY "UNIT."
	@ 8,69 SAY "TOTAL"
RETURN REBLA
FUNCTION LMFAC1
	sele fac
	ren=21
	@ 22,15 say "TOTAL:"
	@ 22,65 SAY STR(MONTONET,14,2)
	IF !EMPTY(MONTOOT3)
		@ REN,15 say XACI[3]+':'
		@ REN,65 SAY STR(MONTOOT3,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTOOT2)
		@ REN,15 say XACI[2]+':'
		@ REN,65 SAY STR(MONTOOT2,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTOIVA)
		@ REN,15 say XACI[1]+':'
		@ REN,65 SAY STR(MONTOIVA,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(DESCUENTO)
		@ REN,15 say "NETO"
		@ REN,65 SAY STR(MONTOBRU,14,2)
		REN=REN-1
		@ REN,15 say 'DESCUENTO'
		@ REN,65 SAY STR(DESCUENTO,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTO)
		@ REN,15 say 'BRUTO'
		@ REN,65 SAY STR(MONTO,14,2)
		REN=REN-1
	ENDIF
RETURN .T.
