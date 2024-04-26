FUNCTION IMPROP1
	PARAMETER LAPONE,FISC
	=OPRUB()
	=OPPRO()
	=OPMER()
	DO CASE
	CASE FISC=1
		store nul to respuesta
		if !empty(eliPRO("a Consultar",-1,1))
			sele mer
			fisc="mer.proveedor='"+per.codcli+"'"
			tt=" Por Proveedor: "+alltrim(per.cliente)+" "
		endif
	CASE FISC=2
		store nul to respuesta
		if !empty(elirub("a Consultar",-1,1))
			sele mer
			fisc="mer.rubro='"+left(mix.texto2,3)+"'"
			tt=" Por Rubro: "+alltrim(mix.texto1)+" "
		endif
	ENDCASE
	IF TYPE("FISC")="C"
		SELE MER

		=CARTELX(IIF(LAPONE," Asigna"," Quita")+" IMPORTACION PROPIA "+TT)
		IF CONFIRMA(IIF(LAPONE,"Asignar","Quitar")+" Importación Propia",.t.,20,10)
			=WORKING()
			SELE MER
			SET ORDER TO
			=FLOCK("MER") .OR. FLOK("MER")
			REPL IMPORPROP WITH LAPONE FOR &FISC
			UNLO IN MER
			=UNWORK()
		ENDIF
		=RELEWIN("MENS")
	ENDIF
RETURN RELEWIN("WIN") .AND. MEN_LIN(BOTOM)

