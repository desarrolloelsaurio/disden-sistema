FUNCTION PARAELI
PARAMETER ELTAG,ELPOP
SET ORDER TO TAG (ELTAG)
IF RECC()>100
   ELTEX=ALLTRIM(INFIC1("Texto a Ubicar",30))
   IF !SEEK(UPPER(ELTEX))
      GO RECNO(0)
   ENDIF
   DO CASE
   CASE ELPOP=1
      ACTI POPUP PERPOP REST
   CASE ELPOP=2
      ACTI POPUP MERPOP REST
   ENDCASE
ELSE
   DO CASE
   CASE ELPOP=1
      ACTI POPUP PERPOP
   CASE ELPOP=2
      ACTI POPUP MERPOP
   ENDCASE
ENDIF
RETURN !EMPTY(RESPUESTA)
