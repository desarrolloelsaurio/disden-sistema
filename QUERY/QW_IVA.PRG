* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_IVA.PRG       �
* �       Author: G. REINER        �
* � Date created: 12-19-92 08:54pm �
* �    Copyright: GOYO REINER      �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_IVA
PARAMETER CUAL
PRIVATE CUAL
STORE NUL TO IVA_SALIDA
IF FILIVA=2
  QW_COSA=QWIVA(MIXGRL(" Query de I.V.A. ","Condici줻 de I.V.A.","Condiciones de I.V.A."),CUAL)
   IF QW_COSA#".F."
			QW=AT(CHR(250),QW_COSA)
      QUEIVA=LEFT(QW_COSA,QW-1)
			TTIVA=SUBSTR(QW_COSA,QW+1)
   ELSE
      STORE 1 TO FILIVA
   ENDIF
ENDIF
RETURN IVA_SALIDA#2
