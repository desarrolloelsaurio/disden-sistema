********************************************************************************
*-- Programa: QUERYFAC.PRG
*-- Fecha   : 04-16-92 01:05pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE FACTURAS
********************************************************************************
FUNCTION QUERYFAC
	parameter porpa
	ULPR=HORA_ULP(PROGRAM())
	=MOVEWIN(6,1,22,79,'win',' L¡mites del Listado de '+PROP(TIT_INVO),' [ESC] para Men£ ')
	store '' to ttemp,ttfac,ttcli,ttfec,ttvia,ttpag,ttmon,ttmer,ttasg && que se lista
	store '.T.' to queemp,quefac,quecli,quefec,quevia,quepag,quemon,quemer,queasg && que se lista
	store 1 to filemp,filfac,filcli,filfec,filvia,filpag,filmon,filmer,filasg
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if m.i=0 .or. (m.i=1 .and. filemp=1)
			if last()#27 .or. (last()=27 .and. m.i=0)
				=rad_bot(1,25,'filfac','*RT Todas las '+PROP(TIT_INVOS)+';Una '+PROP(TIT_INVO)+';Resumen por Factura',19,m.i=1)
				read cycle when last()#27 .and. m.i=1
				=rad_bot(1,50,'filcli','*RT Todos los Clientes;Un Cliente;Res£men por Cliente',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(6,2,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(6,25,'filvia','*RT Todos los '+biajas+';Un '+biaja+';Res£men por '+biaja,19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(6,50,'filpag','*RT Todas las Condic.;Una Condici¢n;Res£men por Condic.',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(11,2,'filmer','*RT Sin Mercader¡a;Ranking por Producto;Ranking por Monto',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(11,50,'filasg','*RT Todas;Sin Imputar',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
			endif
		ELSE
			EXIT
		endif
	next
	if lastkey()#27 .and. filemp=1
		store nul TO RESPUESTA
		=OPFAC()
		=OPMER()
		@ 4,2 say janname
		*** elige factura
		if filfac=2
			store 0 to respuesta
			IF INVOICE="FA"
				if !empty(ELIFAC())
					=IIF(PORPA,MFAC(.f.),DISP_FAC())
				ELSE
					STORE 1 TO FILFAC
				endif
			ELSE
				IF INVOICE="NC"
					if !empty(busCRE())
						=IIF(XSEEK(FAC.FACTURA,'FAX','FACTURA'),LCREI2(),lCREI1()
					ELSE
						STORE 1 TO FILFAC
					endif
				ENDIF
			ENDIF
		ELSE
			HABILITADO[5]=qw_cli(4,50,'fac.codcli')
			HABILITADO[2]=qw_fec(9,2,'fac.fechaem')
			HABILITADO[6]=qw_via(9,25,'fac.codvia')
			HABILITADO[7]=qw_pag(9,50,'fac.condpago')
			IF ALEN(HABILITADO,1)>13
				HABILITADO[14]=qw_mon(14,2,'fac.montonet')
			ELSE
				=qw_mon(14,2,'fac.montonet')
			ENDIF
			if filmer=2 .OR. FILMER=3
				=qw_mer(14,50,'fax.articulo')
			endif
			FISC=FIL_INVO
			FISC=qw_fisc(FISC,quefac)
			FISC=qw_FISC(FISC,quecli)
			FISC=qw_FISC(FISC,quefec)
			FISC=qw_FISC(FISC,quevia)
			FISC=qw_FISC(FISC,quePAG)
			FISC=qw_FISC(FISC,queMer)
			if filasg=2
				FISC=fisc+'.and. !fax.imputada'
			endif
			FISC=IIF(EMPTY(FISC),'.T.',FISC)
			store "Resumen por " to ressu
			ttfac=iif(filfac=3,RESSU+'Factura',ttfac)
			ttcli=iif(filcli=3,RESSU+'Cliente',ttcli)
			ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
			ttvia=iif(filvia=3,RESSU+'Viajante',ttvia)
			ttPAG=iif(filPAG=3,RESSU+'Condici¢n de Venta',ttPAG)
			ttasg=iif(filasg=2,'No imputadas','')
			TTQUE=QW_TT(TTfac)+QW_TT(TTcli)+QW_TT(TTfec)+QW_TT(TTvia)+QW_TT(TTPAG)+QW_TT(TTMer)+QW_TT(TTASG)
		ENDIF
	endif
	IF !EMPTY(WONTOP())
		=releWIN('win')
	ENDIF
RETURN last()#27 .AND. FILFAC#2
