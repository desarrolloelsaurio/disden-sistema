PARAMETER PORPAN
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP

STORE NUL TO RESPUESTA
IF ELIPAC("a Listar",-1,1)
   =WORKING()
   =DOTALK()
   SELE LIQ
   TT="Listados de Pr cticas del Paciente"+;
   crlf+;
   alltrim(per.cliente)+"("+alltrim(per.codcli)+")"

   FISC="PACIENTE='"+PER.CODCLI+"'"
   STORE NUL TO CASOS 
   ACLA=PAIP+;
   PADC("NUMERO",10)+PAIP+;
   PADC(" FECHA  ",8)+PAIP+;
   PADC("PRACTICA",30)+PAIP+;
   "SUBCODIGO "+PAIP
   =UNTALK()
   =UNWORK()
  IF PORPAN
      DO LPRAPACP
   ELSE
      DO LPRAPACI
   ENDIF
   IF USED("LIQ")
   SELE LIQ
   ENDIF
ENDIF
RETURN 