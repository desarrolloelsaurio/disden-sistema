* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMER1.PRG                              บ
* บ COMENTARIO    : DERIVA A LISTADOS DE MERCADERIAS       บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                               บ
* บ FECHA      : 08-29-93                                  บ
* บ HORA       : 10:46:25pm                                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER / VERSION NOVOGAR บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE CRLF CHR(13)+CHR(10)                     && CRLF
=HORA_ULP(PROGRAM())
L_DIJO=ALLTRIM(PROMPT())
IF !EMPTY(L_DIJO)
   STORE "" TO FISC,TTMER,TTQUE
   FILMER=2
   IF QW_MER(4,2,'MER.ARTICULO')
      TT='Listado de Mercaderกas'+;
        CRLF+;
        TTMER
      DO CASE
      CASE L_DIJO='Descripciขn'
         =IIF(PORPAN,LMERPM(),LMERIM())
      CASE L_DIJO='Marcas'
         DO LMERPP
      CASE L_DIJO='Legajo'
         DO LMERPJ
      CASE L_DIJO='Alimentaciขn/Caracterกsticas'
         DO LMERPC
      CASE L_DIJO='Caracterกsticas'
         DO LMERI
      ENDCASE
   ENDIF
ENDIF
RETURN MEN_LIN(BOTOM)
