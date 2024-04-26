FUNCTION LKARP1
IF KAR.OPK#"04" .AND. KAR.OPK#"05" 
   ? PAIP
   ?? KAR.ARTICULO
   ?? PAIP
   ?? KAR.DOCREF+" "+KAR.NRODOCREF
   ?? PAIP
   IF MER.DISCRIM
      IF EMPTY(KAR.SALIDA)
         ?? STR(KAR.ENTRADA,XACDIGI,2)
         ?? PAIP
         ?? SPACE(XACDIGI)
         ?? PAIP
         TENK=TENK+KAR.ENTRADA
         ?? STR(TTOK+TENK-TSAK,XACDIGI,2)
         ?? PAIP
         ?? PAIP
         ?? STR(KAR.ENPESO,XACDIGI,2)
         ?? PAIP
         ?? SPACE(XACDIGI)
         TENU=TENU+KAR.ENPESO
      ELSE
         ?? SPACE(XACDIGI)
         ?? PAIP
         ?? STR(KAR.SALIDA,XACDIGI,2)
         ?? PAIP
         TSAK=TSAK+KAR.SALIDA
         ?? STR(TTOK+TENK-TSAK,XACDIGI,2)
         ?? PAIP
         ?? PAIP
         ?? SPACE(XACDIGI)
         ?? PAIP
         ?? STR(KAR.ENPESO,XACDIGI,2)
         TSAU=TSAU+KAR.ENPESO
      ENDIF
   ELSE
      ?? SPACE(XACDIGI)
      ?? PAIP
      ?? SPACE(XACDIGI)
      ?? PAIP
      ?? SPACE(XACDIGI)
      ?? PAIP
      ?? PAIP
      IF EMPTY(KAR.SALIDA)
         ?? STR(KAR.ENTRADA,XACDIGI,2)
         ?? PAIP
         ?? SPACE(XACDIGI)
         TENU=TENU+KAR.ENTRADA
      ELSE
         ?? SPACE(XACDIGI)
         ?? PAIP
         ?? STR(KAR.SALIDA,XACDIGI,2)
         TSAU=TSAU+KAR.SALIDA
      ENDIF
   ENDIF
   ?? PAIP
   ?? STR(TTOU+TENU-TSAU,XACDIGI,2)
   ?? PAIP
   STORE CASOS+1 TO CASOS
ENDIF
RETURN .T.
