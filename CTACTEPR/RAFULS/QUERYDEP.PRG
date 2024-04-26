********************************************************************************
*-- Programa: QUERYDEP.PRG
*-- Fecha   : 05-04-92 03:36pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO EN FACTURAS DE COMPRA PENDIENTES
*-- VERSION NOVOGAR
********************************************************************************
FUNCTION QUERYDEP
	parameter porpant
	PRIVATE PORPANT
	ULPR=HORA_ULP(PROGRAM())
	=MOVEWIN(7,1,14,79,'win',' L¡mites del Listado de Deuda Vencida de Proveedores ',' [ESC] para Men£ ')
	store 1 to FILprp,FILFEC,filemp
	STORE '.T.' to QUEprp,QUEfec
	STORE '' to TTprp,TTfec
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if m.i=0 .or. (m.i=1 .and. filemp=1)
			if last()#27 .or. (last()=27 .and. m.i=0)
				=rad_bot(1,23,'filprp','*RT Todos los Proveedores;Un Proveedor;Resumen por Proveedor',19,m.i=1)
				read cycle when last()#27 .and. m.i=1
				=rad_bot(1,52,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
				read cycle when last()#27 .and. m.i=1
			endif
		ELSE
			EXIT
		endif
	next
	if lastkey()#27 .and. filemp=1
		** ELIGE EMPRESA
		store nul TO RESPUESTA
		@ 4,2 say janname
		HABILITADO[1]=qw_prp(4,25,'CCP.PROCOD')
		HABILITADO[2]=qw_fec(4,50,'CCP.fechaop')
		FISC="!pagada .AND. (EMPTY(CCP.COMPRRE) .OR. CCP.COMPRRE='FA' .or. CCP.COMPRRE='ND')"
		FISC=qw_fisc(FISC,queprp)
		FISC=qw_FISC(FISC,quefec)
		FISC=IIF(EMPTY(FISC),'.T.',FISC)
		store "Resumen por " to ressu
		ttprp=iif(filprp=3,RESSU+'Proveedor',ttprp)
		ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
		date=INFEC('WIN','de corte de la Deuda')
		FISC=FISC+' .AND. FECHAVE<=DATE'
		TTQUE='Deuda Vencida al d¡a '+dtoc(date)+QW_TT(TTprp)+QW_TT(TTFEC)
	endif
	IF !EMPTY(WONTOP())
		=releWIN('win')
	ENDIF
RETURN last()#27
