********************************************************************************
*-- Programa: progrl.prg
*-- Fecha   : 09/12/91 05:27pm
*-- Version : G. REINER
*-- Notas   : DEFINE EL POPUP progrl
*-- Modif TOTAL goyo 12-19-92 11:30pm
********************************************************************************
FUNCTION grl2
	PARAMETER uno,dos,txt,paimprimir
	ULPR=HORA_ULP(PROGRAM())
	=MOVEWIN(9,1,15,79,'win',' Query de Proveedores '+txt,' [ESC] para Men£ ')
	store 1 to FILmer,filrub,filtem,filmar,filsru
	STORE '.T.' to QUEmer,QUErub,quetem,quemar,quesru
	STORE '' to TTmer,ttrub,tttem,ttmar,ttsru
	STORE .T. TO DEDOS
	***
	for m.i=nul to 1
		=rad_bot(1,2,'filmer','*RT Todos los Productos;Un Producto;Opciones',19,m.i=1)
		if m.i=1
			read cycle
		endif
		if m.i=0 .or. (m.i=1 .and. filmer=3)
			if last()#27 .or. (last()=27 .and. m.i=0)
				IF PAIMPRIMIR
					=rad_bot(1,29,'filrub','*RT Todos los Rubros;Opciones;Resumen',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
					=rad_bot(1,52,'filrub','*RT Todos los Subrubros;Opciones;Resumen',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
					=rad_bot(5,2,'filtem','*RT Todas las Temporadas;Opciones;Resumen',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
					=rad_bot(5,29,'filmar','*RT Todas las Marcas;Opciones;Resumen',19,m.i=1)
					read cycle when last()#27 .and. m.i=1

				ELSE
					=rad_bot(1,29,'filrub','*RT Todos los Rubros;Opciones',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
					=rad_bot(1,52,'filrub','*RT Todos los Subrubros;Opciones',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
					=rad_bot(5,2,'filtem','*RT Todas las Temporadas;Opciones',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
					=rad_bot(5,29,'filmar','*RT Todas las Marcas;Opciones',19,m.i=1)
					read cycle when last()#27 .and. m.i=1
				ENDIF
			endif
		ELSE
			EXIT
		endif
	next
	if lastkey()#27 .and. filmer=3
		IF PAIMPRIMIR
			HABILITADO[2]=qw_rub('mer.rubro')
			HABILITADO[3]=qw_sru('mer.subrubro')
			HABILITADO[14]=qw_tem('mer.temporada')
		ELSE
			=qw_rub('mer.rubro')
			=qw_sru('mer.subrubro')
			=qw_tem('mer.temporada')
		ENDIF
		FISC=""
		FISC=qw_fisc(FISC,querub)
		FISC=qw_fisc(FISC,quesru)
		FISC=qw_FISC(FISC,quetem)
		FISC=IIF(EMPTY(FISC),'.T.',FISC)
		store "Resumen por " to ressu
		ttrub=iif(filrub=3,RESSU+'Rubro',ttrub)
		ttrub=iif(filsru=3,RESSU+'Subrubro',ttsru)
		tttem=iif(filtem=3,RESSU+'Temporada',tttem)
		TTQUE=QW_TT(TTrub)+qw_tt(ttsru)+QW_TT(TTtem)
		IF FILrub=3
			CANT_MAX=2
			DIME TEXTO[2,3],variable[2]
			store .t. to variable
			TEXTO[1,1]='RUBRO'
			TEXTO[1,2]=20
			texto[1,3]="eltexto"
			TEXTO[2,1]='CANTIDAD'
			TEXTO[2,2]=10
			texto[2,3]="TOTAL"
			TT='Listado de Mercader¡as'+ttque
			set order to tag rubcod in rub
			sele mer
			SET ORDER TO
			set rela to mer.rubro into rub
			IF PORPAN
				DO LRESP WITH "LRUBPR","MER",IIF(TYPE("ORDRUB")="U" .OR. ORDRUB,"RUB.CODRUB","RUB.RUBRO"),"RUB.RUBRO"),"MER.RUBRO","RUB.RUBRO",'"|"+STR(GTOTAL)+"|"'
			ELSE
				DO LRESI WITH "LRUBPR","MER",IIF(TYPE("ORDRUB")="U" .OR. ORDRUB,"RUB.CODRUB","RUB.RUBRO"),"RUB.RUBRO"),"MER.RUBRO","RUB.RUBRO",'"|"+STR(GTOTAL)+"|"'
			ENDIF
			=REOPMER()
			STORE .F. TO DEDOS
		ELSE
			IF FILtem=3
				CANT_MAX=2
				DIME TEXTO[2,3],variable[2]
				store .t. to variable
				TEXTO[1,1]='TEMPORADA'
				TEXTO[1,2]=20
				texto[1,3]="eltexto"
				TEXTO[2,1]='CANTIDAD'
				TEXTO[2,2]=10
				texto[2,3]="TOTAL"
				TT='Listado de Mercader¡as'+ttque
				sele pro
				IF PORPAN
					DO LRESP WITH "LRUBPR","MER","MER.TEMPORADA","RUB.RUBRO","MER.TEMPORADA","XTEM[ELCORTE]",'"|"+STR(GTOTAL)+"|"'

				ELSE
					DO LRESI WITH "LRUBPR","MER",IIF(TYPE("ORDRUB")="U" .OR. ORDRUB,"RUB.CODRUB","RUB.RUBRO"),"RUB.RUBRO"),"MER.RUBRO","RUB.RUBRO",'"|"+STR(GTOTAL)+"|"'
				ENDIF
				STORE .F. TO DEDOS
				=REOPmer()
			ENDIF
		ENDIF
	else
		IF filmer=2
			STORE NUL TO RESPUESTA
			IF ELIPRO("",-1,1)
				FISC='PRO.PROCOD="'+PRO.PROCOD+'"'
				TTQUE='Proveedor:'+pro.proveedor
			ENDIF
		ELSE
			IF filmer=1
				TTQUE=""
				FISC=".T."
			ENDIF
		ENDIF
	ENDIF
	IF !EMPTY(WONTOP())
		=releWIN('win')
	ENDIF
RETURN last()#27 .AND. DEDOS
