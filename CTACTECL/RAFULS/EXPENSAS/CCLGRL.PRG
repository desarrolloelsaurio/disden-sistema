FUNCTION CCLGRL
PARAMETER RR,CC
IF ALLTRIM(UPPER(SSTM))="EXPENSAS"
   CCL_TEX="Consorcistas"
ELSE
   CCL_TEX=Q_TIPCLI(.t.)
ENDIF
respuesta='nada#'+STR(RR)+'#'+STR(20)+'#Estado de Cuenta#3;
#\<Deuda de los '+ccl_tex+';
#\<Falta de Recepci¢n de Pagos'
#IF "EXPE" $ CURD()
RESPUESTA=RESPUESTA+"#\<Informe de Per¡odo"
#ENDIF
=defpop()
RETURN .T.