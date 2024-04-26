FUNCTION FABNT
	PARAMETER LG_PORP
	#DEFINE CRLF CHR(13)+CHR(10)                  && CRLF
	#DEFINE PAIP   "|"                            && PAIP
	LG1_DIJO=ALLTRIM(PROMPT())
	AGRUPA=ALGUN(40," L¡mites de Cantidades ",;
"Completo;"+;
"Cantidades menores que 100;"+;
IIF(ESJEFE(6),"","\\")+"Cantidades mayores que 100")
    IF !EMPTY(AGRUPA)
	DO CASE
	CASE LG1_DIJO="Listados Comunes"
		=LFABNT(LG_PORP)
	CASE LG1_DIJO="por Rubro"
		=FABNTR()
	CASE LG1_DIJO='por Proceso'
		=FABNTP()
	CASE LG1_DIJO='por Taller'
		=FABNTT()
	CASE LG1_DIJO='por Art¡culo'
		=FABNTA()
	CASE LG1_DIJO='de m x de X dias por Rubro'
		=FABNTX1()
	CASE LG1_DIJO="de m s de X d¡as"
		=FABNTX()
	ENDCASE
	ENDIF
RETURN MEN_LIN(BOTOM)
