********************************************************************************
*-- Programa: QUERYPEC.PRG
*-- Fecha   : 08-27-92 05:47pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE NOTAS DE PEDIDO DE COMPRA
*-- Version NOVOGAR
********************************************************************************
FUNCTION QUERYPEC
	parameter porpa
	=MOVEWIN(5,1,22,79,'win',' L¡mites del Listado de Notas de Pedido de Compras - [ESC] para Men£ ')
	store '' to ttemp,ttpec,ttpro,ttfec,ttvia,ttpag,ttmon,ttmer && que se lista
	store '.T.' to queemp,quepec,quepro,quefec,quevia,quepag,quemon,quemer && que se lista
	store 1 to filemp,filpec,filpro,filfec,filvia,filpag,filmon,filmer,FILART
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filemp','*RT Empresa;Anula Listado',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if m.i=0 .or. (m.i=1 .and. filemp=1)
			if last()#27 .or. (last()=27 .and. m.i=0)
				=rad_bot(1,25,'filpec','*RT Todos los Pedidos;Un Pedido;Resumen por pedido',19,m.i=1)
				read cycle when last()#27 .and. m.i=1
				=rad_bot(1,50,'filpro','*RT Todos los Proveedores;Un Proveedor;Res£men por Proveedor',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2
				=rad_bot(6,2,'filfec','*RT Todas las Fechas;Una Fecha;Res£men por Fecha',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2
				=rad_bot(6,25,'filvia','*RT Todos los '+biajas+';Un '+biaja+';Res£men por '+biaja,19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2
				=rad_bot(6,50,'filpag','*RT Todas las Condic.;Una Condici¢n;Res£men por Condic.',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2
				=rad_bot(11,2,'filmon','*RT Todos los Montos;Mayores a...;Menores a...',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2
				=rad_bot(11,25,'filmer','*RT Sin Mercader¡a;Ranking por Producto;Ranking por Monto;Cantidad Art¡culos',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2
				=rad_bot(11,50,'filart','*RT Rubro-Subrubro-Modelo;Rubro-Subrubro;Rubro',19,m.i=1)
				read cycle when last()#27 .and. m.i=1 .and. filpec#2 .AND. FILMER#1
			endif
		ELSE
			EXIT
		endif
	next
	if lastkey()#27 .and. filemp=1
		store nul TO RESPUESTA
		DO OPpec
		=OPMER()
		@ 4,2 say janname
		*** elige pedido
		if filpec=2
			store 0 to respuesta
			if !empty(buspec())
				IF PORPA
					DO Mpec
				ELSE
					if eltipo='A'
						do lpecia with .f.,.f.
					else
						if eltipo='A'
							do lpecib with .f.,.f.
						endif
					endif
				ENDIF
			ELSE
				STORE 1 TO FILpec
			endif
		ELSE
			if filmer#1
				=qw_mer(14,25,'PE1.articulo')
			endif
			FISC=''
			FISC=qw_fisc(FISC,quepec)
			FISC=qw_FISC(FISC,quepro)
			FISC=qw_FISC(FISC,quefec)
			FISC=qw_FISC(FISC,quevia)
			FISC=qw_FISC(FISC,quePAG)
			FISC=qw_FISC(FISC,queMON)
			FISC=qw_FISC(FISC,queMer)
			FISC=IIF(EMPTY(FISC),'.T.',FISC)
			store "Resumen por " to ressu
			ttpec=iif(filpec=3,RESSU+'pedido','Nota de Pedido')
			ttpro=iif(filpro=3,RESSU+'Proveedor',ttpro)
			ttfec=iif(filfec=3,RESSU+'Fecha',ttfec)
			ttvia=iif(filvia=3,RESSU+'Viajante',ttvia)
			ttPAG=iif(filPAG=3,RESSU+'Condici¢n de Venta',ttPAG)
			TTQUE=QW_TT(TTpec)+QW_TT(TTpro)+QW_TT(TTfec)+QW_TT(TTvia)+QW_TT(TTPAG)+QW_TT(TTMON)+QW_TT(TTMer)
		ENDIF
	endif
	IF !EMPTY(WONTOP())
		=releWIN('win')
	ENDIF
RETURN last()#27 .AND. FILpec#2
