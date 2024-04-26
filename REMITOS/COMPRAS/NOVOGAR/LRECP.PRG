*:*********************************************************************
*-- Programa: LRECP.PRG
*-- Fecha   : 02-11-93 02:06pm
*-- Versi¢n : G. REINER
*-- Notas   : MUESTRA REMITOS DE PROVEEDORES
*:**********************************************************************
STORE HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
	=movewinn(0,0,24,79,'win2')
	REBLA=PECmask(.F.,.T.)
	SELE REC
	SCAT MEMV
	STORE nul TO respuesta,puntero,pexito
	IF XSEEK(M.PROCOD,'PRO','PROCOD')
		m.procod = pro.procod
		ACTI WIND win2
		@ 1,2 SAY ALLTRIM(pro.procod) + " " + ALLTRIM(pro.proveedor)
		@ 2,nul SAY ALLTRIM(pro.domicilio) + " T.E." + ALLTRIM(pro.telefono)
		=XSEEK(PRO.LOCAL,'MIX','CIUCOD')
		@ 3,nul SAY MIX.TEXTO1
		SELE REC
		@ 1,53 GET m.REMITO PICT "@!"
		CLEA GETS
		STORE nul TO respuesta
		nada = JANNAME
		ACTI WIND win2
		@ 2,53 GET nada
		CLEA GETS
		@ 3,53 GET m.fechaRem
		STORE IIF(EMPTY(REC.FACTURA),"PENDIENTE DE FACTURACION","FACTURA:"+REC.FACTURA+' DEL '+REC.FECHAFAC) TO CHIT
        @ 4,0 GET CHIT
		CLEA GETS
		ren=8
		sele RE1
		=seek(REC.REMITO+REC.procod)
		scan while RE1.NUMERO=REC.REMITO .and. RE1.procod=REC.procod
			@ ren ,c1 say RE1.articulo
			=xseek(RE1.articulo,'mer','articulo')
			@ ren ,c2 say mer.merca
			@ ren, c3 say RE1.cantidad PICT "@Z 9999999999"
			@ ren,c4 say RE1.monto pict '999,999,999.99'
			ren=ren+1
		endscan
		=INKEY(NUL,"HM")
	ENDIF
	=RELEWIN("win2")
	=IAUD(REC.REMITO+PAIP+PRO.PROCOD)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
