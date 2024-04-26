********************************************************************************
*-- Programa: QUERYFAC.PRG
*-- Fecha   : 04-16-92 01:05pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE FACTURAS
*-- Modificaci¢n GOYO 07-23-92 00:25am marca -> empresa
*-- Modificaci¢n GOYO 12-17-92 10:38am (agrego disp_fac)
********************************************************************************
FUNCTION QUERYFAC
	PARAMETER PORPA
	PRIVATE PORPA
	=MOVEWIN(6,1,22,79,'win',' L¡mites del Listado de '+ALLTRIM(PROPER(TIT_INVOS))+' ',' [ESC] para Men£ ')
	store '' to ttemp,ttfac,ttcli,ttfec,ttvia,ttpag,ttmon,ttmer && que se lista
	store '.T.' to queemp,quefac,quecli,quefec,quevia,quepag,quemon,quemer && que se lista
	store 1 to filemp,filfac,filcli,filfec,filvia,filpag,filmon,filmer
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if m.i=0 .or. (m.i=1 .and. filemp=1)
			if last()#27 .or. (last()=27 .and. m.i=0)
				=rad_bot(1,25,'filfac','*RT Todas las Facturas;Una Factura',19,m.i=1)
				read cycle when last()#27 .and. m.i=1
				=rad_bot(1,50,'filcli','*RT Todos los Clientes;Un Cliente;Res£men por Cliente',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2

				IF FILCLI=3
				=rad_bot(6,2,'filfec','*RT Todas las Fechas;Una Fecha',19,m.i=1)
				ELSE
				=rad_bot(6,2,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
				ENDIF
				read cycle when last()#27 .and. m.i=1 .and. filfac#2

				IF FILCLI=3 .OR. FILFEC=3
 				=rad_bot(6,25,'filvia','*RT Todos los '+biajas+';Un '+biaja,19,m.i=1)
				ELSE
				=rad_bot(6,25,'filvia','*RT Todos los '+biajas+';Un '+biaja+';Res£men por '+biaja,19,m.i=1)
				ENDIF
				read cycle when last()#27 .and. m.i=1 .and. filfac#2

				IF FILCLI=3 .OR. FILFEC=3 .OR. FILVIA=3
				=rad_bot(6,50,'filpag','*RT Todas las Condic.;Una Condici¢n',19,m.i=1)
				ELSE
				=rad_bot(6,50,'filpag','*RT Todas las Condic.;Una Condici¢n;Res£men por Condic.',19,m.i=1)
				ENDIF
				read cycle when last()#27 .and. m.i=1 .and. filfac#2


				=rad_bot(11,2,'filmon','*RT Todos los Montos;Montos Mayores a...;Montos Menores a...',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filfac#2

                IF FILCLI=3 .OR. FILFEC=3 .OR. FILVIA=3 .OR. FILPAG=3
				=rad_bot(11,50,'filmer','*RT Sin Mercader¡a',19,m.i=1)
                ELSE
				=rad_bot(11,50,'filmer','*RT Sin Mercader¡a;Resumen por Producto',19,m.i=1)
				ENDIF
				read cycle when last()#27 .and. m.i=1 .and. filfac#2 .AND. ULPR#'LFPR'

			endif
		ELSE
			EXIT
		endif
	next
	if lastkey()#27 .and. filemp=1
		** ELIGE EMPRESA
		store nul TO RESPUESTA
		IF !empty(ELIEMP("a Listar",4,2))
			=OPFAC() WITH JANNRO
			=OPMER() WITH JANNRO
			@ 4,2 say janname
			*** elige factura
			if filfac=2
				store 0 to respuesta
				if (INVOICE='FA' .AND. !empty(ELIFAC())) .OR. (INVOICE="NC" .AND. !EMPTY(BUSCRE())) .OR. (INVOICE="ND" .AND. !EMPTY(BUSDEB()))
					IF PORPA
						DO MFAC
					ELSE
						IF INVOICE='NC'
							IF XSEEK(FAC.FACTURA,'FAX','FACTURA')
								=DISP_FAC(.T.,.F.,.T.)
							ELSE
							   =DISP_CRE(.T.,.F.)
							ENDIF
						ELSE
							IF INVOICE="ND"
								=DISP_ND(.T.,.F.)
							ELSE
								=DISP_FAC(.T.,.F.)
							ENDIF
						ENDIF
					ENDIF
				ELSE
					store 1 to FILfac
				endif
			ELSE
				HABILITADO[5]=qw_cli(4,50,'fac.codcli')
				HABILITADO[2]=qw_fec(9,2,'fac.fechaem')
				HABILITADO[6]=qw_via(9,25,'fac.codvia')
				IF ULPR#'LFAK' .AND. ULPR#'LFPR' .AND. ULPR#'LFACV'
					HABILITADO[7]=qw_pag(9,50,'fac.condpago')
					HABILITADO[14]=qw_mon(14,2,'fac.montonet')
				ELSE
					IF ULPR='LFPR'
						FISC=FIL_INVO+' .AND. fax.MONTO#fax.MONTO1'
					ENDIF
				ENDIF
				if filmer=2
					=qw_mer(14,50,'fax.articulo')
				endif
				FISC=QW_FISC(FISC,FIL_INVO)
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
				ttvia=iif(filvia=3,RESSU+PROPER(BIAJA),ttvia)
				ttPAG=iif(filPAG=3,RESSU+'Condici¢n de Venta',ttPAG)
				TTQUE=QW_TT(TTfac)+QW_TT(TTcli)+QW_TT(TTfec)+QW_TT(TTvia)+QW_TT(TTPAG)+QW_TT(TTMON)+QW_TT(TTMer)
			ENDIF
		endif
	endif
	IF !EMPTY(WONTOP())
		=releWIN('win')
	ENDIF
RETURN last()#27 .AND. FILFAC#2
