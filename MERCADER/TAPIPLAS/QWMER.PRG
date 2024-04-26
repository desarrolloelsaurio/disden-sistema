********************************************************************************
*-- Programa: QWMER.PRG
*-- Fecha   : 10-25-92 06:08pm
*-- Version : G. REINER
*-- Notas   : GENERA QUERY PARA LISTADO DE MERCADERIA
*-- Modif. GOYO 10-25-92 06:09pm de QWeryfac a QWmer
********************************************************************************
FUNCTION QWMER
PARAMETER ELTEXTO
=MOVEWIN(5,1,22,79,'win',' Mercader¡as -'+ELTEXTO,' [ESC] para Men£ ')
store '' to ttmer,ttmat,ttpro,ttlin,ttmar,ttrub,ttsru,ttgru,ttcag,ttimp,ttcol
store '.t.' to quemer,quemat,quepro,quelin,quemar,querub,quesru,quegru,quecag,queimp,quecol
store 1 to filmer,filmat,filpro,fillin,filmar,filrub,filsru,filgru,filcag,filimp,filcol
***
for m.i=nul to 1
	=rad_bot(1,2,'filmer','*RT Todos los Productos;Un Producto;Query',19,m.i=1)
	if m.i=1
		read cycle
	endif
	if m.i=0 .or. (m.i=1 .and. filmer=3)
		if last()#27 .or. (last()=27 .and. m.i=0)
			=rad_bot(1,26,'filpro','*RT Todos los Proveedores;Un Proveedor;Resumen por Proveedor',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(1,52,'filimp','*RT Todos los Productos;Nacionales;Importados',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(5,1,'filcol','*RT Todos los Colores;Un Color',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(5,26,'fillin','*RT Todas las L¡neas;Una L¡nea',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(5,52,'filmar','*RT Todas las Marcas;Una Marca',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(8,1,'filrub','*RT Todos los Rubros;Un Rubro',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(8,26,'filsru','*RT Todos los Sub-Rubros;Un Sub-Rubro',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(8,52,'filgru','*RT Todos los Grupos;Un Grupo',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(11,1,'filcag','*RT Todos los C. Agrup.;Un Conc. Agrup',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
			=rad_bot(11,52,'filmat','*RT Todos los Materiales;Un Material',19,m.i=1)
			read cycle when last()#27 .and. m.i=1 .and. filmer=3
		endif
	ELSE
		EXIT
	endif
next
if lastkey()=27
	SALQWMER=".F."
ELSE
	IF FILMER=1
		SALQWMER=".T."
	ELSE
		IF FILMER=2
			STORE 0 TO RESPUESTA
			IF ELIMER("a Listar",-1,1)
				salqwmer="mer.articulo='"+mer.articulo+"'"
			ELSE
				SALQWMER=".F."
			ENDIF
		ELSE
			=QW_PRO3()
			=QW_COL(1,1,'MER.COLOR')
			=QW_LIN(MER.LINEA)
			=QW_MAR(MER.MARCA)
			=QW_RUBR(MER.RUBRO)
			=QW_SRU(MER.SUBRUBRO)
			=QW_GRU(MER.GRUPO)
			=QW_CAG(MER.CAG)
			=QW_MAT(MER.MATERIAL)
			IF FILIMP=1
				TTIMP=""
				QUEIMP=""
			ELSE
				IF FILIMP=2
					TTIMP="Mercader¡a Nacional"
					queimp="MER.NACIONAL"
				ELSE
					TTIMP="Mercader¡a Importada"
					QUEIMP="!MER.IMPORTADA"
				ENDIF
			ENDIF
			FISC=QUEIMP
			fisc=QW_fisc(fisc,queCOL)
			fisc=QW_fisc(fisc,queLIN)
			fisc=QW_fisc(fisc,queMAR)
			fisc=QW_fisc(fisc,queRUB)
			fisc=QW_fisc(fisc,queSRU)
			fisc=QW_fisc(fisc,queGRU)
			fisc=QW_fisc(fisc,queCAG)
			fisc=QW_fisc(fisc,queMAT)
			SALQWMER=IIF(EMPTY(FISC),'.T.',FISC)
			TTQUE=QW_TT(TTCOL)+QW_TT(TTLIN)+QW_TT(TTMAR)+QW_TT(TTRUB)+QW_TT(TTSRU)+QW_TT(TTGRU)+QW_TT(TTCAG)+QW_TT(TTMAT)
		ENDIF
	ENDIF
ENDIF
    wait fisc wind
IF !EMPTY(WONTOP())
	=releWIN('win')
ENDIF
RETURN SALQWMER
