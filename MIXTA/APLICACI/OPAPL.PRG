* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
* �    File Name: OPAPL.PRG                         �
* �               ABRE BASE MIXTA. TAG APLICACIONES �
* �       Author: G. REINER                         �
* � Date created: 06-29-94                          �
* � Time created: 02:54:10pm                        �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG APLTEX
ELSE
	=MEN_LIN(ABA+"Provincias")
	SELE 1
	=GETDBF('MIXTA','APLTEX','MIX')
ENDIF
RETURN IIF(APLPOP,DEFPOMIX(APLPOPR,APLPOPC),.T.) .AND. MEN_LIN(BOTOM)
