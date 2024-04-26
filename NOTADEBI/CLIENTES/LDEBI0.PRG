FUNCTION LDEBI0
? "     Nota de D‚bito sobre la FACTURA : "
SELE ccl
IF XSEEK(FAC.FACTURA,'CCL','NUMERORE')
   IF TYPE("FAC.FACTURA")#"C"
      ?? SUCU
      ?? '-'
      DDD=LDEBI01()
      DDD=XXTONUM(DDD)
      ?? ZERO(ddd,8)
   ELSE
      ?? LDEBI01()
   ENDIF
 
   IF !EMPTY(ccl.detalle)
      ?  "     en concepto de "
      ?? ccl.detalle
   ENDIF
ENDIF
?
IF !EMPTY(FAC.MONTOBRU)
   IF LEFT(FAC.FACTURA,1)="A"
   ? 'MONTO GRAVADO' AT 10
   ?? STR(FAC.MONTOBRU,9,2) AT 70
   ELSE
   ? 'MONTO DEL DEBITO' AT 10
   ?? STR(FAC.MONTOBRU+FAC.MONTOIVA,9,2) AT 70
   ENDIF
ENDIF
IF TYPE("FAC.EXENTO")#'U'
   IF !EMPTY(FAC.EXENTO)
      ? 'MONTO EXENTO' AT 10
      ?? STR(FAC.EXENTO,9,2) AT 70
   ENDIF
ENDIF
SELE fac
RETURN .T.
 
FUNCTION LDEBI01
L_DDD=ALLTRIM(ccl.compr)
L_DDD=rat(" ",L_DDD)
IF EMPTY(L_DDD)
   L_DDD=rat("§",ccl.compr)
   L_DDD=substr(ccl.compr,L_DDD+1)
ELSE
   L_DDD=substr(ccl.compr,L_DDD+1)
ENDIF
RETURN L_DDD
