FUNCTION LDEUPZ0
=working()
=DOTALK()
if variable[5]
   STORE NUL TO PTL[5],ttl[5]
   store .t. to hay,CTRL[5]
ELSE
   rele ttl,ctrl
endif
SELE CCL
set order to
set order to tag CODCLI IN PER
set relation to ccl.CODCLI INTO PER
FIELS="PER.CLIENTE,CCL.CODCLI,ccl.FECHAop,ccl.FECHAVE,ccl.detalle,ccl.compr,CCL.MONTO,CCL.CUOTA"
TMP=GENTMP()
IF TYPE("ORDCLI")#'L' .OR. ORDCLI
   SORT TO (TMP) ;
     ON PER.CODCLI,FECHAOP,FECHAVE ;
     FIELD &FIELS ;
     FOR &FISC
else
   SORT TO (TMP) ;
     ON PER.CLIENTE,FECHAOP,FECHAVE ;
     FIELD &FIELS ;
     FOR &FISC
ENDIF
acla=HAZ_ACLA()
linea=REPL("=",LEN(acla))
SELE CCL
USE (TMP) ALIAS CCL EXCL
GO TOP
ELCLI=CLIENTE
tt='Listado de Deuda Pendiente Clientes'+IIF(!EMPTY(TTQUE),CHR(13)+CHR(10)+TTQUE,'')
=UNTALK()
=unwork()
RETURN .T.
