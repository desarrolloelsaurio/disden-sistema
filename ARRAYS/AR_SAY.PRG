FUNCTION AR_SAY
PARAMETER ARREGLO,AR_INI1,FIN,AR_INI,AR_FIN,REN1,COL1,PIC1,COL2,PIC2,COL3,PIC3
PRIV ARREGLO,AR_INI1,FIN,AR_INI,AR_FIN,REN1,COL1,PIC1,COL2,PIC2,COL3,PIC3,PC,CO
IF PARAMETER()<4
   AR_INI=1
   AR_FIN=1
   COL1=1
   PIC1=''
ENDIF
DIME PC[3],CO[3]
PC[1]=PIC1
PC[2]=PIC2
PC[3]=PIC3

CO[1]=COL1
CO[2]=COL2
CO[3]=COL3

REN1=IIF(TYPE("REN1")#'N',0,REN1)
FOR PUNTER=AR_INI1 TO FIN
   FOR PUNTER1=AR_INI TO AR_FIN
      IF AR_INI=AR_FIN .AND. AR_INI=1
         @ REN1,CO[PUNTER1] SAY ARREGLO[PUNTER] PICT PC[PUNTER1]
      ELSE
         @ REN1,CO[PUNTER1] SAY ARREGLO[PUNTER,PUNTER1] PICT PC[PUNTER1]
      ENDIF
   NEXT
   REN1=REN1+1
NEXT
RETURN .T.