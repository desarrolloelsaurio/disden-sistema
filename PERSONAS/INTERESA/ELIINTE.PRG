FUNCTION ELIINTE
PARAMETER MSG,R1,C1
IF !EMPTY(MSG)
   WAIT "Interesado "+MSG WIND NOWA
ENDIF
SELE PER
IF EMPTY(ON("KEY","F3")) .and. !clipop
   STORE .T. TO BORRAKEY
   ON KEY LABEL F3 ;
   return SEEKTECX(30,"PER","PER.CLIENTE","PER.CODCLI","interesado")
ELSE
   STORE .F. TO BORRAKEY
ENDIF
RESPUESTA=IIF(CLIPOP,;
  PARAELI("INTERESADOS",1),;
  ELIPER1('Interesado '+MSG,'PER','INTCOD',10,"I"))
RETURN WCL() .AND. ;
  IIF(BORRAKEY,OFF_F2(),.T.) .AND. ;
  IIF(LAST()=27 .OR. READKEY()=12,.F.,RESPUESTA)
