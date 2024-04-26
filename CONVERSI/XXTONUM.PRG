function xxtonum
parameter xx
private xx,tipo,XX_SALIDA
M.TIPO=type("M.XX")
DO CASE
CASE M.TIPO='U'
   M.XX_SALIDA=0
CASE M.TIPO='N'
   M.XX_SALIDA=M.XX
CASE M.TIPO='D'
   M.XX_SALIDA=day(M.XX)
CASE M.TIPO='L'
   M.XX_SALIDA=IIF(M.XX,1,0)
CASE M.XX='?'
   CLEA
   STORE 0 TO M.XX_SALIDA
   TEXT
   ***********************************************
   FUNCION : XXTONUM
   AUTOR   : GREGORIO REINER
   FECHA   : MARZO DE 1992
   ***********************************************
   INPUT   : VARIABLE DE CUALQUIER TIPO
   OUTPUT  : VALOR NUMERICO DADO POR LA VARIABLE
   SI ES INDEFINIDA-> 0
   SI ES NUMERICA  -> NUMERO
   SI ES '?'       -> ESTA AYUDA
   SI ES CARACTER  -> VAL()
   SI ES LOGICA    -> .T. => 1
   -> .F. => 0
   SI ES FECHA     -> FECHA
   USO     : A=XXTONUM(A)
   ***********************************************
ENDTEXT
OTHERWISE
   M.XX_SALIDA=VAL(M.XX)
ENDCASE
return M.XX_SALIDA
