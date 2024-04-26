****************************************************************************
*-- Programa: MFAC.PRG
*-- Fecha   : 08-14-92 02:03pm
*-- Versi¢n : BANALOTTI
*-- Notas   : MUESTRA FACTURA EMITIDA MERCADO
****************************************************************************
PARAMETER ESPERA
STORE HORA_ULP(PROGRAM()) to ULPR
IF CHEQSEG()
	STOR nul TO kok
	=win1()
	pag=1
	=cabpan()
	SELE MER
	SET ORDER TO TAG ARTICULO
	REBLA=LMFAC()
	c1=1
	c2=32
	c3=41
	c4=54
	@ 1,1 SAY "Cliente:"
	@ 5,1 SAY "Factura N§:"
	@ 1,45 SAY padl(biaja+space(10),10)+":"
	@ 2,45 SAY "Cond. Pago:"
	@ 4,45 SAY "Fecha de emisi¢n:"
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
	ACTI WIND win
	@ 5,13 get m.factura
	NADA=IIF(XSEEK(FAC.codvia,'VIA','CODVIA'),VIA.CODVIA,SPACE(5))
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
	clear gets
	nn=iif(fac.moneda=left(xauss,1),xauss,xadols)
	@ 5,45 SAY "Se factura en "+alltrim(nn)
	STOR NUL TO casos
	SELE fax
	IF SEEK(FAC.FACTURA)
     stor RECNO() TO regi
	 GOTO regi
	 ren=9
	 SCAN whil fax.factura=fac.factura
		SELE MER
		SET ORDER TO TAG ARTICULO
		if seek(ALLTRIM(fax.articulo))
			napalpo=left(palpopup,30)
		else
			napalpo="Inexistente"
		endif
		@ ren,c1 get napalpo
		@ ren,c2 get fax.cantidad picture "99999.99"
		@ ren,c3 get fax.monto picture "999999999.99"
		clea gets
		STOR str(round(fax.cantidad*fax.monto,2),14,2) TO nada
		@ ren,c4 get nada
		clea gets
		sele fax
		ren=ren+1
		IF REN>22
			=MEN_LIN('[TECLA] PARA CONTINUAR - [ESC] PARA FIN')
			IF INKEY(NUL,'HM')=27
				EXIT
			ELSE
				=MEN_LIN(SPACE(80))
				=LMFAC()
				REN=9
			ENDIF
		ENDIF
	ENDSCAN
	=MEN_LIN('[TECLA] PARA CONTINUAR CON TOTALES - [ESC] PARA FIN')
	=inkey(nul,'hm')
	IF lastkey()#27
		=LMFAC()
		=LMFAC1()
		=MEN_LIN('[TECLA] PARA CONTINUAR ')
		=inkey(nul,'hm')
	ENDIF
  ENDIF
ELSE
	=iaudi()
ENDI
=MEN_LIN(BOTOM)
=relewin('win')
RETURN
FUNCTION LMFAC
	rebla=CUADRO("4 6 23 0 2 30 8 12 14")
	@ 7,1  SAY "MERCADERIA"
	@ 7,32 SAY "CANTIDAD"
	@ 7,41 SAY "PRECIO UNIT."
	@ 7,55 SAY "PRECIO TOTAL"
RETURN REBLA
FUNCTION LMFAC1
	sele fac
	acti wind win
	ren=21
	@ 22,15 say "TOTAL:"
	@ 22,c4 SAY STR(MONTONET,14,2)
	IF !EMPTY(MONTOEXE)
		@ REN,15 say "EXENTO"
		@ REN,c4 SAY STR(MONTOEXE,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTOOT3)
		@ REN,15 say XACI[3]+':'
		@ REN,65 SAY STR(MONTOOT3,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTOOT2)
		@ REN,15 say XACI[2]+':'
		@ REN,c4 SAY STR(MONTOOT2,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTOIVA)
		@ REN,15 say XACI[1]+':'
		@ REN,c4 SAY STR(MONTOIVA,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(DESCUENTO)
		@ REN,15 say "NETO"
		@ REN,c4 SAY STR(MONTOBRU,14,2)
		REN=REN-1
		@ REN,15 say 'DESCUENTO'
		@ REN,c4 SAY STR(DESCUENTO,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTO)
		@ REN,15 say 'BRUTO'
		@ REN,c4 SAY STR(MONTO,14,2)
		REN=REN-1
	ENDIF
RETURN .T.
