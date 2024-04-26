* зд Program дддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддд©
* Ё    File Name: OPCTD.PRG                                                  Ё
* Ё               ABRE BASE MIXTA. TAG CTDICACIONES                          Ё
* Ё       Author: G. REINER                                                  Ё
* Ё Date created: 06-29-94                                                   Ё
* Ё Time created: 02:54:10pm                                                 Ё
* юдддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддддды
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("╟",78)                 && BOTOM
FUNCTION OPCTD
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG CTDTEX
ELSE
	=MEN_LIN(ABA+"CАtedras")
	SELE 1
	=GETDBF('MIXTA','CTDTEX','MIX')
ENDIF
RETURN IIF(CTDPOP,DEFPOMIX(CTDPOPR,CTDPOPC),.T.) .AND. MEN_LIN(BOTOM)
