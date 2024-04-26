FUNCTION CONSMES0
#DEFINE PAIP   "|"                             && PAIP
#DEFINE NUL    0                               && NUL
PARAMETER ELTOTAL
EXTERNAL ARRAY TOTAL
IF !ELTOTAL
   IF EVAL(ART)#ELART
      DO CASE
      CASE QTIP="P"
      	IF !EMPTY(ELART)
      	 =SAYPER(ELART,"PROCOD")
         ? PAIP
         ?? LEFT(PER.CODCLI,IIF(PORPAN,10,20))
         ?? PAIP
         IF !PORPAN
            ?? LEFT(PER.CLIENTE,15)
            ?? PAIP
         ENDIF
         ENDIF
         PRXART=TMP.PROCOD
         ELMIN=STR(AVIS.STOCKMIN,5)
      CASE QTIP="A"
      	IF !EMPTY(ELART)
         ? PAIP
         ?? LEFT(ELART,IIF(PORPAN,10,20))
         ?? PAIP
         IF !PORPAN
            ?? LEFT(SAYGRL(ELART,"AVIS","AVICODPRO","AVIS.AVIO"),15)
            ***?? LEFT(AVIS.AVIO,15)
            ?? PAIP
         ENDIF
         ENDIF
         PRXART=TMP.AVICODPRO
         ELMIN=STR(AVIS.STOCKMIN,5)
      CASE QTIP="T"
      	IF !EMPTY(ELART)
         ? PAIP
         ?? LEFT(ELART,IIF(PORPAN,10,20))
         ?? PAIP
         IF !PORPAN
            ?? LEFT(SAYGRL(ELART,"TELS","TELCODPRO","TELS.TELA"),15)
            ***?? LEFT(TELS.TELA,15)
            ?? PAIP
         ENDIF
         ENDIF
         PRXART=TMP.TELCODPRO
         ELMIN=STR(TELS.STOCKMIN,5)
      OTHERWISE
      ENDCASE
      IF PORPAN
         ?
      ENDIF
      STORE NUL TO ELTOT
      FOR A=1 TO 12
         ?? STR(MESES[A],5)
         ?? PAIP
         M.ELTOT=M.ELTOT+MESES[A]
      NEXT
      IF !PORPAN
         ?? STR(M.ELTOT,10)
         ?? PAIP
      ENDIF
      ?? ELMIN
      ?? PAIP
      DIME MESES[12]
      STORE NUL TO MESES
      ELART=PRXART
   ENDIF
ELSE
   STORE NUL TO ELTOT
   FOR A=1 TO 12
      ? QMES(A)
      ?? TRANS(TOTAL[A],"9,999,999,999.99") AT 20
      ?? PAIP
      M.ELTOT=M.ELTOT+TOTAL[A]
   NEXT
   IF !PORPAN
      ? "TOTAL:"
      ?? TRANS(ELTOT,"9,999,999,999.99") AT 20
      ?? PAIP
   ENDIF
ENDIF
RETURN
