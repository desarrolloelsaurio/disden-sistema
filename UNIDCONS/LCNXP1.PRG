********************************************************************************
*-- Programa: LCNXP1.PRG
*-- Fecha   : 01-22-92 05:19pm
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE ZONAS DE UN CONSORCIO POR PANTALLA
********************************************************************************
STOR HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
   STORE "" TO CASOS,ACLA,LINEA,TT,FISC,TTL
   =LCNXP10()
   =WIN0()
   PAG=1
   =CABPAN()
   =TIT_LIN(1)
   SCAN
      IF ROW()=21
         IF !FIN_LIN(1,0,PARSE("|SUBTOTAL",STR(TTL,6,2)+" ",LEN(ACLA)))
            EXIT
         ENDIF
         CLEA
         STOR PAG+1 TO PAG
         =CABPAN()
         =TIT_LIN(2)
      ENDIF
      =LCNXP11()
   ENDSCAN
   =FIN_LIN(2,CASOS,PARSE("|SUBTOTAL",STR(TTL,6,2)+" ",LEN(ACLA)))
   =RELEWIN("WIN")
   =IAUD(FISC)
   =REOPCNX()
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
