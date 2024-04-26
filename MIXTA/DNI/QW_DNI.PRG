* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³    File Name: QW_DNI.PRG       ³
* ³       Author: G. REINER        ³
* ³ Date created: 12-19-92 08:54pm ³
* ³    Copyright: GOYO REINER      ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
FUNCTION QW_DNI
PARAMETER CUAL
PRIVATE CUAL
STORE NUL TO DNI_SALIDA
IF FILDNI=2
  QW_COSA=QWDNI(MIXGRL(" Query de I.V.A. ","Condici¢n de I.V.A.","Condiciones de I.V.A."),CUAL)
   IF QW_COSA#".F."
			QW=AT(CHR(250),QW_COSA)
      QUEDNI=LEFT(QW_COSA,QW-1)
			TTDNI=SUBSTR(QW_COSA,QW+1)
   ELSE
      STORE 1 TO FILDNI
   ENDIF
ENDIF
RETURN DNI_SALIDA#2
