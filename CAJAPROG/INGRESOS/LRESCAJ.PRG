* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LRESCAJ.PRG                                              บ
* บ COMENTARIO    : RESUMEN DE LOS INGRESOS DE CAJA                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 02-08-94                                                    บ
* บ HORA       : 01:24:43am                                                  บ
* บ COPYRIGHT  : 1994 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION LRESCAJ
PARAMETER PORPAN
=WORKING()
=DOTALK()
CREATE CURSOR CAJTMP ;
  (USUARIO C(10), CAJA C(2), MONEDA C(1), MONTO N(14,2), FECHA D)
SELE CAJTMP
INDEX ON CAJA+MONEDA TAG CAJA
SET ORDER TO TAG CAJA
STORE NUL TO CASOS
SELE CAJ
SET ORDER TO TAG FECHAOP
IF SEEK(M.FECINI)
   SCAN WHILE FECHAOP=M.FECINI
      IF CAJ.CAJA="TA"
         ABUSCAR="TA"
      ELSE
         IF !EMPTY(CAJ.NROCHE)
            ABUSCAR="CH"
         ELSE
            ABUSCAR="00"
         ENDIF
      ENDIF
      SELE CAJTMP
      IF SEEK(ABUSCAR+CAJ.MONEDA)
         REPL CAJTMP.MONTO WITH CAJTMP.MONTO+CAJ.MONTO
      ELSE
         M.USUARIO=CAJ.USUARIO
         M.CAJA=M.ABUSCAR
         M.MONEDA=CAJ.MONEDA
         M.MONTO=CAJ.MONTO
         =AGRABAR("CAJTMP")
      ENDIF
      SELE CAJ
   ENDSCAN
ENDIF
SELE CAJTMP
INDEX ON USUARIO TAG USUAR1 UNIQ
SET ORDER TO TAG USUAR1
COUNT TO CANT_USU
SET ORDER TO
ACLA=PAIP+PADC("TIPO",20)+PAIP+;
  "MON"+PAIP+;
  PADC("MONTO",XACDIGI)+PAIP
LINEA=REPL("=",LEN(ACLA))
TT="Resumen de Ingresos de Fecha "+dtoc(m.fecini)
STORE NUL TO TTL
=UNTALK()
=UNWORK()
=IIF(PORPAN,LRESCAJP(),LRESCAJI())
USE IN CAJTMP
RETURN .T.
 
FUNCTION LRESCAJ1
? PAIP
DO CASE
CASE CAJA="00"
   LAC="EFECTIVO"
CASE CAJA="CH"
      LAC="CHEQUES"
OTHER
      LAC="TARJETAS"
ENDCASE
?? PADR(LAC,20)
?? PAIP
?? " "+MONEDA+" "
?? PAIP
?? STR(MONTO,XACDIGI,2)
?? PAIP
CASOS=CASOS+1
TTL=TTL+MONTO
RETURN .T.
 
FUNCTION LRESCAJ2
PARAMETER L_TEX
RETURN PAIP+;
  PADR(L_TEX,20)+PAIP+;
  SPACE(3)+PAIP+;
  STR(TTL,XACDIGI,2)+PAIP
