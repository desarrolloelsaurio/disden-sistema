* 旼 Program 컴컴컴컴컴컴컴컴컴컴컴�
* �    File Name: QW_DNI.PRG       �
* �       Author: G. REINER        �
* � Date created: 12-19-92 08:54pm �
* �    Copyright: GOYO REINER      �
* 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
FUNCTION QW_DNI
PARAMETER CUAL
PRIVATE CUAL
STORE NUL TO DNI_SALIDA
IF FILDNI=2
  QW_COSA=QWDNI(MIXGRL(" Query de I.V.A. ","Condici줻 de I.V.A.","Condiciones de I.V.A."),CUAL)
   IF QW_COSA#".F."
			QW=AT(CHR(250),QW_COSA)
      QUEDNI=LEFT(QW_COSA,QW-1)
			TTDNI=SUBSTR(QW_COSA,QW+1)
   ELSE
      STORE 1 TO FILDNI
   ENDIF
ENDIF
RETURN DNI_SALIDA#2
