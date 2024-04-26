function xxtofec
parameter xx
private xx,tipo,XX_SALIDA
M.TIPO=type("M.XX")
DO CASE
CASE M.TIPO='U'
   M.XX_SALIDA={}
CASE M.TIPO='N'
   M.XX_SALIDA=(m.xx#0)
CASE M.TIPO='D'
   M.XX_SALIDA=M.XX
CASE M.TIPO='L'
   M.XX_SALIDA=iif(m.tipo,date(),{})
CASE M.XX='?'
   CLEA
   STORE .t. TO M.XX_SALIDA
   TEXT
   ***********************************************
   FUNCION : XXTOFEC
   AUTOR   : GREGORIO REINER
   FECHA   : MARZO DE 1992
   ***********************************************
   INPUT   : VARIABLE DE CUALQUIER TIPO
   OUTPUT  : CARACTER REPRESENTADO POR LA VARIABLE
   SI ES INDEFINIDA-> FECHA VACIA
   SI ES NUMERICA  -> FECHA
   SI ES '?'       -> ESTA AYUDA
   SI ES CARACTER  -> CTOD()
   SI ES LOGICA    -> .T. =>
   SI ES FECHA     -> HOY      => .T.
   OTRO DIA => .F.
   USO     : A=XXTOFEC(A)
   ***********************************************
   ENDTEXT
OTHER
   M.XX_SALIDA=CTOD(m.xx)
ENDCASE
return M.XX_SALIDA
