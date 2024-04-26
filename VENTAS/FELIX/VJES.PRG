PROCEDURE VJES
	#DEFINE BOTOM  "  "+repl("°",78)              && BOTOM
	ULPR=HORA_ULP(PROGRAM())
	VJ_DIJO=ALLTRIM(PROMPT())
	DO CASE
	CASE VJ_DIJO="Viaje"
		DO VIA.spr
	CASE VJ_DIJO="Ingresa Factura"
		DO IFACD.SPR WITH .T.,.F.," Factura de Buques "
	CASE VJ_DIJO="Ingresa Nota de Cr‚dito"
		DO IFACD.SPR WITH .T.,.F.," Nota de Cr‚dito de Buques ","NC"
	CASE VJ_DIJO="Ingresa Nota de D‚bito"
		DO IFACD.SPR WITH .T.,.F.," Nota de D‚bito de Buques ","ND"
	CASE VJ_DIJO="Ingresa Gasto"
		DO IFACD.SPR WITH .T.,.T.," Gastos de Buques "
	CASE VJ_DIJO="Corrige Rubro"
	CASE VJ_DIJO="Listados"
		DO LVIA
	ENDCASE
	ULPR=HORA_ULP(PROGRAM())
RETURN MEN_LIN(BOTOM)
