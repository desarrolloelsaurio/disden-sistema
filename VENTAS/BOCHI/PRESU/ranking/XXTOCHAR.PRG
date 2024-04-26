* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : XXTOCHAR.PRG                         บ
* บ COMENTARIO    : CONVIERTE CUALQUIER COSA EN CARACTER บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION XXTOCHAR
PARAMETER XX,XX_LARGO
#DEFINE NUL  0                                 && NUL
#DEFINE ELYES  "SI"                            && ELYES
#DEFINE ELNOU  "NO"                            && ELNOU
PRIVATE XX,TIPO,XX_SALIDA
M.TIPO=TYPE("M.XX")
DO CASE
CASE M.TIPO="U"
   M.XX_SALIDA=""
CASE M.TIPO="N"
   M.XX_SALIDA=ALLTRIM(STR(M.XX,10,IIF(INT(M.XX)=M.XX,NUL,2)))
CASE M.TIPO="D"
   M.XX_SALIDA=DTOC(M.XX)
CASE M.TIPO="L"
   M.XX_SALIDA=IIF(M.XX,ELYES,ELNOU)
CASE M.XX="?"
   CLEA
   STORE "" TO M.XX_SALIDA
   TEXT
   ***********************************************
   FUNCION : XXTOCHAR
   AUTOR   : GREGORIO REINER
   FECHA   : MARZO DE 1992
   ***********************************************
   INPUT   : VARIABLE DE CUALQUIER TIPO
   : LARGO
   OUTPUT  : CARACTER REPRESENTADO POR LA VARIABLE
   SI ES INDEFINIDA. ""
   SI ES NUMERICA  . STR()
   SI ES "?"       . ESTA AYUDA
   SI ES CARACTER  . CARACTER
   SI ES LOGICA    . .T. => "SI"
   . .F. => "NO"
   SI ES FECHA     . DTOC(FECHA)
   USO     : A=XXTOCHAR(A)
   ***********************************************
   ENDTEXT
OTHERWISE
   M.XX_SALIDA=M.XX
ENDCASE
RETURN IIF(EMPTY(XX_LARGO),M.XX_SALIDA,PADR(M.XX_SALIDA,XX_LARGO))
