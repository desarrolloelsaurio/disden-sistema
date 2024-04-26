FUNCTION SAYPTR
PARAMETER Q_ARR,ENCERO,PPAN
EXTERNAL ARRAY TTR,PAR,TTL
PICUPAN=IIF(PPAN,"@Z #######.##","@Z ####,###,###.##")
?? PAIP
FOR PTR=1 TO 5
   IF Q_ARR=1
      ?? tran(TTR[PTR],PICUPAN)
      IF ENCERO
         STORE 0 TO TTR[PTR]
      ENDIF
   ELSE
      IF Q_ARR=2
         ?? tran(PAR[PTR],PICUPAN)
         IF ENCERO
            STORE TTL[PTR]+PAR[PTR] TO TTL[PTR]
            STORE TTR[PTR]+PAR[PTR] TO TTR[PTR]
         ENDIF
      ELSE
         ?? tran(TTL[PTR],PICUPAN)
      ENDIF
   ENDIF
   IF IMPRESORA .OR. PTR#5
      ?? PAIP
   ENDIF
NEXT
RETURN .T.
