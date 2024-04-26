********************************************************************************
*-- Programa: QUERYFAC.PRG
*-- Fecha   : 04-16-92 01:05pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE FACTURAS
********************************************************************************
FUNCTION QUERYFAC
	parameter porpa
	=MOVEWIN(5,1,22,79,'win',' L¡mites del Listado de '+PROP(TIT_INVO),' [ESC] para Men£ ')
	store '' to ttemp,ttfac,ttcli,ttfec,ttvia,ttpag,ttmon,ttmer && que se lista
	store '.T.' to queemp,quefac,quecli,quefec,quevia,quepag,quemon,quemer && que se lista
	store 1 to filemp,filfac,filcli,filfec,filvia,filpag,filmon,filmer,FILART
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if m.i=0 .or. (m.i=1 .and. filemp=1)
			if last()#27 .or. (last()=27 .and. m.i=0)
				=rad_bot(1,25,'filfac','*RT Todas las '+abr_INVO+';Una '+abr_INVO+';Resumen por '+abr_invo,19,m.i=1)
				read cycle when last()#27 .and. m.i=1
				=rad_bot(1,50,'filcli','*RT Todos los Clientes;Un Cliente;Res£men por Cliente',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(6,2,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(6,25,'filvia','*RT Todos los '+biajas+';Un '+biaja+';Res£men por '+biaja,19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(6,50,'filpag','*RT Todas las Condic.;Una Condici¢n;Res£men por Condic.',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(11,2,'filmon','*RT Todos los Montos;Mayores a...;Menores a...',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(11,25,'filmer','*RT Sin Mercader¡a;Ranking por Producto;Ranking por Monto;Cantidad Art¡culos;Montos',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2
				=rad_bot(11,50,'filart','*RT Rubro-Plano-Color-Talle;Rubro-Plano-Color;Rubro-Plano;N§ Plano',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2 .AND. FILMER#1 .AND. FILMER#4 .and. FILMER#5
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
					IF PORPA
						DO MFAC
					ELSE
						if sucu='0002'
							do lfacb with .f.
						else
							do lfaci with .f.,.f.
						endif
					ENDIF
				ELSE
					STORE 1 TO FILFAC
				endif
			ELSE
				IF INVOICE="NC"
					if !empty(busCRE())
						IF PORPA
							IF XSEEK(FAC.FACTURA,'FAX','FACTURA')
								DO MFAC
							ENDIF
						ELSE
							IF XSEEK(FAC.FACTURA,'FAX','FACTURA')
								if sucu='0002'
									do lfacb with .f.
								ELSE
									DO lfaci WITH .F.,.f.,.t.
								ENDIF
							ELSE
								do lCREI1
							ENDIF
						ENDIF
					ELSE
						STORE 1 TO FILFAC
					endif
				ELSE
					IF INVOICE="ND"
						if !empty(busDEB())
							IF PORPA
								IF XSEEK(FAC.FACTURA,'FAX','FACTURA')
									DO MFAC
								ENDIF
							ELSE
								do lDEBI1
							ENDIF
						ELSE
							STORE 1 TO FILFAC
						endif
					ENDIF
				ENDIF
			ENDIF
		ELSE
			HABILITADO[5]=qw_cli(4,50,'fac.codcli')
			HABILITADO[2]=qw_fec(9,2,'fac.fechaem')
			HABILITADO[6]=qw_via(9,25,'fac.codvia')
			HABILITADO[7]=qw_pag(9,50,'fac.condpago')
			HABILITADO[14]=HAYCAMPO("EXENTO",'FAC')
			HABILITADO[15]=qw_mon(14,2,'fac.montonet')
			if filmer#1 .AND. FILMER#4 .AND. FILMER#5
				=qw_mer(14,25,'fax.articulo')
			endif
			FISC=FIL_INVO
			FISC=qw_fisc(FISC,quefac)
			FISC=qw_FISC(FISC,quecli)
			FISC=qw_FISC(FISC,quefec)
			FISC=qw_FISC(FISC,quevia)
			FISC=qw_FISC(FISC,quePAG)
			FISC=qw_FISC(FISC,queMON)
			FISC=qw_FISC(FISC,queMer)
			FISC=IIF(EMPTY(FISC),'.T.',FISC)
			store "Resumen por " to ressu
			ttfac=iif(filfac=3,RESSU+'Factura',ttfac)
			ttcli=iif(filcli=3,RESSU+'Cliente',ttcli)
			ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
			ttvia=iif(filvia=3,RESSU+'Viajante',ttvia)
			ttPAG=iif(filPAG=3,RESSU+'Condici¢n de Venta',ttPAG)
			TTQUE=QW_TT(TTfac)+QW_TT(TTcli)+QW_TT(TTfec)+QW_TT(TTvia)+QW_TT(TTPAG)+QW_TT(TTMON)+QW_TT(TTMer)
			IF FILMER=4 .OR. FILMER=5
				=releWIN('win')
				IF PORPA
					DO LFACPW WITH (FILMER=5)
				ELSE
					DO LFACIW WITH (FILMER=5)
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	IF !EMPTY(WONTOP())
		=releWIN('win')
	ENDIF
RETURN last()#27 .AND. FILFAC#2
