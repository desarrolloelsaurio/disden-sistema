* зд Program ддддддддддддддддддддддддддддддддддддддд©
* Ё    File Name: OPAPL.PRG                         Ё
* Ё               ABRE BASE MIXTA. TAG APLICACIONES Ё
* Ё       Author: G. REINER                         Ё
* Ё Date created: 06-29-94                          Ё
* Ё Time created: 02:54:10pm                        Ё
* юддддддддддддддддддддддддддддддддддддддддддддддддды
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("╟",78)                 && BOTOM

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG APLTEX
ELSE
	=MEN_LIN(ABA+"Provincias")
	SELE 1
	=GETDBF('MIXTA','APLTEX','MIX')
ENDIF
RETURN IIF(APLPOP,DEFPOMIX(APLPOPR,APLPOPC),.T.) .AND. MEN_LIN(BOTOM)
