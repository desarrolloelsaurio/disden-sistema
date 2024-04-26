FUNCTION IMPROP
	PARAMETER FISC
	=OPRUB()
	=OPPRO()
	=OPMER()
	DO CASE
	CASE FISC=1
		FISC=".T."
		TT=" Completo "
	CASE FISC=2
		store nul to respuesta
		if !empty(eliPRO("a Consultar",-1,1))
			sele mer
			fisc="mer.proveedor='"+per.codcli+"'"
			tt=" Por Proveedor: "+alltrim(per.cliente)+" "
		endif
	CASE FISC=3
		store nul to respuesta
		if !empty(elirub("a Consultar",-1,1))
			sele mer
			fisc="mer.rubro='"+left(mix.texto2,3)+"'"
			tt=" Por Rubro: "+alltrim(mix.texto1)+" "
		endif
	CASE FISC=4
		store "" to ELTEX
		IF intex("Descripción a Listar",20)
			sele mer
			fisc="'"+alltrim(ELTEX)+"' $ mer.merca"
			tt=" Por Texto: "+alltrim(ELTEX)+" "
		endif
	ENDCASE
	IF TYPE("FISC")="C"
		SELE MER
		SET ORDER TO TAG MERCA
		DEFI WIND WIN FROM 5,1 TO 29,79 TITL "Importación Propia"+TT ;
			FONT "ARIAL",10
		ON KEY LABEL F10 KEYB CHR(23)
		ON KEY LABEL ENTER DO CHIMP

		=CARTELX(" [F10] SALE  / [ENTER] Asigna/Quita IMPORTACION PROPIA ")

		BROW FIEL ARTICULO:P="!!!!!!!!!!" ,;
			MERCA:R:H=PADC("DESCRIPCION",35):P=REPL("!",35) ,;
			ELPRO=SAYPER(PROVEEDOR,"PROCOD"):H=PADC("PROVEEDOR",20):P=REPL("!",20) ,;
			IMPU=IIF(IMPORPROP," SI "," NO "):H="Imp " FOR ;
			&FISC ;
			WIND WIN ;
			FREE MERCA ;
			NOMENU NOEDIT NODELETE

		ON KEY LABEL F10
		ON KEY LABEL ENTER
		=RELEWIN("MENS")
	ENDIF
RETURN RELEWIN("WIN") .AND. MEN_LIN(BOTOM)

FUNCTION CHIMP
	REPL MER.IMPORPROP WITH !MER.IMPORPROP
RETURN .T.
