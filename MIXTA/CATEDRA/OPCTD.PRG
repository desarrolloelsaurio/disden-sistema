* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: OPCTD.PRG                                                  �
* �               ABRE BASE MIXTA. TAG CTDICACIONES                          �
* �       Author: G. REINER                                                  �
* � Date created: 06-29-94                                                   �
* � Time created: 02:54:10pm                                                 �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("�",78)                 && BOTOM
FUNCTION OPCTD
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG CTDTEX
ELSE
	=MEN_LIN(ABA+"C�tedras")
	SELE 1
	=GETDBF('MIXTA','CTDTEX','MIX')
ENDIF
RETURN IIF(CTDPOP,DEFPOMIX(CTDPOPR,CTDPOPC),.T.) .AND. MEN_LIN(BOTOM)
