* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : LMER1.PRG                              �
* � COMENTARIO    : DERIVA A LISTADOS DE MERCADERIAS       �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                               �
* � FECHA      : 08-29-93                                  �
* � HORA       : 10:46:25pm                                �
* � COPYRIGHT  : 1993 by GREGORIO REINER / VERSION NOVOGAR �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
=HORA_ULP(PROGRAM())
L_DIJO=ALLTRIM(PROMPT())
IF !EMPTY(L_DIJO)
   STORE "" TO FISC,TTMER,TTQUE
   FILMER=2
   IF QW_MER(4,2,'MER.ARTICULO')
      TT='Listado de Mercader�as'+;
        CRLF+;
        TTMER
      DO CASE
      CASE L_DIJO='Descripci�n'
         =IIF(PORPAN,LMERPM(),LMERIM())
      CASE L_DIJO='Marcas'
         DO LMERPP
      CASE L_DIJO='Legajo'
         DO LMERPJ
      CASE L_DIJO='Alimentaci�n/Caracter�sticas'
         DO LMERPC
      CASE L_DIJO='Caracter�sticas'
         DO LMERI
      ENDCASE
   ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
