********************************************************************************
*-- Programa: ELIMUT.PRG
*-- Fecha   : 10-07-92 05:12pm
*-- Version : G. REINER
*-- Notas   : ELIGE MUTUAL
********************************************************************************
FUNCTION ELIMUT
PARA msg,r1,c1
SELE MUT
store NUL to respuesta
IF MUTpop
   IF !EMPTY(MSG)
   WAIT "Mutual "+msG WIND NOWA
   ENDIF
   SET ORDER TO taG MUTUALABR
   ACTI POPUP MUTpop
   STOR !empty(respuesta) TO respuesta
ELSE
   ON KEY LABEL F2 RETURN SEEKTECX(10,'MUT','MUTUAL','MUTUALABR','MUTUAL',R1,C1)
	 respuesta=ELIMIX1('Mutual '+msg,'MUT','CODMUT',10)
	 ON KEY LABEL F2
ENDIF
RETURN IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
