FUNCTION LKARFP1
IF ELART#KAR.ARTICULO
   IF !EMPTY(M.LACANTIDAD)
      ? PAIP
      ?? ELART
      ?? PAIP
      ?? ELNOM
      ?? PAIP
      POR=M.LACANTIDAD*ELMONTO
      IF M.LACANTIDAD>0
         ?? STR(M.LACANTIDAD,XACDIGI-2)
      ELSE
         ?? REPL("-",XACDIGI-2)
      ENDIF
      ?? PAIP
      IF M.LACANTIDAD>0
         ?? STR(POR,XACDIGI,2)
      ELSE
         ?? REPL("-",XACDIGI)
      ENDIF
      ?? PAIP
      CASOS=CASOS+1
      IF M.LACANTIDAD>0
         ELTOT=ELTOT+POR
      ENDIF
   ENDIF
   STORE NUL TO M.LACANTIDAD
   IF KAR.TIPO=LEFT(ABIOS,1)
      *** SON AVIOS
      ELNOM=AVI.AVIOS
      ELMONTO=AVI.MONTO
   ELSE
      *** SON TELAS
      ELNOM=TEL.TELA
      ELMONTO=TEL.MONTO
   ENDIF
   ELART=KAR.ARTICULO
ENDIF
M.LACANTIDAD=M.LACANTIDAD+KAR.ENTRADA-abs(KAR.SALIDA)
RETURN .T.
