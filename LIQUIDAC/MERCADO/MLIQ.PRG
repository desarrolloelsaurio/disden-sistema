****************************************************************************
*-- Programa: MLIQ.PRG
*-- Fecha   : 08-14-92 02:03pm
*-- Versi¢n : BANALOTTI
*-- Notas   : MUESTRA LIQUIDACION EMITIDA MERCADO
****************************************************************************
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
	@ 1,1 SAY "Proveedor:"
	@ 5,1 SAY "Liquidaci¢n N§:"
	@ 4,45 SAY "Fecha de emisi¢n:"
	DIME carga[3]
	STOR nul TO carga,pretot
	SELE far
	SCAT MEMV
	=XSEEK(FAR.PROCOD,'PRO','PROCOD')
	m.cliiva=PRO.condiva
	ACTI WIND win
	@ 1,1 SAY ALLTRIM(PRO.PROCOD)+" "+ALLTRIM(PRO.PROVEEDOR)
	@ 2,1 SAY ALLTRIM(PRO.domicilio)+" T.E."+ALLTRIM(PRO.telefono)
	=XSEEK(PRO.local,"MIX",'CIUCOD')
	nada=mix.texto1
	=XSEEK(mix.nu1,"MIX",'PRVCOD')
	@ 3,1 SAY ALLTRIM(nada)+" "+ALLTRIM(mix.texto1)
	@ 4,1 SAY ALLTRIM(xaciva(PRO.condiva,1))+" "+ALLTRIM(PRO.nroiva)
	STOR nul TO respuesta
	ACTI WIND win
	@ 5,13 get m.factura
	ACTI WIND win
	SELE mix
	STOR CTOD("01/01/80") TO nada1
	STOR DATE() TO nada2,fechaem
	STOR xauss TO nada9
	@ 4,62 GET FAR.fechaem
	clear gets
	nn=iif(FAR.moneda=left(xauss,1),xauss,xadols)
	@ 5,45 SAY "Se factura en "+alltrim(nn)
	STOR NUL TO casos
	SELE FAD
	IF SEEK(FAR.FACTURA)
		stor RECNO() TO regi
		GOTO regi
		ren=9
		SCAN whil FAD.factura=FAR.factura
			SELE MER
			SET ORDER TO TAG ARTICULO
			if seek(ALLTRIM(FAD.articulo))
				napalpo=left(palpopup,30)
			else
				napalpo="Inexistente"
			endif
			@ ren,c1 get napalpo
			@ ren,c2 get FAD.cantidad picture "99999.99"
			@ ren,c3 get FAD.monto picture "999999999.99"
			clea gets
			STOR str(round(FAD.cantidad*FAD.monto,2),14,2) TO nada
			@ ren,c4 get nada
			clea gets
			sele FAD
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
	sele far
	acti wind win
	ren=22
	IF !EMPTY(MONTOPER)
		@ REN,15 say "RETENCION:"
		@ REN,c4 SAY STR(MONTOPER,14,2)
		REN=REN-1
	ENDIF
	nada=round(far.monto-far.descuento+far.montoot2+far.montoiva-(far.nogravado+far.monsei+far.monsen),2)
	@ REN,15 say "TOTAL:"
	@ REN,c4 SAY STR(nada,14,2)
	REN=REN-1
	IF !EMPTY(NOGRAVADO)
		@ REN,15 say "GASTOS"
		@ REN,c4 SAY STR(NOGRAVADO,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONSEI)
		@ REN,15 say "IVA SERVICIOS"
		@ REN,c4 SAY STR(MONSEI,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONSEN)
		@ REN,15 say "IVA SERV. NO INSC"
		@ REN,c4 SAY STR(MONSEN,14,2)
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
		@ REN,15 say "GRAVADO"
		@ REN,c4 SAY STR(MONTOBRU,14,2)
		REN=REN-1
		@ REN,15 say 'SERVICIOS'
		@ REN,c4 SAY STR(DESCUENTO,14,2)
		REN=REN-1
	ENDIF
	IF !EMPTY(MONTO)
		@ REN,15 say 'BRUTO'
		@ REN,c4 SAY STR(MONTO,14,2)
		REN=REN-1
	ENDIF
RETURN .T.
