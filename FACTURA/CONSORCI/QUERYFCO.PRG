********************************************************************************
*-- Programa: QUERYFCO.PRG
*-- Fecha   : 04-06-92 06:44pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE FACTURA DE PROVEEDORES
********************************************************************************
function queryfco
	private nada, i, ressu
	ULPR=HORA_ULP(PROGRAM())
	=MOVECENT(nul,1,16,79,'win',' L¡mites del Listado de Facturas de Proveedores ',' [ESC] para Men£ ')
	store '' to ttfac,ttfec,ttcns,ttpro,ttpag,ttgas,ttmon &&         titulos parciales
	store '.T.' to quefac,quefec,quecns,quepro,quepag,quegas,quemon && que se lista
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filfac','*RT Todas las Facturas;Una Factura;Resumen por Factura',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if last()#27 .and. filfac#2 .or. empty(m.i)
			=rad_bot(1,25,'filfec','*RT Todas las Fechas;Una Fecha;Resumen por Fecha',19,last()#27 .and. m.i=1)
			read cycle when last()#27 .and. m.i=1
			=rad_bot(1,53,'filcns','*RT Todos los Consor.;Un Consorcio;Resumen por Consor.',19,last()#27 .and. m.i=1)
			read cycle when last()#27 .and. m.i=1
			=rad_bot(6,2,'filpro','*RT Todos los Proveed.;Un Proveedor;Resumen por Proveed.',19,last()#27 .and. m.i=1)
			read cycle when last()#27 .and. m.i=1
			=rad_bot(6,25,'filpag','*RT Todas las Condic.;Una Condici¢n;Resumen por Condic.',19,last()#27 .and. m.i=1)
			read cycle when last()#27 .and. m.i=1
			=rad_bot(6,47,'filgas','*RT Todos los Tipos de Gasto;Un Tipo de Gasto;Resumen por Tipo de Gasto',19,last()#27 .and. m.i=1)
			read cycle when last()#27 .and. m.i=1
			=rad_bot(11,25,'filmon','*RT Todos los Montos;Montos Mayores a...;Montos Menores a...',19,last()#27 .and. m.i=1)
			read cycle when last()#27 .and. m.i=1
		endif
	next
	if lastkey()#27

		if filfac=2
			store 0 to respuesta
			if !empty(elifco())
				store 'FAR.FACTURA="'+alltrim(FAR.FACTURA)+'" .AND. FAR.PROCOD="'+alltrim(far.procod)+'"' to quefac
				ttfac='Factura: '+alltrim(far.procod)+" "+alltrim(far.factura)
				acti wind win
				@ 4,2 say alltrim(far.procod)+" "+alltrim(far.factura)
			else
				store 1 to filfac
			endif
		endif
		store .t. to habilitado
    	FOR XA=1 TO 3
	       STORE !EMPTY(XACI[XA]) TO HABILITADO[XA+10]
	    NEXT
	    HABILITADO[14]=HAYCAMPO("MONTOEXE","FAR")
		
		HABILITADO[2]=qw_fec(9,2,'far.fechaem')
		HABILITADO[3]=qw_cns(4,53,'far.concod')
		HABILITADO[6]=qw_pro(6,2,'far.procod')
		HABILITADO[7]=qw_pag(6,25,'far.condpago')
		HABILITADO[16]=qw_gas(6,53,'far.gascod')
		HABILITADO[15]=qw_mon(14,2,'fac.montonet')

		store "Resumen por " to ressu
		TTFAC=IIF(FILFAC=3,RESSU+'Facturas',TTFAC)
		TTCNS=IIF(FILCNS=3,RESSU+'Consorcios',TTCNS)
		TTPRO=IIF(FILPRO=3,RESSU+'Proveedores',TTPRO)
		TTPAG=IIF(FILPAG=3,RESSU+'Cond. de Pago',TTPAG)
		TTGAS=IIF(FILGAS=3,RESSU+'Tipos de Gastos',TTGAS)
		TTMON=IIF(FILMON=3,RESSU+'Montos',TTMON)

		TTQUE=qw_tt(TTFAC)+qw_tt(TTFEC)+qw_tt(TTCNS)+qw_tt(TTPRO)+qw_tt(TTPAG)+qw_tt(TTGAS)+qw_tt(TTMON)

		FISC=''
		FISC=qw_fisc(FISC,QUEFAC)
		FISC=qw_fisc(FISC,QUEFEC)
		FISC=qw_fisc(FISC,QUECNS)
		FISC=qw_fisc(FISC,QUEPRO)
		FISC=qw_fisc(FISC,QUEPAG)
		FISC=qw_fisc(FISC,QUEGAS)
		FISC=qw_fisc(FISC,QUEMON)
		FISC=IIF(EMPTY(FISC),'.T.',FISC)

	endif
	=releWIN('win')
RETURN last()#27 .AND. FILFAC#2
